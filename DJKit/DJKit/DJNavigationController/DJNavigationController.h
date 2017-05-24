//
//  DJNavigationController.h
//  DJkit
//
//  Created by DennisDeng on 14-4-1.
//  Copyright (c) 2014年 DennisDeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+DJNavigationController.h"

/// A UINavigationController subclass allowing the interactive pop gesture to be recognized when the navigation bar is hidden or a custom back button is used.
@interface DJNavigationController : UINavigationController

- (void)pushViewController:(UIViewController *)viewController
                  animated:(BOOL)animated __attribute__((objc_requires_super));

@end
