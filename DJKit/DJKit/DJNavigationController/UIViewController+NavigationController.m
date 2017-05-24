//
//  UIViewController+NavigationController.m
//  DJkit
//
//  Created by DennisDeng on 15/8/19.
//  Copyright (c) 2015年 DennisDeng. All rights reserved.
//

#import "UIViewController+NavigationController.h"

#define TITLE_WIDTH                180.0f

#define USE_ORIGIN_BGVIEW           0

#define NAV_BACKCOLOR_VIEW_TAG      150819
#define UI_NAVIGATION_BGCOLOR       [UIColor redColor]

@implementation UIViewController (NavigationController)

- (void)setNavBarBackgroudColor:(UIColor *)color
{
    //self.navigationController.navigationBar.barTintColor = UI_NAVIGATION_BGCOLOR;
    //self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    NSArray *views = [self.navigationController.navigationBar subviews];
    UIView *view = (UIView *)views[0];
// 由于某些第三方会改变navigationBar.barTintColor，所以添加一个view
#if USE_ORIGIN_BGVIEW
    if (color)
    {
        view.backgroundColor = color;
    }
    else
    {
        view.backgroundColor = UI_NAVIGATION_BGCOLOR;
    }
#else
    view.backgroundColor = [UIColor clearColor];

    UIView *bgView = [view viewWithTag:NAV_BACKCOLOR_VIEW_TAG];
    if (!bgView)
    {
        bgView = [[UIView alloc] initWithFrame:view.bounds];
        [bgView setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
        bgView.tag = NAV_BACKCOLOR_VIEW_TAG;
        [view addSubview:bgView];
    }
    
    if (color)
    {
        bgView.backgroundColor = color;
    }
    else
    {
        bgView.backgroundColor = UI_NAVIGATION_BGCOLOR;
    }
#endif
}

- (void)hideNavBarUnderLine
{
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

// 此函数需要在setNavBarBackgroudColor之后运行
- (void)setNavBarAlpha:(CGFloat)alpha
{
    NSArray *views = [self.navigationController.navigationBar subviews];
    UIView *view = (UIView *)views[0];
#if USE_ORIGIN_BGVIEW
    view.alpha = alpha;
#else
    view.backgroundColor = [UIColor clearColor];
    
    UIView *bgView = [view viewWithTag:NAV_BACKCOLOR_VIEW_TAG];
    bgView.alpha = alpha;
#endif
}

- (void)setNavBarTitle:(NSString *)title
{
    self.title = title;
    
    // 设置标题
    if ([title isNotEmpty])
    {
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, TITLE_WIDTH, UI_NAVIGATION_BAR_HEIGHT)];
        titleLabel.font = [UIFont boldSystemFontOfSize:18.0f];
        titleLabel.minimumScaleFactor = 0.5f;
        titleLabel.adjustsFontSizeToFitWidth = YES;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.contentMode = UIViewContentModeTop;
        titleLabel.text = title;
        
        self.navigationItem.titleView = titleLabel;
    }
    else
    {
        self.navigationItem.titleView = nil;
    }
}

- (UIBarButtonItem *)makeNavBtn:(NSString *)title image:(NSString *)imageName toucheEvent:(SEL)selector
{
    if (selector != nil)
    {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
        btn.exclusiveTouch = YES;
        
        if (title != nil)
        {
            btn.titleLabel.font = [UIFont boldSystemFontOfSize:16.0f];
            
            CGSize size = [title boundingRectWithSize:CGSizeMake(100, 44) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:btn.titleLabel.font} context:nil].size;
            if (size.width < 44 && IOS_VERSION < 7.0f)
            {
                size.width = 44;
            }
            btn.frame = CGRectMake(0, 0, size.width, size.height);
            [btn setTitle:title forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor colorWithHex:0xCCCCCC] forState:UIControlStateDisabled];
        }
        else if ([imageName isNotEmpty])
        {
            UIImage *image = [UIImage imageNamed:imageName];
            btn.frame = CGRectMake(0, 0, image.size.width, image.size.height);
            [btn setBackgroundImage:image forState:UIControlStateNormal];
            NSString *limage = [imageName stringByAppendingString:@"_hightlight"];
            [btn setBackgroundImage:[UIImage imageNamed:limage] forState:UIControlStateHighlighted];
        }
        
        UIBarButtonItem * buttonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
        return buttonItem;
    }
    else
    {
        return nil;
    }
}

- (void)setNavBar:(NSString *)title bgColor:(UIColor *)bgColor leftTitle:(NSString *)ltitle leftBtnImage:(NSString *)lBImage leftToucheEvent:(SEL)aLSelector rightTitle:(NSString *)rtitle rightBtnImage:(NSString *)rBImage rightToucheEvent:(SEL)aRSelector
{
    [self setNavBarTitle:title];
    
    [self setNavBarTitleView:nil bgColor:bgColor leftTitle:ltitle leftBtnImage:lBImage leftToucheEvent:aLSelector rightTitle:rtitle rightBtnImage:rBImage rightToucheEvent:aRSelector];
}

- (void)setNavBarTitleView:(UIView *)titleView bgColor:(UIColor *)bgColor leftTitle:(NSString *)ltitle leftBtnImage:(NSString *)lBImage leftToucheEvent:(SEL)aLSelector rightTitle:(NSString *)rtitle rightBtnImage:(NSString *)rBImage rightToucheEvent:(SEL)aRSelector
{
    [self.navigationItem setHidesBackButton:YES];
    
    // 设置标题
    if (titleView)
    {
        [self.navigationItem setTitleView:titleView];
    }
    
    [self setNavBarBackgroudColor:bgColor];
    
    // 设置左按键
    UIBarButtonItem *lButtonItem = [self makeNavBtn:ltitle image:lBImage toucheEvent:aLSelector];
    self.navigationItem.leftBarButtonItem = lButtonItem;
    
    // 设置右按键
    UIBarButtonItem *rButtonItem = [self makeNavBtn:rtitle image:rBImage toucheEvent:aRSelector];
    self.navigationItem.rightBarButtonItem = rButtonItem;
}

@end
