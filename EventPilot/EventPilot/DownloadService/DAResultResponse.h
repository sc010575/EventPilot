//
//  DAResultResponse.h
//  ScanAndTell
//
//  Created by Suman Chatterjee on 17/03/2014.
//  Copyright (c) 2014 Suman Chatterjee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DAResultResponse : NSObject

@property (strong, nonatomic) NSString * requestID;
@property (strong, nonatomic) NSString * URL;
@property (strong, nonatomic) NSArray  * eventLists;

-(id)initWithRequestID:(NSString*)request andURL:(NSString*)URL;
@end
