//
//  UIImage+Assets.h
//  DJkit
//
//  Created by DennisDeng on 2017/3/20.
//  Copyright © 2017年 DennisDeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Assets)

/**
 * Returns the App icon.
 * @return The App icon.
 **/
+ (nullable UIImage *)appIconImage;

/**
 * Return the name of the splash image for a given orientation.
 * @param orientation The interface orientation.
 * @return The name of the splash image.
 **/
+ (nullable NSString *)splashImageNameForOrientation:(UIInterfaceOrientation)orientation;

/**
 * Returns the splash image for a given orientation.
 * @param orientation The interface orientation.
 * @return The splash image.
 **/
+ (nullable UIImage *)splashImageForOrientation:(UIInterfaceOrientation)orientation;

@end
