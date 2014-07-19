//
//  DAEventParser.m
//  EventPilot
//
//  Created by Suman Chatterjee on 19/07/2014.
//  Copyright (c) 2014 Suman Chatterjee. All rights reserved.
//

#import "DAEventParser.h"
#import "DAResourceLoader.h"
#import "Event.h"
#import "Categories.h"
#import "Coordinates.h"
#import "EventImages.h"


@implementation DAEventParser

+(void) parseEventWithBlock:(ParseCompletionBlock) completionBlock
{
    NSDictionary * parseJSON = [DAResourceLoader JSONWithFileName:@"Events"];
    
    NSArray *eventArray = parseJSON[@"items"];
    for (NSDictionary * individualEvent in eventArray)
    {
        [self processIndividualEvent:individualEvent];
    }
    
    if(completionBlock)
        completionBlock(YES);
}

+(void) processIndividualEvent:(NSDictionary*)eventData
{
    [MagicalRecord saveUsingCurrentThreadContextWithBlock:^(NSManagedObjectContext *localContext) {
        
        Event *event = [Event MR_createInContext:localContext];
        event.event_Id = eventData[@"id"];
        event.name = eventData[@"name"];
        event.postalCode = eventData[@"postcode"];
        event.address = eventData[@"location"];
        event.timeStamp = eventData[@"date"];
        event.type = eventData[@"event-type"];
        
        //Add Category
        NSArray * categoryArray = eventData[@"categories"];
        for (NSString * categoryName in categoryArray)
        {
            Categories * categories = [Categories MR_createInContext:localContext];
            categories.categoryName = categoryName;
            [event addCategoryObject:categories];
        }
        
        //Add Coordinate
        NSDictionary * cordDict = eventData[@"coordinate"];
        Coordinates * coordinates = [Coordinates MR_createInContext:localContext];
        coordinates.longitude = cordDict[@"longitude"];
        coordinates.latitude  = cordDict[@"latitude"];
        event.coordinate = coordinates;
        
        //store event Images
        NSArray *eventImageArray = eventData[@"event-images"];
        for(NSString *imageUrl in eventImageArray)
        {
            EventImages * images = [EventImages MR_createInContext:localContext];
            images.imageUrl = imageUrl;
            [event addEventimagesObject:images];
        }
        
        //save the results in the database and fatch all the pictures
     } completion:^(BOOL success, NSError *error) {
        
        //        dispatch_async([OSProductDownloadService queue], ^{
        //            callback(product);
        //        });
    }];

}
@end
