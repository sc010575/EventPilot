//
//  DADownloadService.m
//  ScanAndTell
//
//  Created by Suman Chatterjee on 15/03/2014.
//  Copyright (c) 2014 Suman Chatterjee. All rights reserved.
//

#import "DADownloadService.h"
#import "AFHTTPRequestOperation.h"
#import "AFURLSessionManager.h"
#import "DAResultResponse.h"
#import "DAResourceLoader.h"
#import "DAEventParseOperation.h"
#import "Dropbox.h"


@interface DADownloadService ()
@property (strong, nonatomic) DAResultResponse *results;
@property (strong, nonatomic) NSMutableArray *downloadQueue;
@property (nonatomic) NSOperationQueue *parseQueue;     // queue that manages our NSOperation
@property (assign, nonatomic) BOOL isBusy;
-(void) start;
-(void) update;
@end

@implementation DADownloadService

+ (instancetype) shared
{
    static dispatch_once_t pred;
    static id sharedInstance = nil;
    
    dispatch_once(&pred, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}


-(id) init
{
    self = [super init];
    if (self)
    {
        self.operationQueue = [[NSOperationQueue alloc] init];
        self.operationQueue.maxConcurrentOperationCount = 3;
        self.parseQueue = [NSOperationQueue new];
    //    [self.parseQueue addObserver:self forKeyPath:@"operationCount" options:0 context:NULL];
        _results = [DAResultResponse alloc];
        _downloadQueue = [NSMutableArray array];
        self.isBusy = NO;
    }
    return self;
}


-(void)start
{
    if ((_downloadQueue.count > 0 ) && (!_isBusy)){
        
        //one download at a time
        DAResultResponse * request = [_downloadQueue objectAtIndex:0];
        //   [self getResponseForURL:request];
        [self downloadFile:request];
    }
}

-(void)update
{
    [_downloadQueue removeObjectAtIndex:0];
    _isBusy = NO;
    [self start];
}

-(void) getResponseForURL:(DAResultResponse*) response
{
    _isBusy = YES;
    __block DAResultResponse * tempResult = response;
    NSURL *url = [NSURL URLWithString:tempResult.URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
//    operation.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary * resultDict = (NSDictionary*)responseObject;
    //    tempResult.eventLists = (NSArray*) responseObject;
    //    self.results = tempResult;
        [self update];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Location Details"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
    }];
    
    // 5
    [operation start];
}


-(void) downloadFile:(DAResultResponse*) response
{
    _isBusy = YES;
    __block DAResultResponse * tempResult = response;
    NSURL *url = [NSURL URLWithString:tempResult.URL];
    
    //configure session
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    // Add Authorization meta data
    [configuration setHTTPAdditionalHeaders:@{@"Authorization": [Dropbox apiAuthorizationHeader]}];

    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
  
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSLog(@"File downloaded to: %@", filePath);
        if( (filePath == nil) || error)
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Download Error"
                                                                message:[error localizedDescription]
                                                               delegate:nil
                                                      cancelButtonTitle:@"Ok"
                                                      otherButtonTitles:nil];
            [alertView show];
            
        }
        else{
            //parse the file and load it to the database
            DAEventParseOperation *eventPArseOperation = [[DAEventParseOperation alloc] init];
            //add to the queue
            [self.parseQueue addOperation:eventPArseOperation];
        }
        [self update];

    }];
    [downloadTask resume];
}


-(void) requestForADownload:(NSString*)URL
{
    [_downloadQueue addObject:URL];
    [self start];
}


// observe the queue's operationCount, stop activity indicator if there is no operatation ongoing.
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == self.parseQueue && [keyPath isEqualToString:@"operationCount"]) {
        
        if (self.parseQueue.operationCount == 0) {
            NSLog(@"Time to send response");
            //send notification that download complete
        }
    }
//    else {
//        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
//    }
}


@end
