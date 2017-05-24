//
//  MQTabBarController.m
//  DJkit
//
//  Created by DennisDeng on 15/8/19.
//  Copyright (c) 2015年 DennisDeng. All rights reserved.
//

#import "DJTabBarController.h"
#import "DJkitMacros.h"
#import "UIButton+Category.h"
#import "UIImage+Tint.h"


#define DJTabBar_ItemCount  3

#define ITEM_TAG_START 100000


@interface DJTabBarController ()

// 自定义TabBar的背景Image
@property (nonatomic, strong) UIView *tabBarBgView;

@property (nonatomic, strong) NSMutableArray *tabButtonArray;

@end

@implementation DJTabBarController

- (instancetype)init
{
    @throw [NSException exceptionWithName:NSGenericException reason:@"init not supported, use initWithArray: instead." userInfo:nil];
    return nil;
}

- (instancetype)initWithArray:(NSArray *)itemArray
{
    self = [super init];
    
    if (self)
    {
        NSAssert(itemArray.count>=DJTabBar_ItemCount, @"check define 'DJTabBar_ItemCount'!");

        self.tab_ItemArray = itemArray;
        
        [self addReplaceTabBarView];
    }
    
    return self;
}

// 添加模拟的TabBar
- (void)addReplaceTabBarView
{
    UIImage *originImage = [UIImage imageNamed:@"djtab_bg"];
    UIImage *resizeImage = [originImage stretchableImageWithLeftCapWidth:originImage.size.width/2 topCapHeight:originImage.size.height/2];
    
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"djtab_clear_line"]];
    [self.tabBar setShadowImage:[UIImage imageNamed:@"djtab_clear_line"]];
    
    // 设置背景图
    self.tabBarBgView = [[UIView alloc] initWithFrame:self.tabBar.bounds];
    self.tabBarBgView.userInteractionEnabled = YES;
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, UI_SCREEN_WIDTH, UI_TAB_BAR_HEIGHT)];
    imageview.image = resizeImage;
    [self.tabBarBgView addSubview:imageview];
    
    // 添加Item
    self.tabButtonArray = [NSMutableArray arrayWithCapacity:0];
    NSUInteger tab_Count = DJTabBar_ItemCount;
    CGFloat width = UI_SCREEN_WIDTH/tab_Count;

    for (NSUInteger i=0; i<tab_Count; i++)
    {
        CGRect rect = CGRectMake(width * i, 0, width, UI_TAB_BAR_HEIGHT);
        
        DJTabItemButton *item = [[DJTabItemButton alloc] initWithFrame:rect];
        
        [item addTarget:self action:@selector(selectedTab:) forControlEvents:UIControlEventTouchUpInside];
        
        DJTabItemClass *itemClass = self.tab_ItemArray[i];
        [item freshWithTabItem:itemClass];
        
        item.tag = ITEM_TAG_START+i;
        item.exclusiveTouch = YES;

        [self.tabBarBgView addSubview:item];
        [self.tabButtonArray addObject:item];
        
        if (i == 0)
        {
            // 默认选中第一个VC
            [item setSelected:YES];
        }
    }
    
    [self.tabBar addSubview:self.tabBarBgView];
}

- (void)freshTabItemWithArray:(NSArray *)itemArray
{
    if (self.tab_ItemArray.count != itemArray.count)
    {
        return;
    }
    
    for (NSUInteger index = 0; index<self.tab_ItemArray.count; index++)
    {
        DJTabItemButton *item = self.tabButtonArray[index];
        [item freshWithTabItem:itemArray[index]];
    }
}

// 隐藏原来的tabbar
- (void)hideOriginTabBar
{
    [self.tabBar.subviews enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[UIControl class]])
        {
            UIControl *control = (UIControl *)obj;
            control.hidden = YES;
        }
    }];
}

- (void)setViewControllers:(NSArray *)viewControllers
{
    [super setViewControllers:viewControllers];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    
    [self hideOriginTabBar];
    
    if (self.viewControllers.count > 0)
    {
        return;
    }
    
    [self selectedTabWithIndex:0];
}

- (void)unselectedTab:(DJTabIndex)index
{
    if (index < self.tab_ItemArray.count)
    {
        DJTabItemButton *item = self.tabButtonArray[index];
        item.selected = NO;
    }
}

- (void)selectedTab:(DJTabItemButton *)item
{
    NSUInteger index = [self.tabButtonArray indexOfObject:item];
    
    [self selectedTabWithIndex:index];
}

- (void)selectedTabWithIndex:(DJTabIndex)index
{
    if (index == NSNotFound )
    {
        return;
    }

    if (index == self.selectedIndex )
    {
        return;
    }

    [self unselectedTab:self.selectedIndex];
    
    DJTabItemButton *item = self.tabButtonArray[index];
    item.selected = YES;
    
    switch (index)
    {
        case DJTabIndex_DJKit:
            break;
        case DJTabIndex_Foundation:
            break;
        case DJTabIndex_UIKit:
            break;
        default:
            break;
    }
    
    NSUInteger oldIndex = self.selectedIndex;
    self.selectedIndex = index;
    
    DJNavigationController *nav = [self.viewControllers objectAtIndex:oldIndex];
    if (nav.viewControllers.count > 1)
    {
        [nav popToRootViewControllerAnimated:NO];
    }
    
    [self.tabBarBgView bringToFront];
}

- (void)backTopLeverView:(DJTabIndex)index animated:(BOOL)animated
{
    DJNavigationController *navCtl = [self getCurrentNavigationController];
    if (navCtl.viewControllers.count > 1)
    {
        if (self.selectedIndex == index)
        {
            [navCtl popToRootViewControllerAnimated:animated];
        }
        else
        {
            [navCtl popToRootViewControllerAnimated:NO];
        }
    }
    
    [self selectedTabWithIndex:index];
}

- (DJNavigationController *)getCurrentNavigationController
{
    if ([self.selectedViewController isKindOfClass:[DJNavigationController class]])
    {
        return (DJNavigationController *)self.selectedViewController;
    }
    else
    {
        return nil;
    }
}

- (DJNavigationController *)getNavigationControllerAtTabIndex:(DJTabIndex)index
{
    if (index >= self.viewControllers.count)
    {
        return nil;
    }
    
    id navCtl = [self.viewControllers objectAtIndex:index];
    
    if ([navCtl isKindOfClass:[DJNavigationController class]])
    {
        return (DJNavigationController *)navCtl;
    }
    else
    {
        return nil;
    }
}

// 根据索引找到VC
- (UIViewController *)getViewControllerAtTabIndex:(DJTabIndex)index
{
    DJNavigationController *navCtl = [self getNavigationControllerAtTabIndex:index];
    
    NSArray *carray = navCtl.viewControllers;
    if (![carray isNotEmpty])
    {
        return nil;
    }
    
    UIViewController *vc = [carray objectAtIndex:0];
    return vc;
}

// 此函数只是返回当前tab的RootVC
- (UIViewController *)getCurrentViewController
{
    DJNavigationController *navCtl = [self getCurrentNavigationController];
    
    NSArray *carray = navCtl.viewControllers;
    if (![carray isNotEmpty])
    {
        return nil;
    }
    
    // 获取rootVC
    UIViewController *vc = [carray objectAtIndex:0];
    return vc;
}

@end
