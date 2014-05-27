// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Event.m instead.

#import "_Event.h"

const struct EventAttributes EventAttributes = {
	.eventId = @"eventId",
	.event_Type = @"event_Type",
	.timeStamp = @"timeStamp",
};

const struct EventRelationships EventRelationships = {
};

const struct EventFetchedProperties EventFetchedProperties = {
};

@implementation EventID
@end

@implementation _Event

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Event";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Event" inManagedObjectContext:moc_];
}

- (EventID*)objectID {
	return (EventID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"eventIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"eventId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic eventId;



- (int16_t)eventIdValue {
	NSNumber *result = [self eventId];
	return [result shortValue];
}

- (void)setEventIdValue:(int16_t)value_ {
	[self setEventId:[NSNumber numberWithShort:value_]];
}

- (int16_t)primitiveEventIdValue {
	NSNumber *result = [self primitiveEventId];
	return [result shortValue];
}

- (void)setPrimitiveEventIdValue:(int16_t)value_ {
	[self setPrimitiveEventId:[NSNumber numberWithShort:value_]];
}





@dynamic event_Type;






@dynamic timeStamp;











@end
