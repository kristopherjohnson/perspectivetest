//
//  PerspectiveTestAppDelegate.h
//  PerspectiveTest
//
//  Created by Kristopher Johnson on 2/14/10.
//  Copyright Capable Hands Technologies, Inc. 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PerspectiveTestViewController;

@interface PerspectiveTestAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PerspectiveTestViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PerspectiveTestViewController *viewController;

@end

