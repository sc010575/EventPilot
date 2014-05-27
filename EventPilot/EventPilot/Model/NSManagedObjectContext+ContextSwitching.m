//
//  NSManagedObjectContext+ContextSwitching.m
//  OSMapFinder
//
//  Created by Gilbert Jolly on 21/03/2014.
//  Copyright (c) 2014 Ordnance Survey. All rights reserved.
//

#import "NSManagedObjectContext+ContextSwitching.h"

@implementation NSManagedObjectContext (ContextSwitching)

- (id)objectForID:(NSManagedObjectID*)objectID
{
    NSError *error;
    id managedObject = (id)[self existingObjectWithID:objectID error:&error];

    if (error) {
        NSLog(@"Error Switching Contexts %@", error);
    }
    return managedObject;
}

@end
