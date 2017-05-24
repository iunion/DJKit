//
//  UIDevice+Category.h
//  DJkit
//
//  Created by DennisDeng on 12-1-11.
//  Copyright (c) 2012年 DennisDeng. All rights reserved.
//

@import Foundation;
@import UIKit;

@interface UIDevice (Category)

/**
 *  平台
 *  Returns the device platform string
 *  Example: "iPhone7,2"
 *
 *  @return Returns the device platform string
 */
+ (NSString * _Nonnull)devicePlatform;
/**
 *  设备型号
 *  Returns the user-friendly device platform string
 *  Example: "iPad Air (Cellular)"
 *
 *  @return Returns the user-friendly device platform string
 */
+ (NSString * _Nonnull)devicePlatformString;

/**
 *  Check if the current device is an iPad
 *
 *  @return Returns YES if it's an iPad, NO if not
 */
+ (BOOL)isiPad;

/**
 *  Check if the current device is an iPhone
 *
 *  @return Returns YES if it's an iPhone, NO if not
 */
+ (BOOL)isiPhone;

/**
 *  Check if the current device is an iPod
 *
 *  @return Returns YES if it's an iPod, NO if not
 */
+ (BOOL)isiPod;

/**
 *  Check if the current device is an Apple TV
 *
 *  @return Returns YES if it's an Apple TV, NO if not
 */
+ (BOOL)isAppleTV;

/**
 *  Check if the current device is an Apple Watch
 *
 *  @return Returns YES if it's an Apple Watch, NO if not
 */
+ (BOOL)isAppleWatch;

/**
 *  Check if the current device is the simulator
 *
 *  @return Returns YES if it's the simulator, NO if not
 */
+ (BOOL)isSimulator;

/**
 *  Check if the current device has a Retina display
 *
 *  @return Returns YES if it has a Retina display, NO if not
 */
+ (BOOL)isRetina;// DEPRECATED_MSG_ATTRIBUTE("Use +isRetina in UIScreen class");

/**
 *  Check if the current device has a Retina HD display
 *
 *  @return Returns YES if it has a Retina HD display, NO if not
 */
+ (BOOL)isRetinaHD;// DEPRECATED_MSG_ATTRIBUTE("Use +isRetinaHD in UIScreen class");

/**
 *  Returns the iOS version without the subversion
 *  Example: 7
 *
 *  @return Returns the iOS version
 */
+ (CGFloat)iOSVersion;

/**
 *  Returns the current device CPU frequency
 *
 *  @return Returns the current device CPU frequency
 */
+ (NSUInteger)cpuFrequency;

/**
 *  Returns the current device BUS frequency
 *
 *  @return Returns the current device BUS frequency
 */
+ (NSUInteger)busFrequency;

/**
 *  Returns the current device RAM size
 *
 *  @return Returns the current device RAM size
 */
+ (NSUInteger)ramSize;

/**
 *  CPU核心数
 *  Returns the current device CPU number
 *
 *  @return Returns the current device CPU number
 */
+ (NSUInteger)cpuNumber;
+ (NSUInteger)cpuAvailableCount;

/**
 *  内存总量
 *  Returns the current device total memory
 *
 *  @return Returns the current device total memory
 */
+ (NSUInteger)totalMemory;

/**
 *  已用内存
 *  Returns the current device non-kernel memory
 *
 *  @return Returns the current device non-kernel memory
 */
+ (NSUInteger)userMemory;

/**
 * 内存余量
 */
+ (NSUInteger)freeMemory;

+ (NSUInteger)maxSocketBufferSize;

/**
 *  磁盘总大小
 *  Returns the current device total disk space
 *
 *  @return Returns the current device total disk space
 */
+ (NSNumber * _Nonnull)totalDiskSpace;
+ (NSString * _Nonnull)totalDiskSpaceString;

/**
 * 已用磁盘空间
 */
+ (NSNumber * _Nonnull)usedDiskSpace;
+ (NSString * _Nonnull)usedDiskSpaceString;

/**
 *  剩余磁盘空间
 *  Returns the current device free disk space
 *
 *  @return Returns the current device free disk space
 */
+ (NSNumber * _Nonnull)freeDiskSpace;
+ (NSString * _Nonnull)freeDiskSpaceString;

/**
 * 设备名称
 */
+ (NSString * _Nonnull)deviceName;

/**
 * 系统版本
 */
+ (NSString * _Nonnull)OSVersion;

/**
 * 是否支持多任务
 */
+ (BOOL)isMultitaskingSupported;

/**
 * 是否越狱
 */
+ (BOOL)hasJailBroken;

@end
