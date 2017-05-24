//
//  UIImage+Tint.h
//  DJkit
//
//  Created by DennisDeng on 17/3/14.
//  Copyright © 2017年 DennisDeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Tint)

NS_ASSUME_NONNULL_BEGIN

- (UIImage *)imageWithTintColor:(UIColor *)tintColor;
- (UIImage *)imageWithTintColor:(UIColor *)tintColor insets:(UIEdgeInsets)insets;
- (UIImage *)imageWithTintColor:(UIColor *)tintColor rect:(CGRect)rect;

- (UIImage *)imageWithGradientTintColor:(UIColor *)tintColor;
- (UIImage *)imageWithGradientTintColor:(UIColor *)tintColor insets:(UIEdgeInsets)insets;
- (UIImage *)imageWithGradientTintColor:(UIColor *)tintColor rect:(CGRect)rect;

- (UIImage *)imageWithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode;
- (UIImage *)imageWithTintColor:(UIColor *)tintColor rect:(CGRect)rect blendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha;

NS_ASSUME_NONNULL_END

@end
