// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Categories.m instead.

#import "_Categories.h"

const struct CategoriesAttributes CategoriesAttributes = {
	.categoryName = @"categoryName",
};

const struct CategoriesRelationships CategoriesRelationships = {
	.events = @"events",
};

@implementation CategoriesID
@end

@implementation _Categories

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Categories" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Categories";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Categories" inManagedObjectContext:moc_];
}

- (CategoriesID*)objectID {
	return (CategoriesID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic categoryName;

@dynamic events;

- (NSMutableSet*)eventsSet {
	[self willAccessValueForKey:@"events"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"events"];

	[self didAccessValueForKey:@"events"];
	return result;
}

@end

