//
//  DAAppDelegate.h
//  EventPilot
//
//  Created by Suman Chatterjee on 26/05/2014.
//  Copyright (c) 2014 Suman Chatterjee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DAAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (NSURL *)applicationDocumentsDirectory;

@end
