//
//  UIButton+Category.h
//  DJkit
//
//  Created by DennisDeng on 15/7/20.
//  Copyright (c) 2015年 DennisDeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Category)

+ (nonnull instancetype)buttonWithFrame:(CGRect)frame;
+ (nonnull instancetype)buttonWithFrame:(CGRect)frame title:(nullable NSString *)title;

+ (nonnull instancetype)buttonWithFrame:(CGRect)frame title:(nullable NSString *)title backgroundImage:(nullable UIImage *)backgroundImage;
+ (nonnull instancetype)buttonWithFrame:(CGRect)frame title:(nullable NSString *)title backgroundImage:(nullable UIImage *)backgroundImage highlightedBackgroundImage:(nullable UIImage *)highlightedBackgroundImage;

+ (nonnull instancetype)buttonWithFrame:(CGRect)frame title:(nullable NSString *)title color:(nonnull UIColor *)color;
+ (nonnull instancetype)buttonWithFrame:(CGRect)frame title:(nullable NSString *)title color:(nonnull UIColor *)color highlightedColor:(nonnull UIColor *)highlightedColor;

+ (nonnull instancetype)buttonWithFrame:(CGRect)frame color:(nonnull UIColor *)color;
+ (nonnull instancetype)buttonWithFrame:(CGRect)frame color:(nonnull UIColor *)color highlightedColor:(nonnull UIColor *)highlightedColor;

+ (nonnull instancetype)buttonWithFrame:(CGRect)frame imageName:(nonnull NSString *)imageName;
+ (nonnull instancetype)buttonWithFrame:(CGRect)frame image:(nullable UIImage *)image;
+ (nonnull instancetype)buttonWithFrame:(CGRect)frame imageName:(nonnull NSString *)imageName highlightedImageName:(nonnull NSString *)highlightedImageName;
+ (nonnull instancetype)buttonWithFrame:(CGRect)frame image:(nullable UIImage *)image highlightedImage:(nullable UIImage *)highlightedImage;

+ (nonnull instancetype)buttonWithFrame:(CGRect)frame backgroundImageName:(nonnull NSString *)imageName;
+ (nonnull instancetype)buttonWithFrame:(CGRect)frame backgroundImage:(nullable UIImage *)image;
+ (nonnull instancetype)buttonWithFrame:(CGRect)frame backgroundImageName:(nonnull NSString *)imageName highlightedBackgroundImageName:(nonnull NSString *)highlightedImageName;
+ (nonnull instancetype)buttonWithFrame:(CGRect)frame backgroundImage:(nullable UIImage *)image highlightedBackgroundImage:(nullable UIImage *)highlightedImage;

- (void)setImageName:(nonnull NSString *)imageName highlightedImageName:(nonnull NSString *)highlightedImageName;
- (void)setImage:(nullable UIImage *)image highlightedImage:(nullable UIImage *)highlightedImage;
- (void)setImageName:(nonnull NSString *)imageName highlightedImageName:(nonnull NSString *)highlightedImageName selectedImageName:(nonnull NSString *)selectedImageName;
- (void)setImage:(nullable UIImage *)image highlightedImage:(nullable UIImage *)highlightedImage selectedImage:(nullable UIImage *)selectedImage;

- (void)setBackgroundImageName:(nonnull NSString *)imageName highlightedBackgroundImageName:(nonnull NSString *)highlightedImageName;
- (void)setBackgroundImage:(nullable UIImage *)image highlightedBackgroundImage:(nullable UIImage *)highlightedImage;
- (void)setBackgroundImageName:(nonnull NSString *)imageName highlightedBackgroundImageName:(nonnull NSString *)highlightedImageName selectedBackgroundImageName:(nonnull NSString *)selectedImageName;
- (void)setBackgroundImage:(nullable UIImage *)image highlightedBackgroundImage:(nullable UIImage *)highlightedImage selectedBackgroundImage:(nullable UIImage *)selectedImage;

- (void)setTitleColor:(nonnull UIColor *)color;
- (void)setTitleColor:(nonnull UIColor *)color highlightedColor:(nonnull UIColor *)highlightedColor;
- (void)setTitleColor:(nonnull UIColor *)color highlightedColor:(nonnull UIColor *)highlightedColor selectedColor:(nonnull UIColor *)selectedColor;


@end
