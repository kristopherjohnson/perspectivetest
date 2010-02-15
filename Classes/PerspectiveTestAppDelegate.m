//
//  PerspectiveTestAppDelegate.m
//  PerspectiveTest
//
//  Created by Kristopher Johnson on 2/14/10.
//  Copyright Capable Hands Technologies, Inc. 2010. All rights reserved.
//

#import "PerspectiveTestAppDelegate.h"
#import "PerspectiveTestViewController.h"

@implementation PerspectiveTestAppDelegate

@synthesize window;
@synthesize viewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
