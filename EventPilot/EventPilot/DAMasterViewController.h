//
//  DAMasterViewController.h
//  EventPilot
//
//  Created by Suman Chatterjee on 26/05/2014.
//  Copyright (c) 2014 Suman Chatterjee. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DADetailViewController;

#import <CoreData/CoreData.h>

@interface DAMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) DADetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
