//
//  UIViewController+NavigationController.h
//  DJkit
//
//  Created by DennisDeng on 15/8/19.
//  Copyright (c) 2015年 DennisDeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (NavigationController)

- (void)setNavBarBackgroudColor:(UIColor *)color;

- (void)hideNavBarUnderLine;

- (void)setNavBarAlpha:(CGFloat)alpha;

- (void)setNavBarTitle:(NSString *)title;

- (void)setNavBar:(NSString *)title bgColor:(UIColor *)bgColor leftTitle:(NSString *)ltitle leftBtnImage:(NSString *)lBImage leftToucheEvent:(SEL)aLSelector rightTitle:(NSString *)rtitle rightBtnImage:(NSString *)rBImage rightToucheEvent:(SEL)aRSelector;
- (void)setNavBarTitleView:(UIView *)titleView bgColor:(UIColor *)bgColor leftTitle:(NSString *)ltitle leftBtnImage:(NSString *)lBImage leftToucheEvent:(SEL)aLSelector rightTitle:(NSString *)rtitle rightBtnImage:(NSString *)rBImage rightToucheEvent:(SEL)aRSelector;

@end

