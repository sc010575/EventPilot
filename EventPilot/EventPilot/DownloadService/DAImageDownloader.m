//
//  DAImageDownloader.m
//  EventPilot
//
//  Created by Suman Chatterjee on 21/07/2014.
//  Copyright (c) 2014 Suman Chatterjee. All rights reserved.
//
#import "DAImageDownloader.h"
#import "AFURLSessionManager.h"
#import "Dropbox.h"


@implementation DAImageDownloader



+(void) downLoadThumbNailImage:(NSString*) Url withCompletionBlock:(ImageCompletionBlock) completionBlock
{
    NSURL *url = [NSURL URLWithString:Url];
    NSLog(@"logging this url so no warning in starter project %@",url);
    
    // 1
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    // 2
    [config setHTTPAdditionalHeaders:@{@"Authorization": [Dropbox apiAuthorizationHeader]}];
    
    NSURLSession * session = [NSURLSession sessionWithConfiguration:config];
    
    
    // GO GET THUMBNAILS //
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url
                                            completionHandler:^(NSData *data, NSURLResponse *response,
                                                                NSError *error) {
                                                if (!error) {
                                                    UIImage *image = [[UIImage alloc] initWithData:data];
                                                    if(completionBlock)
                                                        completionBlock(image);
                                                } else{
                                                    completionBlock(nil);
                                                }
                                            }];
    
    [dataTask resume];
    
}


@end
