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


@interface DADownloadService ()<UINavigationControllerDelegate, NSURLSessionTaskDelegate>

@property (strong, nonatomic) DAResultResponse *results;
@property (strong, nonatomic) NSMutableArray *downloadQueue;
@property (nonatomic) NSOperationQueue *parseQueue; // queue that manages our NSOperation
@property (assign, nonatomic) BOOL isBusy;

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


-(void) downloadFile:(DAResultResponse*) response
{
    _isBusy = YES;
    __block DAResultResponse * tempResult = response;
    NSURL *url = [NSURL URLWithString:tempResult.URL];
    
    //configure session NSURLSessionConfiguration
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    // Add Authorization meta data
    [configuration setHTTPAdditionalHeaders:@{@"Authorization": [Dropbox apiAuthorizationHeader]}];
    
    //Build the Session
    NSURLSession *session =
    [NSURLSession sessionWithConfiguration:configuration
                                  delegate:self
                             delegateQueue:nil];
    
    
    
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithRequest:request completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        NSLog(@"File downloaded to: %@", location);
        if( (location == nil) || error)
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Download Error"
                                                                message:[error localizedDescription]
                                                               delegate:nil
                                                      cancelButtonTitle:@"Ok"
                                                      otherButtonTitles:nil];
            [alertView show];
            
        }
        else{
            
            NSData * data = [NSData dataWithContentsOfURL:location];
            
            //parse the file and load it to the database
            DAEventParseOperation *eventPArseOperation = [[DAEventParseOperation alloc] init];
            eventPArseOperation.downloadData = data;
            
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

