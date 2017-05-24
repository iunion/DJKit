//
//  AppDelegate.m
//  DJKitSample
//
//  Created by DJ on 2017/5/19.
//  Copyright © 2017年 DJ. All rights reserved.
//

#import "AppDelegate.h"
#import <DJkit.h>
#import <DJTabBarController.h>

#import "TableViewController.h"

#define NAVIGATION_TITLE1 @"DJKit"
#define NAVIGATION_TITLE2 @"Foundation"
#define NAVIGATION_TITLE3 @"UIKit"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    DJTabItemClass *item1 = [[DJTabItemClass alloc] init];
    item1.title = NAVIGATION_TITLE1;
    item1.normalIcon = @"DJKitIcon";
    item1.normalColor = [UIColor colorWithHex:0x666666];
    item1.selectedColor = [UIColor redColor];

    DJTabItemClass *item2 = [[DJTabItemClass alloc] init];
    item2.title = NAVIGATION_TITLE2;
    item2.normalIcon = @"FoundationIcon";
    item2.normalColor = [UIColor colorWithHex:0x666666];
    item2.selectedColor = [UIColor redColor];

    DJTabItemClass *item3 = [[DJTabItemClass alloc] init];
    item3.title = NAVIGATION_TITLE3;
    item3.normalIcon = @"UIKitIcon";
    item3.normalColor = [UIColor colorWithHex:0x666666];
    item3.selectedColor = [UIColor redColor];

    NSArray *itemArray = @[item1, item2, item3];
    
    DJTabBarController *tabC = [[DJTabBarController alloc] initWithArray:itemArray];
    
    TableViewController *vc1 = [[TableViewController alloc] initWithStyle:UITableViewStylePlain listArray:@[@"DJNavigationController", @"DJVeryifiTimeManager", @"DJSingleLineView"] type:0];
    vc1.title = item1.title;
    DJNavigationController *nc1 = [[DJNavigationController alloc] initWithRootViewController:vc1];
    TableViewController *vc2 = [[TableViewController alloc] initWithStyle:UITableViewStylePlain listArray:@[@"NSArray/NSMutableArray", @"NSBundle", @"NSData", @"NSDate", @"NSDictionary/NSMutableDictionary", @"NSNumber/NSDecimalNumber", @"NSObject", @"NSString", @"NSAttributedString"] type:1];
    vc2.title = item2.title;
    DJNavigationController *nc2 = [[DJNavigationController alloc] initWithRootViewController:vc2];
    TableViewController *vc3 = [[TableViewController alloc]  initWithStyle:UITableViewStylePlain listArray:@[@"UIButton", @"UIColor", @"UIDevice", @"UIFont", @"UIImage", @"UIImageView", @"UILabel", @"UITextField", @"UIWindow", @"UIView"] type:2];
    vc3.title = item3.title;
    DJNavigationController *nc3 = [[DJNavigationController alloc] initWithRootViewController:vc3];
    
    tabC.viewControllers = @[nc1, nc2, nc3];
    
    self.window.rootViewController = tabC;
    
    [self.window makeKeyAndVisible];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
