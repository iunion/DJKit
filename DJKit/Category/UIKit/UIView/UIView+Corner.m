//
//  UIView+Corner.m
//  DJkit
//
//  Created by DennisDeng on 16/6/17.
//  Copyright © 2016年 DennisDeng. All rights reserved.
//

#import "UIView+Corner.h"
#import "UIView+Size.h"

#pragma mark -
#pragma mark UIView + Corner

@implementation UIView (Corner)

- (void)connerWithRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii
{
    CGRect rect = self.bounds;
    // 创建shapelayer
    CAShapeLayer *masklayer = [[CAShapeLayer alloc]init];
    masklayer.frame = rect;
    // 设置路径
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corners cornerRadii:cornerRadii];
    masklayer.path = path.CGPath;
    
    self.layer.mask = masklayer;
}

- (void)createGradientWithColors:(NSArray * _Nonnull)colors direction:(UIViewLinearGradientDirection)direction
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.bounds;
    
    NSMutableArray *mutableColors = colors.mutableCopy;
    for (NSUInteger i = 0; i < colors.count; i++)
    {
        UIColor *currentColor = colors[i];
        [mutableColors replaceObjectAtIndex:i withObject:(id)currentColor.CGColor];
    }
    gradient.colors = mutableColors;
    
    switch (direction)
    {
        case UIViewLinearGradientDirectionVertical:
        {
            gradient.startPoint = CGPointMake(0.5f, 0.0f);
            gradient.endPoint = CGPointMake(0.5f, 1.0f);
            break;
        }
        case UIViewLinearGradientDirectionHorizontal:
        {
            gradient.startPoint = CGPointMake(0.0f, 0.5f);
            gradient.endPoint = CGPointMake(1.0f, 0.5f);
            break;
        }
        case UIViewLinearGradientDirectionDiagonalFromLeftToRightAndTopToDown:
        {
            gradient.startPoint = CGPointMake(0.0f, 0.0f);
            gradient.endPoint = CGPointMake(1.0f, 1.0f);
            break;
        }
        case UIViewLinearGradientDirectionDiagonalFromLeftToRightAndDownToTop:
        {
            gradient.startPoint = CGPointMake(0.0f, 1.0f);
            gradient.endPoint = CGPointMake(1.0f, 0.0f);
            break;
        }
        case UIViewLinearGradientDirectionDiagonalFromRightToLeftAndTopToDown:
        {
            gradient.startPoint = CGPointMake(1.0f, 0.0f);
            gradient.endPoint = CGPointMake(0.0f, 1.0f);
            break;
        }
        case UIViewLinearGradientDirectionDiagonalFromRightToLeftAndDownToTop:
        {
            gradient.startPoint = CGPointMake(1.0f, 1.0f);
            gradient.endPoint = CGPointMake(0.0f, 0.0f);
            break;
        }
    }
    [self.layer insertSublayer:gradient atIndex:0];
}

@end


#pragma mark -
#pragma mark UIView + RoundedRect

@implementation UIView (RoundedRect)

- (void)roundedRect:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{
    //设置那个圆角的有多圆
    self.layer.cornerRadius = radius;
    //设置边框的宽度，当然可以不要
    self.layer.borderWidth = borderWidth;
    //设置边框的颜色
    self.layer.borderColor = [borderColor CGColor];
    //设为NO去试试
    self.layer.masksToBounds = YES;
}

- (void)roundedRect:(CGFloat)radius
{
    //设置那个圆角的有多圆
    self.layer.cornerRadius = radius;
    //设为NO去试试
    self.layer.masksToBounds = YES;
}

- (void)circleView
{
    //设置那个圆角的有多圆
    self.layer.cornerRadius = self.width/2;
    //设为NO去试试
    self.layer.masksToBounds = YES;
}

- (void)removeBorders
{
    self.layer.borderWidth = 0;
    self.layer.cornerRadius = 0;
    self.layer.borderColor = nil;
}

@end
