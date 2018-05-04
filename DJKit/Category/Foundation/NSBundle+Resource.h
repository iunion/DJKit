//
//  NSBundle+Resource.h
//  Pods
//
//  Created by DJ on 2018/3/29.
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (Resource)

#pragma mark image
// imageName不带扩展名默认为png
// 其他会自动补齐相应扩展名

+ (nullable UIImage *)bundleImageFromBundleNamed:(NSString *)bundleName imageName:(NSString *)imageName;
+ (nullable UIImage *)bundleAssetsImageFromeBundleName:(NSString *)bundleName assetsName:(NSString *)assetsName imageName:(NSString *)imageName;

- (nullable UIImage *)imageWithImageName:(NSString *)imageName;
- (nullable UIImage *)imageWithAssetsName:(NSString *)assetsName imageName:(NSString *)imageName;

#pragma mark localizedString

+ (NSBundle *)mainLocalizedBundle;
+ (NSBundle *)mainLocalizedBundleWithLanguage:(nullable NSString *)language;

+ (nullable NSBundle *)localizedBundleWithBundleName:(NSString *)bundleName;
+ (nullable NSBundle *)localizedBundleWithBundleName:(NSString *)bundleName language:(nullable NSString *)language;

+ (NSBundle *)localizedBundleWithBundle:(NSBundle *)bundle;
+ (nullable NSBundle *)localizedBundleWithBundle:(NSBundle *)bundle language:(nullable NSString *)language;

+ (nullable NSString *)localizedStringFromBundleNamed:(NSString *)bundleName forKey:(NSString *)key value:(nullable NSString *)value;
+ (nullable NSString *)localizedStringFromBundleNamed:(NSString *)bundleName forKey:(NSString *)key value:(nullable NSString *)value table:(nullable NSString *)table;

- (nullable NSString *)localizedLanguageStringForKey:(NSString *)key value:(nullable NSString *)value;
- (nullable NSString *)localizedLanguageStringForKey:(NSString *)key value:(nullable NSString *)value table:(nullable NSString *)table;

@end

NS_ASSUME_NONNULL_END

