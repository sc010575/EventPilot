//
//  DAEventParser.h
//  EventPilot
//
//  Created by Suman Chatterjee on 19/07/2014.
//  Copyright (c) 2014 Suman Chatterjee. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ParseCompletionBlock)(BOOL success);

@interface DAEventParseOperation : NSOperation

@end
