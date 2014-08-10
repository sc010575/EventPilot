//
//  DAImageDownloader.h
//  EventPilot
//
//  Created by Suman Chatterjee on 21/07/2014.
//  Copyright (c) 2014 Suman Chatterjee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"

@interface DAImageDownloader : NSOperation

- (id)initWithEvent:(Event *)event;

@end
