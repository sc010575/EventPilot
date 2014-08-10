//
//  DAImageDownloader.m
//  EventPilot
//
//  Created by Suman Chatterjee on 21/07/2014.
//  Copyright (c) 2014 Suman Chatterjee. All rights reserved.
//
#import "DAImageDownloader.h"


@interface DAImageDownloader()

@property (strong, nonatomic) Event * currentEvent;
@property (strong, nonatomic) NSMutableSet * imageSet;

@end


@implementation DAImageDownloader

- (id)initWithEvent:(Event *)event
{
    self = [super init];
    if(self)
    {
        //do initialization
        _currentEvent = event;
    }
    return self;
    
}


- (void)main {
    
    //: Apple recommends using @autoreleasepool block instead of alloc and init NSAutoreleasePool, because blocks are more efficient. You might use NSAuoreleasePool instead and that would be fine.
    @autoreleasepool {
        
        if (self.isCancelled)
            return;
        NSSet * imageArray = _currentEvent.eventimages;
        if(imageArray.count > 0)
        {
            for (NSString * photoURL in imageArray)
            {
                NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:photoURL]];
                if (imageData) {
                    UIImage *downloadedImage = [UIImage imageWithData:imageData];
                    [self.imageSet addObject:downloadedImage];
                }
                else {
                    //error handling as because images are not downloaded
                }
                
              
            }
        }
        
        
        // 5: Cast the operation to NSObject, and notify the caller on the main thread.
//        [(NSObject *)self.delegate performSelectorOnMainThread:@selector(imageDownloaderDidFinish:) withObject:self waitUntilDone:NO];
        
    }
}

- (void)save
{
    Event *event = self.currentEvent;
    [MagicalRecord saveUsingCurrentThreadContextWithBlockAndWait:^(NSManagedObjectContext *localContext) {
        [event addEventimages:self.imageSet];
    }];
}





@end
