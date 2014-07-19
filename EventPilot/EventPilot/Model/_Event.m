// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Event.m instead.

#import "_Event.h"

const struct EventAttributes EventAttributes = {
	.address = @"address",
	.event_Id = @"event_Id",
	.mapImage = @"mapImage",
	.name = @"name",
	.postalCode = @"postalCode",
	.timeStamp = @"timeStamp",
	.type = @"type",
};

const struct EventRelationships EventRelationships = {
	.category = @"category",
	.coordinate = @"coordinate",
	.eventimages = @"eventimages",
};

const struct EventFetchedProperties EventFetchedProperties = {
};

@implementation EventID
@end

@implementation _Event

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Events" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Events";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Events" inManagedObjectContext:moc_];
}

- (EventID*)objectID {
	return (EventID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic address;






@dynamic event_Id;






@dynamic mapImage;






@dynamic name;






@dynamic postalCode;






@dynamic timeStamp;






@dynamic type;






@dynamic category;

	
- (NSMutableSet*)categorySet {
	[self willAccessValueForKey:@"category"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"category"];
  
	[self didAccessValueForKey:@"category"];
	return result;
}
	

@dynamic coordinate;

	

@dynamic eventimages;

	
- (NSMutableSet*)eventimagesSet {
	[self willAccessValueForKey:@"eventimages"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"eventimages"];
  
	[self didAccessValueForKey:@"eventimages"];
	return result;
}
	






@end
