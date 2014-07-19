// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Coordinates.h instead.

#import <CoreData/CoreData.h>


extern const struct CoordinatesAttributes {
	__unsafe_unretained NSString *latitude;
	__unsafe_unretained NSString *longitude;
} CoordinatesAttributes;

extern const struct CoordinatesRelationships {
	__unsafe_unretained NSString *event;
} CoordinatesRelationships;

extern const struct CoordinatesFetchedProperties {
} CoordinatesFetchedProperties;

@class Event;




@interface CoordinatesID : NSManagedObjectID {}
@end

@interface _Coordinates : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (CoordinatesID*)objectID;





@property (nonatomic, strong) NSNumber* latitude;



@property double latitudeValue;
- (double)latitudeValue;
- (void)setLatitudeValue:(double)value_;

//- (BOOL)validateLatitude:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* longitude;



@property double longitudeValue;
- (double)longitudeValue;
- (void)setLongitudeValue:(double)value_;

//- (BOOL)validateLongitude:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) Event *event;

//- (BOOL)validateEvent:(id*)value_ error:(NSError**)error_;





@end

@interface _Coordinates (CoreDataGeneratedAccessors)

@end

@interface _Coordinates (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveLatitude;
- (void)setPrimitiveLatitude:(NSNumber*)value;

- (double)primitiveLatitudeValue;
- (void)setPrimitiveLatitudeValue:(double)value_;




- (NSNumber*)primitiveLongitude;
- (void)setPrimitiveLongitude:(NSNumber*)value;

- (double)primitiveLongitudeValue;
- (void)setPrimitiveLongitudeValue:(double)value_;





- (Event*)primitiveEvent;
- (void)setPrimitiveEvent:(Event*)value;


@end
