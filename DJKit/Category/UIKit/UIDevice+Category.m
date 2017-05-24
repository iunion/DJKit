//
//  UIDevice+Category.m
//  DJkit
//
//  Created by DennisDeng on 12-1-11.
//  Copyright (c) 2012年 DennisDeng. All rights reserved.
//

#import "UIDevice+Category.h"
#import "NSString+Category.h"
#include <sys/types.h>
#include <sys/sysctl.h>
#include <sys/socket.h>
#include <net/if.h>
#include <net/if_dl.h>


@implementation UIDevice (Category)

+ (NSString *)devicePlatform
{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    free(machine);
    return platform;
}

+ (NSString *)devicePlatformString
{
    NSString *platform = [self devicePlatform];
    // iPhone
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 2G";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4 (GSM)";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4 (Rev. A)";
    if ([platform isEqualToString:@"iPhone3,3"])    return @"iPhone 4 (CDMA)";
    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5 (GSM)";
    if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (CDMA)";
    if ([platform isEqualToString:@"iPhone5,3"])    return @"iPhone 5C (GSM)";
    if ([platform isEqualToString:@"iPhone5,4"])    return @"iPhone 5C (Global)";
    if ([platform isEqualToString:@"iPhone6,1"])    return @"iPhone 5S (GSM)";
    if ([platform isEqualToString:@"iPhone6,2"])    return @"iPhone 5S (Global)";
    if ([platform isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone8,1"])    return @"iPhone 6S";
    if ([platform isEqualToString:@"iPhone8,2"])    return @"iPhone 6S Plus";
    if ([platform isEqualToString:@"iPhone8,3"])    return @"iPhone SE";
    if ([platform isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    if ([platform isEqualToString:@"iPhone9,1"])    return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone9,3"])    return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus";
    // iPod
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    if ([platform isEqualToString:@"iPod7,1"])      return @"iPod Touch 6G";
    // iPad
    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad 1";
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([platform isEqualToString:@"iPad2,4"])      return @"iPad 2 (32nm)";
    if ([platform isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([platform isEqualToString:@"iPad3,2"])      return @"iPad 3 (CDMA)";
    if ([platform isEqualToString:@"iPad3,3"])      return @"iPad 3 (GSM)";
    if ([platform isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([platform isEqualToString:@"iPad3,5"])      return @"iPad 4 (GSM)";
    if ([platform isEqualToString:@"iPad3,6"])      return @"iPad 4 (CDMA)";
    if ([platform isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    if ([platform isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
    if ([platform isEqualToString:@"iPad4,3"])      return @"iPad Air (China)";
    if ([platform isEqualToString:@"iPad5,3"])      return @"iPad Air 2 (WiFi)";
    if ([platform isEqualToString:@"iPad5,4"])      return @"iPad Air 2 (Cellular)";
    // iPad mini
    if ([platform isEqualToString:@"iPad2,5"])      return @"iPad mini (WiFi)";
    if ([platform isEqualToString:@"iPad2,6"])      return @"iPad mini (GSM)";
    if ([platform isEqualToString:@"iPad2,7"])      return @"iPad mini (CDMA)";
    if ([platform isEqualToString:@"iPad4,4"])      return @"iPad mini 2 (WiFi)";
    if ([platform isEqualToString:@"iPad4,5"])      return @"iPad mini 2 (Cellular)";
    if ([platform isEqualToString:@"iPad4,6"])      return @"iPad mini 2 (China)";
    if ([platform isEqualToString:@"iPad4,7"])      return @"iPad mini 3 (WiFi)";
    if ([platform isEqualToString:@"iPad4,8"])      return @"iPad mini 3 (Cellular)";
    if ([platform isEqualToString:@"iPad4,9"])      return @"iPad mini 3 (China)";
    if ([platform isEqualToString:@"iPad5,1"])      return @"iPad mini 4 (WiFi)";
    if ([platform isEqualToString:@"iPad5,2"])      return @"iPad mini 4 (Cellular)";
    // iPad Pro 9.7
    if ([platform isEqualToString:@"iPad6,3"])      return @"iPad Pro 9.7 (WiFi)";
    if ([platform isEqualToString:@"iPad6,4"])      return @"iPad Pro 9.7 (Cellular)";
    // iPad Pro 12.9
    if ([platform isEqualToString:@"iPad6,7"])      return @"iPad Pro 12.9 (WiFi)";
    if ([platform isEqualToString:@"iPad6,8"])      return @"iPad Pro 12.9 (Cellular)";
    // Apple TV
    if ([platform isEqualToString:@"AppleTV2,1"])   return @"Apple TV 2G";
    if ([platform isEqualToString:@"AppleTV3,1"])   return @"Apple TV 3G";
    if ([platform isEqualToString:@"AppleTV3,2"])   return @"Apple TV 3G";
    if ([platform isEqualToString:@"AppleTV5,3"])   return @"Apple TV 4G";
    // Apple Watch
    if ([platform isEqualToString:@"Watch1,1"])     return @"Apple Watch 38mm";
    if ([platform isEqualToString:@"Watch1,2"])     return @"Apple Watch 42mm";
    // Simulator
    if ([platform isEqualToString:@"i386"])         return @"Simulator";
    if ([platform isEqualToString:@"x86_64"])       return @"Simulator";
    
    return platform;
}

+ (BOOL)isiPad
{
    if ([[[self devicePlatform] substringToIndex:4] isEqualToString:@"iPad"])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+ (BOOL)isiPhone
{
    if ([[[self devicePlatform] substringToIndex:6] isEqualToString:@"iPhone"])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+ (BOOL)isiPod
{
    if ([[[self devicePlatform] substringToIndex:4] isEqualToString:@"iPod"])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+ (BOOL)isAppleTV
{
    if ([[[self devicePlatform] substringToIndex:7] isEqualToString:@"AppleTV"])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+ (BOOL)isAppleWatch
{
    if ([[[self devicePlatform] substringToIndex:5] isEqualToString:@"Watch"])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+ (BOOL)isSimulator
{
    if ([[self devicePlatform] isEqualToString:@"i386"] || [[self devicePlatform] isEqualToString:@"x86_64"])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+ (BOOL)isRetina
{
    if ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && ([UIScreen mainScreen].scale == 2.0 || [UIScreen mainScreen].scale == 3.0))
        return YES;
    else
        return NO;
}

+ (BOOL)isRetinaHD
{
    if ([[UIScreen mainScreen] respondsToSelector:@selector(displayLinkWithTarget:selector:)] && ([UIScreen mainScreen].scale == 3.0))
        return YES;
    else
        return NO;
}

+ (CGFloat)iOSVersion
{
    static float version;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        version = [UIDevice currentDevice].systemVersion.floatValue;
    });
    return version;
}

+ (NSUInteger)getSysInfo:(uint)typeSpecifier
{
    size_t size = sizeof(int);
    int results;
    int mib[2] = {CTL_HW, typeSpecifier};
    sysctl(mib, 2, &results, &size, NULL, 0);
    return (NSUInteger) results;
}

+ (NSUInteger)cpuFrequency
{
    return [self getSysInfo:HW_CPU_FREQ];
}

+ (NSUInteger)busFrequency
{
    return [self getSysInfo:HW_TB_FREQ];
}

+ (NSUInteger)ramSize
{
    return [self getSysInfo:HW_MEMSIZE];
}

+ (NSUInteger)cpuNumber
{
    return [self getSysInfo:HW_NCPU];
}

+ (NSUInteger)cpuAvailableCount
{
    return [self getSysInfo:HW_AVAILCPU];
}

+ (NSUInteger)totalMemory
{
    return [self getSysInfo:HW_PHYSMEM];
}

+ (NSUInteger)userMemory
{
    return [self getSysInfo:HW_USERMEM];
}

+ (NSUInteger)freeMemory
{
    return ([self getSysInfo:HW_PHYSMEM] - [self getSysInfo:HW_USERMEM]);
}

+ (NSUInteger)maxSocketBufferSize
{
    return [self getSysInfo:KIPC_MAXSOCKBUF];
}

+ (NSNumber *)totalDiskSpace
{
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    return [attributes objectForKey:NSFileSystemSize];
}

+ (NSString *)totalDiskSpaceString
{
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    float totalSpace = [[attributes objectForKey:NSFileSystemSize] floatValue];
    return [NSString storeString:totalSpace];
}

+ (NSNumber *)usedDiskSpace
{
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    float totalSpace = [[attributes objectForKey:NSFileSystemSize] floatValue];
    float freeSpace = [[attributes objectForKey:NSFileSystemFreeSize] floatValue];
    float usedSpace = totalSpace - freeSpace;
    
    return [NSNumber numberWithFloat:usedSpace];
}

+ (NSString *)usedDiskSpaceString
{
    // 通过NSFileManager所有信息
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    float totalSpace = [[attributes objectForKey:NSFileSystemSize] floatValue];
    float freeSpace = [[attributes objectForKey:NSFileSystemFreeSize] floatValue];
    float usedSpace = totalSpace - freeSpace;
    return [NSString storeString:usedSpace];
}

+ (NSNumber *)freeDiskSpace
{
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    return [attributes objectForKey:NSFileSystemFreeSize];
}

+ (NSString *)freeDiskSpaceString
{
    NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    float freeSpace = [[attributes objectForKey:NSFileSystemFreeSize] floatValue];
    return [NSString storeString:freeSpace];
}

+ (NSString *)deviceName
{
    return [UIDevice currentDevice].name;
}

+ (NSString *)OSVersion
{
    return [UIDevice currentDevice].systemVersion;
}

+ (BOOL)isMultitaskingSupported
{
    return [[UIDevice currentDevice] isMultitaskingSupported];
}

+ (BOOL)hasJailBroken
{
//    return [MOBFDevice hasJailBroken];
#if !(TARGET_IPHONE_SIMULATOR)
    
//    if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Applications/Cydia.app"]) {
//        return YES;
//    } else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/MobileSubstrate.dylib"]) {
//        return YES;
//    } else if( [[NSFileManager defaultManager] fileExistsAtPath:@"/bin/bash"]) {
//        return YES;
//    } else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/usr/sbin/sshd"]) {
//        return YES;
//    } else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/etc/apt"]) {
//        return YES;
//    } else if ([[NSFileManager defaultManager] fileExistsAtPath:@"/private/var/lib/apt/"]) {
//        return YES;
//    }

//    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"cydia://package/com.example.package"]]) {
//        return YES;
//    }
    
    FILE *f = fopen("/bin/bash", "r");
    if (f != NULL)
    {
        fclose(f);
        return YES;
    }
    fclose(f);
    f = fopen("/Applications/Cydia.app", "r");
    if (f != NULL)
    {
        fclose(f);
        return YES;
    }
    fclose(f);
    f = fopen("/Library/MobileSubstrate/MobileSubstrate.dylib", "r");
    if (f != NULL)
    {
        fclose(f);
        return YES;
    }
    fclose(f);
    f = fopen("/usr/sbin/sshd", "r");
    if (f != NULL)
    {
        fclose(f);
        return YES;
    }
    fclose(f);
    f = fopen("/etc/apt", "r");
    if (f != NULL)
    {
        fclose(f);
        return YES;
    }
    fclose(f);
    
    NSError *error = nil;
    NSString *stringToBeWritten = @"This is a test.";
    [stringToBeWritten writeToFile:@"/private/jailbreaktest.txt" atomically:YES encoding:NSUTF8StringEncoding error:&error];
    [[NSFileManager defaultManager] removeItemAtPath:@"/private/jailbreaktest.txt" error:nil];
    
    if (!error)
    {
        return YES;
    }
    
#endif
    
    //All checks have failed. Most probably, the device is not jailbroken
    return NO;
}

@end
