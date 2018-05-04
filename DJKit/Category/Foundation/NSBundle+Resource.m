//
//  NSBundle+Resource.m
//  Pods
//
//  Created by DJ on 2018/3/29.
//
//

#import "NSBundle+Resource.h"

NSString *const kTableDefault = @"Localizable";

static inline NSString *getBundleName(NSString *bundleName)
{
    if ([bundleName rangeOfString:@".bundle"].location != NSNotFound)
    {
        return bundleName;
    }
    
    return [bundleName stringByAppendingPathExtension:@"bundle"];
}

static inline NSString *getAssetsName(NSString *assetsName)
{
    if ([assetsName rangeOfString:@".xcassets"].location != NSNotFound)
    {
        return assetsName;
    }
    
    return [assetsName stringByAppendingPathExtension:@"xcassets"];
}

@implementation NSBundle (Resource)

#pragma mark image

+ (UIImage *)bundleImageFromBundleNamed:(NSString *)bundleName imageName:(NSString *)imageName
{
    NSString *mainBundlePath = [[NSBundle mainBundle] resourcePath];
    NSString *imageFilePath = [[mainBundlePath stringByAppendingPathComponent:getBundleName(bundleName)] stringByAppendingPathComponent:imageName];
    return [UIImage imageWithContentsOfFile:imageFilePath];
}

+ (UIImage *)bundleAssetsImageFromeBundleName:(NSString *)bundleName assetsName:(NSString *)assetsName imageName:(NSString *)imageName
{
    NSString *mainBundlePath = [[NSBundle mainBundle] resourcePath];
    NSString *basePath = [[mainBundlePath stringByAppendingPathComponent:getBundleName(bundleName)] stringByAppendingPathComponent:getAssetsName(assetsName)];
    
    NSString *imageTmpName = [imageName stringByDeletingPathExtension];
    NSString *imagePathName = [imageTmpName stringByAppendingPathExtension:@"imageset"];

    NSString *imageFilePath = [[basePath stringByAppendingPathComponent:imagePathName] stringByAppendingPathComponent:imageName];
    
    return [UIImage imageWithContentsOfFile:imageFilePath];
}

- (UIImage *)imageWithImageName:(NSString *)imageName
{
    if (IS_IOS_8_OR_LATER)
    {
        return [UIImage imageNamed:imageName inBundle:self compatibleWithTraitCollection:nil];
    }
    else
    {
        NSString *bundlePath = [self resourcePath];
        NSString *imageFilePath = [bundlePath stringByAppendingPathComponent:imageName];
        return [UIImage imageWithContentsOfFile:imageFilePath];
    }
}

- (UIImage *)imageWithAssetsName:(NSString *)assetsName imageName:(NSString *)imageName
{
    NSString *bundlePath = [self resourcePath];
    NSString *basePath = [bundlePath stringByAppendingPathComponent:getAssetsName(assetsName)];
    
    NSString *imageTmpName = [imageName stringByDeletingPathExtension];
    NSString *imagePathName = [imageTmpName stringByAppendingPathExtension:@"imageset"];
    
    NSString *imageFilePath = [[basePath stringByAppendingPathComponent:imagePathName] stringByAppendingPathComponent:imageName];
    
    return [UIImage imageWithContentsOfFile:imageFilePath];
}

#pragma mark localizedString

+ (NSBundle *)mainLocalizedBundle
{
    return [NSBundle localizedBundleWithBundle:[NSBundle mainBundle]];
}

+ (NSBundle *)mainLocalizedBundleWithLanguage:(NSString *)language
{
    return [NSBundle localizedBundleWithBundle:[NSBundle mainBundle] language:language];
}

+ (NSBundle *)localizedBundleWithBundleName:(NSString *)bundleName
{
    return [NSBundle localizedBundleWithBundleName:bundleName language:nil];
}

+ (NSBundle *)localizedBundleWithBundleName:(NSString *)bundleName language:(NSString *)language
{
    NSString *mainBundlePath = [[NSBundle mainBundle] resourcePath];
    NSString *basePath = [mainBundlePath stringByAppendingPathComponent:getBundleName(bundleName)];
    NSBundle *bundle = [NSBundle bundleWithPath:basePath];
    return [NSBundle localizedBundleWithBundle:bundle language:language];
}

+ (NSBundle *)localizedBundleWithBundle:(NSBundle *)bundle
{
    return [NSBundle localizedBundleWithBundle:bundle language:nil];
}

+ (NSBundle *)localizedBundleWithBundle:(NSBundle *)bundle language:(NSString *)language
{
    NSString *systemLanguage = nil;
    if (language)
    {
        systemLanguage = language;
    }
    else
    {
        // 这里返回的是app优先语言环境，NSLocal返回的是系统设置
        NSArray *languages = [[NSBundle mainBundle] preferredLocalizations];
        systemLanguage = languages.firstObject;
        
        if ([systemLanguage hasPrefix:@"zh"])
        {
            if ([systemLanguage rangeOfString:@"CN"].location != NSNotFound || [systemLanguage rangeOfString:@"Hans"].location != NSNotFound)
            {
                systemLanguage = @"zh-Hans"; // 简体中文
            }
            else
            { // zh-Hant\zh-HK\zh-TW
                systemLanguage = @"zh-Hant"; // 繁體中文
            }
        }
        else
        {
            systemLanguage = @"en";
        }
    }
    
    NSString *basePath = [bundle pathForResource:language ofType:@"lproj"];
    return [NSBundle bundleWithPath:basePath];
}

+ (NSString *)localizedStringFromBundleNamed:(NSString *)bundleName forKey:(NSString *)key value:(NSString *)value
{
    return [NSBundle localizedStringFromBundleNamed:bundleName forKey:key value:value table:kTableDefault];
}

+ (NSString *)localizedStringFromBundleNamed:(NSString *)bundleName forKey:(NSString *)key value:(NSString *)value table:(NSString *)table
{
    NSString *mainBundlePath = [[NSBundle mainBundle] resourcePath];
    NSString *basePath = [mainBundlePath stringByAppendingPathComponent:getBundleName(bundleName)];
    NSBundle *bundle = [NSBundle bundleWithPath:basePath];

    return [bundle localizedLanguageStringForKey:key value:value table:table];
}

- (NSString *)localizedLanguageStringForKey:(NSString *)key value:(NSString *)value
{
    return [self localizedLanguageStringForKey:key value:value table:kTableDefault];
}

- (NSString *)localizedLanguageStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)table
{
    NSBundle *localizedBundle = [NSBundle localizedBundleWithBundle:self];
    return [localizedBundle localizedStringForKey:key value:value table:table];
}

@end
