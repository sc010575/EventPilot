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
#import "DAEventParser.h"


@interface DADownloadService ()
@property (strong, nonatomic) DAResultResponse *results;
@property (strong, nonatomic) NSMutableArray *downloadQueue;
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
    
    operation.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        tempResult.eventLists = (NSArray*) responseObject;
        self.results = tempResult;
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
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
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
            [DAEventParser parseEventWithBlock:^(BOOL success) {
                //indicated that the event parsing is successful
            }];
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

@end
