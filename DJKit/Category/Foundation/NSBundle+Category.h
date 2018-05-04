//
//  NSBundle+Category.h
//  DJkit
//
//  Created by DennisDeng on 2017/4/13.
//  Copyright © 2017年 DennisDeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (Category)

+ (nullable NSString *)mainResourcePath;

+ (nonnull NSString *)mainBundlePath;

+ (nullable NSString *)applicationPath;
+ (nullable NSString *)applicationName;

/** The app name. */
@property (nonatomic, assign, readonly, nullable) NSString *appName;

/** The app version. */
@property (nonatomic, assign, readonly, nullable) NSString *version;

/** The app build. */
@property (nonatomic, assign, readonly, nullable) NSString *buildVersion;

@end
