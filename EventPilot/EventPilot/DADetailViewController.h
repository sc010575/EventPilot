//
//  DADetailViewController.h
//  EventPilot
//
//  Created by Suman Chatterjee on 26/05/2014.
//  Copyright (c) 2014 Suman Chatterjee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DADetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
