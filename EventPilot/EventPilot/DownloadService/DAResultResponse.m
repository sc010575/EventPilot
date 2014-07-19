//
//  DAResultResponse.m
//  ScanAndTell
//
//  Created by Suman Chatterjee on 17/03/2014.
//  Copyright (c) 2014 Suman Chatterjee. All rights reserved.
//

#import "DAResultResponse.h"

@interface DAResultResponse()


@end

@implementation DAResultResponse

-(id) initWithRequestID:(NSString*)request andURL:(NSString*)URL;
{
    self = [super init];
    if(self){
    self.requestID = request;
    self.URL = URL;
    }
    return self;
}

@end
