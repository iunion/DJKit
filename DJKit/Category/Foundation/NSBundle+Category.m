//
//  NSBundle+Category.m
//  DJkit
//
//  Created by DennisDeng on 2017/4/13.
//  Copyright © 2017年 DennisDeng. All rights reserved.
//

#import "NSBundle+Category.h"

@implementation NSBundle (Category)

+ (NSString *)resourcePath
{
    return [NSBundle mainBundle].resourcePath;
}

+ (NSString *)bundlePath
{
    return [NSBundle mainBundle].bundlePath;
}

+ (NSString *)applicationPath
{
    return [NSBundle mainBundle].executablePath;
}

+ (NSString *)applicationName
{
    return [NSBundle applicationPath].lastPathComponent;
}

- (NSString *)appName
{
    return self.infoDictionary[@"CFBundleDisplayName"];
}

- (NSString *)version
{
    return self.infoDictionary[@"CFBundleShortVersionString"];
}

- (NSString *)buildVersion
{
    return self.infoDictionary[@"CFBundleVersion"];
}

@end
