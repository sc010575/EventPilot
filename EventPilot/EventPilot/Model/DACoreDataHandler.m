//
//  DACoreDataHandler.m
//  scanBills
//
//  Created by Suman Chatterjee on 05/05/2014.
//  Copyright (c) 2014 Suman Chatterjee. All rights reserved.
//

#import "DACoreDataHandler.h"
#import <KCOrderedAccessorFix/NSManagedObjectModel+KCOrderedAccessorFix.h>

@implementation DACoreDataHandler

+ (void)setupCoreData
{
    [MagicalRecord setupCoreDataStackWithAutoMigratingSqliteStoreNamed:@"EventPilot.sqlite"];
    [[NSManagedObjectModel MR_defaultManagedObjectModel] kc_generateOrderedSetAccessors];  //This line fixes bugs that occur adding objects to an ordered relationship
    
}



@end
