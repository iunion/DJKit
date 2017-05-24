//
//  UIImage+Assets.m
//  DJkit
//
//  Created by DennisDeng on 2017/3/20.
//  Copyright © 2017年 DennisDeng. All rights reserved.
//

#import "UIImage+Assets.h"

@implementation UIImage (Assets)

+ (UIImage *)appIconImage
{
    NSDictionary *infoPlist = [[NSBundle mainBundle] infoDictionary];
    
    //id ccc = [infoPlist valueForKeyPath:@"CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles"];
    NSString *iconName = [[infoPlist valueForKeyPath:@"CFBundleIcons.CFBundlePrimaryIcon.CFBundleIconFiles"] lastObject];
    if (iconName)
    {
        UIImage *icon = [UIImage imageNamed:iconName];
        return icon;
    }

    return nil;
}


+ (NSString *)splashImageNameForOrientation:(UIInterfaceOrientation)orientation
{
    CGSize viewSize = [UIScreen mainScreen].bounds.size;
    
    NSString *viewOrientation = @"Portrait";
    
    if (UIDeviceOrientationIsLandscape((UIDeviceOrientation)orientation))
    {
        viewSize = CGSizeMake(viewSize.height, viewSize.width);
        viewOrientation = @"Landscape";
    }
    
    NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary *dict in imagesDict)
    {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]])
        {
            return dict[@"UILaunchImageName"];
        }
    }
    
    return nil;
}

+ (UIImage *)splashImageForOrientation:(UIInterfaceOrientation)orientation
{
    NSString *imageName = [self splashImageNameForOrientation:orientation];
    if (imageName)
    {
        UIImage *image = [UIImage imageNamed:imageName];
        return image;
    }
    
    return nil;
}

@end
