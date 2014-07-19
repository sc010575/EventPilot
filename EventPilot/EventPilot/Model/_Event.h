// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Event.h instead.

#import <CoreData/CoreData.h>


extern const struct EventAttributes {
	__unsafe_unretained NSString *address;
	__unsafe_unretained NSString *event_Id;
	__unsafe_unretained NSString *mapImage;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *postalCode;
	__unsafe_unretained NSString *timeStamp;
} EventAttributes;

extern const struct EventRelationships {
	__unsafe_unretained NSString *category;
	__unsafe_unretained NSString *coordinate;
	__unsafe_unretained NSString *eventimages;
} EventRelationships;

extern const struct EventFetchedProperties {
} EventFetchedProperties;

@class Categories;
@class Coordinates;
@class EventImages;








@interface EventID : NSManagedObjectID {}
@end

@interface _Event : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (EventID*)objectID;





@property (nonatomic, strong) NSString* address;



//- (BOOL)validateAddress:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* event_Id;



//- (BOOL)validateEvent_Id:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSData* mapImage;



//- (BOOL)validateMapImage:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* postalCode;



//- (BOOL)validatePostalCode:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* timeStamp;



//- (BOOL)validateTimeStamp:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *category;

- (NSMutableSet*)categorySet;




@property (nonatomic, strong) Coordinates *coordinate;

//- (BOOL)validateCoordinate:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) NSSet *eventimages;

- (NSMutableSet*)eventimagesSet;





@end

@interface _Event (CoreDataGeneratedAccessors)

- (void)addCategory:(NSSet*)value_;
- (void)removeCategory:(NSSet*)value_;
- (void)addCategoryObject:(Categories*)value_;
- (void)removeCategoryObject:(Categories*)value_;

- (void)addEventimages:(NSSet*)value_;
- (void)removeEventimages:(NSSet*)value_;
- (void)addEventimagesObject:(EventImages*)value_;
- (void)removeEventimagesObject:(EventImages*)value_;

@end

@interface _Event (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveAddress;
- (void)setPrimitiveAddress:(NSString*)value;




- (NSString*)primitiveEvent_Id;
- (void)setPrimitiveEvent_Id:(NSString*)value;




- (NSData*)primitiveMapImage;
- (void)setPrimitiveMapImage:(NSData*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSString*)primitivePostalCode;
- (void)setPrimitivePostalCode:(NSString*)value;




- (NSDate*)primitiveTimeStamp;
- (void)setPrimitiveTimeStamp:(NSDate*)value;





- (NSMutableSet*)primitiveCategory;
- (void)setPrimitiveCategory:(NSMutableSet*)value;



- (Coordinates*)primitiveCoordinate;
- (void)setPrimitiveCoordinate:(Coordinates*)value;



- (NSMutableSet*)primitiveEventimages;
- (void)setPrimitiveEventimages:(NSMutableSet*)value;


@end
