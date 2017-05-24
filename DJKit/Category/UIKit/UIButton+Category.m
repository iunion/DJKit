//
//  UIButton+Category.m
//  DJkit
//
//  Created by DennisDeng on 15/7/20.
//  Copyright (c) 2015年 DennisDeng. All rights reserved.
//

#import "UIButton+Category.h"
#import "UIImage+Category.h"


@implementation UIButton (Category)

+ (instancetype)buttonWithFrame:(CGRect)frame
{
    return [UIButton buttonWithFrame:frame title:nil];
}

+ (instancetype)buttonWithFrame:(CGRect)frame title:(NSString *)title
{
    return [UIButton buttonWithFrame:frame title:title backgroundImage:nil];
}

+ (instancetype)buttonWithFrame:(CGRect)frame title:(NSString *)title backgroundImage:(UIImage *)backgroundImage
{
    return [UIButton buttonWithFrame:frame title:title backgroundImage:backgroundImage highlightedBackgroundImage:nil];
}

+ (instancetype)buttonWithFrame:(CGRect)frame title:(NSString *)title backgroundImage:(UIImage *)backgroundImage highlightedBackgroundImage:(UIImage *)highlightedBackgroundImage
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    [button setBackgroundImage:highlightedBackgroundImage forState:UIControlStateHighlighted];
    
    return button;
}

+ (instancetype)buttonWithFrame:(CGRect)frame title:(NSString *)title color:(UIColor *)color
{
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    return [UIButton buttonWithFrame:frame title:title backgroundImage:[UIImage imageWithColor:color] highlightedBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:components[0]-0.1 green:components[1]-0.1 blue:components[2]-0.1 alpha:1]]];
}

+ (instancetype)buttonWithFrame:(CGRect)frame title:(NSString *)title color:(UIColor *)color highlightedColor:(UIColor *)highlightedColor
{
    return [UIButton buttonWithFrame:frame title:title backgroundImage:[UIImage imageWithColor:color] highlightedBackgroundImage:[UIImage imageWithColor:highlightedColor]];
}

+ (instancetype)buttonWithFrame:(CGRect)frame color:(UIColor *)color
{
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    return [UIButton buttonWithFrame:frame title:nil backgroundImage:[UIImage imageWithColor:color] highlightedBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:components[0]-0.1 green:components[1]-0.1 blue:components[2]-0.1 alpha:1]]];
}

+ (instancetype)buttonWithFrame:(CGRect)frame color:(UIColor *)color highlightedColor:(UIColor *)highlightedColor
{
    return [UIButton buttonWithFrame:frame title:nil backgroundImage:[UIImage imageWithColor:color] highlightedBackgroundImage:[UIImage imageWithColor:highlightedColor]];
}

+ (instancetype)buttonWithFrame:(CGRect)frame imageName:(NSString *)imageName
{
    return [UIButton buttonWithFrame:frame image:[UIImage imageNamed:imageName]];
}

+ (instancetype)buttonWithFrame:(CGRect)frame image:(UIImage *)image
{
    return [UIButton buttonWithFrame:frame image:image highlightedImage:nil];
}

+ (instancetype)buttonWithFrame:(CGRect)frame imageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName
{
    return [UIButton buttonWithFrame:frame image:[UIImage imageNamed:imageName] highlightedImage:[UIImage imageNamed:highlightedImageName]];
}

+ (instancetype)buttonWithFrame:(CGRect)frame image:(UIImage *)image highlightedImage:(UIImage *)highlightedImage
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:highlightedImage forState:UIControlStateHighlighted];
    
    return button;
}

+ (instancetype)buttonWithFrame:(CGRect)frame backgroundImageName:(NSString *)imageName
{
    return [UIButton buttonWithFrame:frame backgroundImage:[UIImage imageNamed:imageName]];
}

+ (instancetype)buttonWithFrame:(CGRect)frame backgroundImage:(UIImage *)image
{
    return [UIButton buttonWithFrame:frame backgroundImage:image highlightedBackgroundImage:nil];
}

+ (instancetype)buttonWithFrame:(CGRect)frame backgroundImageName:(NSString *)imageName highlightedBackgroundImageName:(NSString *)highlightedImageName
{
    return [UIButton buttonWithFrame:frame backgroundImage:[UIImage imageNamed:imageName] highlightedBackgroundImage:[UIImage imageNamed:highlightedImageName]];
}

+ (instancetype)buttonWithFrame:(CGRect)frame backgroundImage:(UIImage *)image highlightedBackgroundImage:(UIImage *)highlightedImage
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
    
    return button;
}

- (void)setImageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName
{
    [self setImage:[UIImage imageNamed:imageName] highlightedImage:[UIImage imageNamed:highlightedImageName]];
}

- (void)setImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage
{
    [self setImage:image highlightedImage:highlightedImage selectedImage:nil];
}

- (void)setImageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName selectedImageName:(NSString *)selectedImageName
{
    [self setImage:[UIImage imageNamed:imageName] highlightedImage:[UIImage imageNamed:highlightedImageName] selectedImage:[UIImage imageNamed:selectedImageName]];
}

- (void)setImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage selectedImage:(UIImage *)selectedImage
{
    [self setImage:image forState:UIControlStateNormal];
    [self setImage:highlightedImage forState:UIControlStateHighlighted];
    [self setImage:selectedImage forState:UIControlStateSelected];
}

- (void)setBackgroundImageName:(NSString *)imageName highlightedBackgroundImageName:(NSString *)highlightedImageName
{
    [self setBackgroundImage:[UIImage imageNamed:imageName] highlightedBackgroundImage:[UIImage imageNamed:highlightedImageName]];
}

- (void)setBackgroundImage:(UIImage *)image highlightedBackgroundImage:(UIImage *)highlightedImage
{
    [self setBackgroundImage:image highlightedBackgroundImage:highlightedImage selectedBackgroundImage:nil];
}

- (void)setBackgroundImageName:(NSString *)imageName highlightedBackgroundImageName:(NSString *)highlightedImageName selectedBackgroundImageName:(NSString *)selectedImageName
{
    [self setBackgroundImage:[UIImage imageNamed:imageName] highlightedBackgroundImage:[UIImage imageNamed:highlightedImageName] selectedBackgroundImage:[UIImage imageNamed:selectedImageName]];
}

- (void)setBackgroundImage:(UIImage *)image highlightedBackgroundImage:(UIImage *)highlightedImage selectedBackgroundImage:(UIImage *)selectedImage
{
    [self setBackgroundImage:image forState:UIControlStateNormal];
    [self setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
    [self setBackgroundImage:selectedImage forState:UIControlStateSelected];
}

- (void)setTitleColor:(UIColor *)color
{
    [self setTitleColor:color highlightedColor:[color colorWithAlphaComponent:0.4]];
}

- (void)setTitleColor:(UIColor *)color highlightedColor:(UIColor *)highlightedColor
{
    [self setTitleColor:color forState:UIControlStateNormal];
    [self setTitleColor:highlightedColor forState:UIControlStateHighlighted];
}

- (void)setTitleColor:(UIColor *)color highlightedColor:(UIColor *)highlightedColor selectedColor:(UIColor *)selectedColor
{
    [self setTitleColor:color forState:UIControlStateNormal];
    [self setTitleColor:highlightedColor forState:UIControlStateHighlighted];
    [self setTitleColor:selectedColor forState:UIControlStateSelected];
}

@end
