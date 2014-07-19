// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to EventImages.m instead.

#import "_EventImages.h"

const struct EventImagesAttributes EventImagesAttributes = {
	.event_image = @"event_image",
};

const struct EventImagesRelationships EventImagesRelationships = {
	.event = @"event",
};

const struct EventImagesFetchedProperties EventImagesFetchedProperties = {
};

@implementation EventImagesID
@end

@implementation _EventImages

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"EventImages" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"EventImages";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"EventImages" inManagedObjectContext:moc_];
}

- (EventImagesID*)objectID {
	return (EventImagesID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic event_image;






@dynamic event;

	






@end
