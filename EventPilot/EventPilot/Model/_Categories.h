// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Categories.h instead.

#import <CoreData/CoreData.h>

extern const struct CategoriesAttributes {
	__unsafe_unretained NSString *categoryName;
} CategoriesAttributes;

extern const struct CategoriesRelationships {
	__unsafe_unretained NSString *events;
} CategoriesRelationships;

@class Event;

@interface CategoriesID : NSManagedObjectID {}
@end

@interface _Categories : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) CategoriesID* objectID;

@property (nonatomic, strong) NSString* categoryName;

//- (BOOL)validateCategoryName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *events;

- (NSMutableSet*)eventsSet;

@end

@interface _Categories (EventsCoreDataGeneratedAccessors)
- (void)addEvents:(NSSet*)value_;
- (void)removeEvents:(NSSet*)value_;
- (void)addEventsObject:(Event*)value_;
- (void)removeEventsObject:(Event*)value_;

@end

@interface _Categories (CoreDataGeneratedPrimitiveAccessors)

- (NSString*)primitiveCategoryName;
- (void)setPrimitiveCategoryName:(NSString*)value;

- (NSMutableSet*)primitiveEvents;
- (void)setPrimitiveEvents:(NSMutableSet*)value;

@end
