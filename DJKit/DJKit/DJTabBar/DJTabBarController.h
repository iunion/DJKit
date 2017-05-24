//
//  DJTabBarController.h
//  DJkit
//
//  Created by DennisDeng on 15/8/19.
//  Copyright (c) 2015年 DennisDeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DJNavigationController.h"
#import "DJTabItemButton.h"

typedef NS_ENUM(NSUInteger, DJTabIndex)
{
    DJTabIndex_DJKit,
    DJTabIndex_Foundation,
    DJTabIndex_UIKit
};

@interface DJTabBarController : UITabBarController

@property (nonatomic, strong) NSArray<__kindof DJTabItemClass *> *tab_ItemArray;

- (instancetype)initWithArray:(NSArray<__kindof DJTabItemClass *> *)itemArray;

- (void)setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers;

- (void)freshTabItemWithArray:(NSArray<__kindof DJTabItemClass *> *)itemArray;

// 选中某个Tab
- (void)selectedTabWithIndex:(DJTabIndex)index;

// 某个Tab上可能push了很多层，回到初始页面
- (void)backTopLeverView:(DJTabIndex)index animated:(BOOL)animated;

- (DJNavigationController *)getCurrentNavigationController;
- (DJNavigationController *)getNavigationControllerAtTabIndex:(DJTabIndex)index;

// 以下函数只是返回当前tab的RootVC
- (UIViewController *)getCurrentViewController;
// 根据索引找到VC
- (UIViewController *)getViewControllerAtTabIndex:(DJTabIndex)index;

@end
