//
//  UIImageView+Category.h
//  DJkit
//
//  Created by DennisDeng on 15-2-26.
//  Copyright (c) 2015年 DennisDeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (Category)

+ (instancetype)imageViewWithImageNamed:(NSString *)imageName;
+ (instancetype)imageViewWithFrame:(CGRect)frame;
+ (instancetype)imageViewWithStretchableImage:(NSString *)imageName Frame:(CGRect)frame;
+ (instancetype)imageViewWithImageArray:(NSArray *)imageArray duration:(NSTimeInterval)duration;
+ (instancetype)imageViewWithImageArray:(NSArray *)imageArray duration:(NSTimeInterval)duration repeatCount:(NSUInteger)repeatCount;

- (void)setImageWithStretchableImage:(NSString *)imageName;
- (void)setImageWithStretchableImage:(NSString *)imageName atPoint:(CGPoint)point;

// 画水印
// 图片水印
- (void)setImage:(UIImage *)image withWaterMark:(UIImage *)mark inRect:(CGRect)rect;
// 文字水印
- (void)setImage:(UIImage *)image withStringWaterMark:(NSString *)markString inRect:(CGRect)rect color:(UIColor *)color font:(UIFont *)font;
- (void)setImage:(UIImage *)image withStringWaterMark:(NSString *)markString atPoint:(CGPoint)point color:(UIColor *)color font:(UIFont *)font;

@end
NS_ASSUME_NONNULL_END
