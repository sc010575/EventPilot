// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to EventImages.h instead.

#import <CoreData/CoreData.h>


extern const struct EventImagesAttributes {
	__unsafe_unretained NSString *event_image;
} EventImagesAttributes;

extern const struct EventImagesRelationships {
	__unsafe_unretained NSString *event;
} EventImagesRelationships;

extern const struct EventImagesFetchedProperties {
} EventImagesFetchedProperties;

@class Event;



@interface EventImagesID : NSManagedObjectID {}
@end

@interface _EventImages : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (EventImagesID*)objectID;





@property (nonatomic, strong) NSData* event_image;



//- (BOOL)validateEvent_image:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Event *event;

//- (BOOL)validateEvent:(id*)value_ error:(NSError**)error_;





@end

@interface _EventImages (CoreDataGeneratedAccessors)

@end

@interface _EventImages (CoreDataGeneratedPrimitiveAccessors)


- (NSData*)primitiveEvent_image;
- (void)setPrimitiveEvent_image:(NSData*)value;





- (Event*)primitiveEvent;
- (void)setPrimitiveEvent:(Event*)value;


@end
