//
//  DAEventParser.m
//  EventPilot
//
//  Created by Suman Chatterjee on 19/07/2014.
//  Copyright (c) 2014 Suman Chatterjee. All rights reserved.
//

#import "DAEventParseOperation.h"
#import "DAResourceLoader.h"
#import "Event.h"
#import "Categories.h"
#import "Coordinates.h"
#import "EventImages.h"
#import "DAImageDownloader.h"

@interface DAEventParseOperation()

@property (strong, nonatomic)ParseCompletionBlock completionBlock;

@property (strong, nonatomic)NSOperationQueue * downloadImageQueue;

@end

@implementation DAEventParseOperation
@synthesize completionBlock = _completionBlock;

-(id) initWithBlock:(ParseCompletionBlock) completionBlock
{
    self = [super init];
    if (self) {
        _completionBlock = completionBlock;
        _downloadImageQueue = [[NSOperationQueue alloc] init];
        _downloadImageQueue.name = @"Download Queue";
        _downloadImageQueue.maxConcurrentOperationCount = 3;
    }
    return self;
    

}
//main
// The main function for this NSOperation, to start the parsing.
- (void)main {
    
    // Creating context in main function here make sure the context is tied to current thread.
    [MagicalRecord saveUsingCurrentThreadContextWithBlock:^(NSManagedObjectContext *localContext) {
        [self parseEventWithContext:localContext];
    } completion:^(BOOL success, NSError *error) {
        NSLog(@"success");
        dispatch_async(dispatch_get_main_queue(), ^{
            _completionBlock(YES);
        });
    }];

    
}


-(void) parseEventWithContext:(NSManagedObjectContext*)context
{
    NSDictionary * parseJSON = [DAResourceLoader readJSONFromDocument:@"document.json"];
    
    NSArray *eventArray = parseJSON[@"items"];
    for (NSDictionary * individualEvent in eventArray)
    {
        [self processIndividualEvent:individualEvent withContext:context];
    }
    
}

-(BOOL) isThisEventIsNew:(NSString*) eventName inContext:(NSManagedObjectContext*) context
{
    NSPredicate *purchasePredicate = [NSPredicate predicateWithFormat:@"name == %@", eventName];
    Event * event = [[Event MR_findAllWithPredicate:purchasePredicate inContext:context]  firstObject];
    return  (!event) ? YES:NO;

}

-(void) processIndividualEvent:(NSDictionary*)eventData withContext:(NSManagedObjectContext*) context
{
    if([self isThisEventIsNew:eventData[@"name"] inContext:context]){
        
        //OK new event add it to the database
        Event *event = [Event MR_createInContext:context];
        event.event_Id = eventData[@"id"];
        event.name = eventData[@"name"];
        event.postalCode = eventData[@"postcode"];
        event.address = eventData[@"location"];
        
        //get the date
        NSString *dateString = eventData[@"date"];;
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        
        // this is imporant - we set our input date format to match our input string
        // if format doesn't match you'll get nil from your string, so be careful
        [dateFormatter setDateFormat:@"yyyy'-'MM'-'dd'T'HH':'mm'-'ss'Z'"];
        NSDate *dateFromString = [[NSDate alloc] init];
        
        dateFromString = [dateFormatter dateFromString:dateString];

   //     event.timeStamp = dateFromString;
        event.type = eventData[@"event-type"];
        
        //Add Category
        NSArray * categoryArray = eventData[@"categories"];
        for (NSString * categoryName in categoryArray)
        {
            Categories * categories = [Categories MR_createInContext:context];
            categories.categoryName = categoryName;
            [event addCategoryObject:categories];
        }
        
        //Add Coordinate
        NSDictionary * cordDict = eventData[@"coordinate"];
        Coordinates * coordinates = [Coordinates MR_createInContext:context];
        coordinates.longitude = cordDict[@"longitude"];
        coordinates.latitude  = cordDict[@"latitude"];
        event.coordinate = coordinates;
        
        //store event Images
        NSArray *eventImageArray = eventData[@"event-images"];
        
        for(NSString *imageUrl in eventImageArray)
        {
            EventImages * images = [EventImages MR_createInContext:context];
            images.imageUrl = imageUrl;
            [event addEventimagesObject:images];
        }
        
        //Download Images
        DAImageDownloader* imageDownLoader = [[DAImageDownloader alloc] initWithEvent:event];
        [_downloadImageQueue addOperation:imageDownLoader];
        
    }
}
@end
