//
//  NSManagedObjectContext+ContextSwitching.h
//  OSMapFinder
//
//  Created by Gilbert Jolly on 21/03/2014.
//  Copyright (c) 2014 Ordnance Survey. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (ContextSwitching)

- (id)objectForID:(NSManagedObjectID*)objectID;

@end
