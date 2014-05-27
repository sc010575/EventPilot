// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Event.h instead.

#import <CoreData/CoreData.h>


extern const struct EventAttributes {
	__unsafe_unretained NSString *eventId;
	__unsafe_unretained NSString *event_Type;
	__unsafe_unretained NSString *timeStamp;
} EventAttributes;

extern const struct EventRelationships {
} EventRelationships;

extern const struct EventFetchedProperties {
} EventFetchedProperties;






@interface EventID : NSManagedObjectID {}
@end

@interface _Event : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (EventID*)objectID;





@property (nonatomic, strong) NSNumber* eventId;



@property int16_t eventIdValue;
- (int16_t)eventIdValue;
- (void)setEventIdValue:(int16_t)value_;

//- (BOOL)validateEventId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* event_Type;



//- (BOOL)validateEvent_Type:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* timeStamp;



//- (BOOL)validateTimeStamp:(id*)value_ error:(NSError**)error_;






@end

@interface _Event (CoreDataGeneratedAccessors)

@end

@interface _Event (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveEventId;
- (void)setPrimitiveEventId:(NSNumber*)value;

- (int16_t)primitiveEventIdValue;
- (void)setPrimitiveEventIdValue:(int16_t)value_;




- (NSString*)primitiveEvent_Type;
- (void)setPrimitiveEvent_Type:(NSString*)value;




- (NSDate*)primitiveTimeStamp;
- (void)setPrimitiveTimeStamp:(NSDate*)value;




@end
