//
//  DJkitMacros.h
//  DJkit
//
//  Created by DennisDeng on 15/8/17.
//  Copyright (c) 2015年 DennisDeng. All rights reserved.
//

#ifndef DJkitMacros_h
#define DJkitMacros_h

#pragma mark -
#pragma mark - Device macro

#define IS_IPHONE4  (CGSizeEqualToSize(CGSizeMake(320.0f, 480.0f), [[UIScreen mainScreen] bounds].size) ? YES : NO)
#define IS_IPHONE5  (CGSizeEqualToSize(CGSizeMake(320.0f, 568.0f), [[UIScreen mainScreen] bounds].size) ? YES : NO)
#define IS_IPHONE6  (CGSizeEqualToSize(CGSizeMake(375.0f, 667.0f), [[UIScreen mainScreen] bounds].size) ? YES : NO)
#define IS_IPHONE6P (CGSizeEqualToSize(CGSizeMake(414.0f, 736.0f), [[UIScreen mainScreen] bounds].size) ? YES : NO)

// 获取系统版本
#define CURRENT_SYSTEMVERSION [[UIDevice currentDevice] systemVersion]
#ifndef IOS_VERSION
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#endif

/**
 *  Macros that returns if the iOS version is greater or equal to choosed one
 *
 *  @return Returns a BOOL
 */
#define IS_IOS_5_OR_LATER    (IOS_VERSION >= 5.0f)
#define IS_IOS_6_OR_LATER    (IOS_VERSION >= 6.0f)
#define IS_IOS_7_OR_LATER    (IOS_VERSION >= 7.0f)
#define IS_IOS_8_OR_LATER    (IOS_VERSION >= 8.0f)
#define IS_IOS_9_OR_LATER    (IOS_VERSION >= 9.0f)
#define IS_IOS_10_OR_LATER   (IOS_VERSION >= 10.0f)


/**
 *  Macros to compare system versions
 *
 *  @param v Version, like @"8.0"
 *
 *  @return Return a BOOL
 */
// 检查系统版本
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define APP_VERSIONNO [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"]
#define APP_BUILDNO [[NSBundle mainBundle] infoDictionary][@"CFBundleVersion"]

// 获取当前语言
#define CurrentLanguage [[NSLocale preferredLanguages] objectAtIndex:0]

// 判断是否IPHONE
#if TARGET_OS_IPHONE
// iPhone Device
#endif

// 判断是真机还是模拟器
#if TARGET_IPHONE_SIMULATOR
// iPhone Simulator
#endif


#pragma mark -
#pragma mark - data change macro

// 由角度获取弧度 由弧度获取角度
#define DEGREES_TO_RADIANS(x)       ((x) * (M_PI / 180.0))
#define RADIANS_TO_DEGREES(x)       ((x) * (180.0 / M_PI))

//RGB color macro
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#pragma mark -
#pragma mark - Func

// 测试
//#ifdef __OPTIMIZE__
//#define USE_TEST_HELP           0
//#else
//#define USE_TEST_HELP           1
//#endif


#pragma mark -
#pragma mark - Log

#ifndef DJLog
#define DJLogF(format, ...) NSLog(@"%s:%i: %@", __FILE__, __LINE__, [NSString stringWithFormat:format, ##__VA_ARGS__]);

#ifdef DEBUG
#define DJLog(format, ...) DJLogF(format, ##__VA_ARGS__);
// 调试用
//#define DJLog(format, ...) while(0){}
//#define DebugLog(format, ...) DJLogF(format, ##__VA_ARGS__);
#else
#define LLog(format, ...) while(0){}
//#define DebugLog(format, ...) while(0){}
#endif
#endif


// DEBUG开关
#ifndef __OPTIMIZE__
#define COMMON_DEBUG    1
#endif

#pragma mark - Text lenth macro



#pragma mark -
#pragma mark - UI macro

#define UI_NAVIGATION_BAR_DEFAULTHEIGHT 44
#define UI_NAVIGATION_BAR_HEIGHT        44
#define UI_TOOL_BAR_HEIGHT              44
#define UI_TAB_BAR_HEIGHT               49
#define UI_STATUS_BAR_HEIGHT            20
#define UI_SCREEN_WIDTH                 ([[UIScreen mainScreen] bounds].size.width)
#define UI_SCREEN_HEIGHT                ([[UIScreen mainScreen] bounds].size.height)
//#define SCREEN_WIDTH ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)
//#define SCREEN_HEIGHT ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)
#define UI_SCREEN_SCALE                 ([UIScreen mainScreen].scale)
#define UI_MAINSCREEN_HEIGHT            (UI_SCREEN_HEIGHT - UI_STATUS_BAR_HEIGHT)
#define UI_MAINSCREEN_HEIGHT_ROTATE     (UI_SCREEN_WIDTH - UI_STATUS_BAR_HEIGHT)
#define UI_WHOLE_SCREEN_FRAME           CGRectMake(0, 0, UI_SCREEN_WIDTH, UI_SCREEN_HEIGHT)
#define UI_WHOLE_SCREEN_FRAME_ROTATE    CGRectMake(0, 0, UI_SCREEN_HEIGHT, UI_SCREEN_WIDTH)
#define UI_MAIN_VIEW_FRAME              CGRectMake(0, UI_STATUS_BAR_HEIGHT, UI_SCREEN_WIDTH, UI_MAINSCREEN_HEIGHT)
#define UI_MAIN_VIEW_FRAME_ROTATE       CGRectMake(0, UI_STATUS_BAR_HEIGHT, UI_SCREEN_HEIGHT, UI_MAINSCREEN_HEIGHT_ROTATE)

#define UI_IPHONE4_SCREEN_HEIGHT        480.0f
#define UI_IPHONE5_SCREEN_HEIGHT        568.0f
#define UI_IPHONE6_SCREEN_HEIGHT        667.0f
#define UI_IPHONE6P_SCREEN_HEIGHT       736.0f

// 单像素
#define SINGLE_LINE_WIDTH           (1 / [UIScreen mainScreen].scale)
#define SINGLE_LINE_ADJUST_OFFSET   ((1 / [UIScreen mainScreen].scale) / 2)
// UIView *view = [[UIView alloc] initWithFrame:CGrect(x - SINGLE_LINE_ADJUST_OFFSET, 0, SINGLE_LINE_WIDTH, 100)];


// 弱引用 weakSelf
#define DJWeakSelf __weak typeof(self) weakSelf = self;
#define DJStrongSelf __strong typeof(self) strongSelf = weakSelf;

#endif
