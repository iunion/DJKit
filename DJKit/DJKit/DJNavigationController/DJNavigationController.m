//
//  DJNavigationController.m
//  DJkit
//
//  Created by DennisDeng on 14-4-1.
//  Copyright (c) 2014年 DennisDeng. All rights reserved.
//

#import "DJNavigationController.h"

@interface DJNavigationController () <UINavigationControllerDelegate, UIGestureRecognizerDelegate>
/// A Boolean value indicating whether navigation controller is currently pushing or pop a new view controller on the stack.
@property (nonatomic, getter = isDuringPushAnimation) BOOL duringPushAnimation;
@property (nonatomic, getter = isDuringPopAnimation) BOOL duringPopAnimation;
/// A real delegate of the class. `delegate` property is used only for keeping an internal state during
/// animations – we need to know when the animation ended, and that info is available only
/// from `navigationController:didShowViewController:animated:`.
@property (weak, nonatomic) id<UINavigationControllerDelegate> realDelegate;
@end

@implementation DJNavigationController

#pragma mark - NSObject

- (void)dealloc
{
    self.delegate = nil;
    self.interactivePopGestureRecognizer.delegate = nil;
}

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    if (!self.delegate) {
        self.delegate = self;
    }

    //self.navigationBar.translucent = NO;
    self.interactivePopGestureRecognizer.delegate = self;
}

#pragma mark - UINavigationController

- (void)setDelegate:(id<UINavigationControllerDelegate>)delegate
{
    self.realDelegate = delegate != self ? delegate : nil;
    [super setDelegate:delegate ? self : nil];
}

- (void)pushViewController:(UIViewController *)viewController
                  animated:(BOOL)animated __attribute__((objc_requires_super))
{
    if (animated)
    {
        if ([self isDuringPushAnimation])
        {
            return;
        }
        self.duringPushAnimation = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    if (animated)
    {
        if ([self isDuringPopAnimation])
        {
            return nil;
        }
        self.duringPopAnimation = YES;
    }
    return [super popViewControllerAnimated:animated];
}

- (NSArray<__kindof UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (animated)
    {
        if ([self isDuringPopAnimation])
        {
            return nil;
        }
        self.duringPopAnimation = YES;
    }
    return [super popToViewController:viewController animated:animated];
}

- (NSArray<__kindof UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated
{
    if (animated)
    {
        if ([self isDuringPopAnimation])
        {
            return nil;
        }
        self.duringPopAnimation = YES;
    }
    return [super popToRootViewControllerAnimated:animated];
}

#pragma mark UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    id <UIViewControllerTransitionCoordinator> tc = navigationController.topViewController.transitionCoordinator;
    if (tc && [tc initiallyInteractive])
    {
        [tc notifyWhenInteractionEndsUsingBlock:^(id<UIViewControllerTransitionCoordinatorContext> context) {
            self.duringPopAnimation = NO;
        }];
    }
    else
    {
        self.duringPopAnimation = NO;
    }
}

- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated
{
    NSCAssert(self.interactivePopGestureRecognizer.delegate == self, @"DJNavigationController won't work correctly if you change interactivePopGestureRecognizer's delegate.");

    self.duringPushAnimation = NO;
    self.duringPopAnimation = NO;

    if ([self.realDelegate respondsToSelector:_cmd])
    {
        [self.realDelegate navigationController:navigationController didShowViewController:viewController animated:animated];
    }
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (self.viewControllers.count <= 1)
    {
        return NO;
    }
    // 私有变量标志transition动画是否正在进行
    // 后面可以不判断 !self.isDuringPushAnimation && !self.isDuringPopAnimation
    if ([[self valueForKey:@"_isTransitioning"] boolValue])
    {
        return NO;
    }

    if (gestureRecognizer == self.interactivePopGestureRecognizer)
    {
        // Disable pop gesture in two situations:
        // 1) when the pop animation is in progress
        // 2) when user swipes quickly a couple of times and animations don't have time to be performed
        // 3) 页面VC 支持返回手势
        UIViewController *vc = [self.viewControllers lastObject];
        BOOL canGesture = [vc canPopGesutreRecognized];
        return canGesture && !self.isDuringPushAnimation && !self.isDuringPopAnimation;
    }
    else
    {
        // default value
        return YES;
    }
}

#pragma mark - Delegate Forwarder

// Thanks for the idea goes to: https://github.com/steipete/PSPDFTextView/blob/ee9ce04ad04217efe0bc84d67f3895a34252d37c/PSPDFTextView/PSPDFTextView.m#L148-164

- (BOOL)respondsToSelector:(SEL)aSelector
{
    if ([super respondsToSelector:aSelector])
    {
        return YES;
    }
    
    if ([self.realDelegate respondsToSelector:aSelector])
    {
        return YES;
    }
    
    return NO;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if (!signature)
    {
        if ([self.realDelegate respondsToSelector:aSelector])
        {
            return [(id)self.realDelegate methodSignatureForSelector:aSelector];
        }
    }
    return signature;

    //return [super methodSignatureForSelector:aSelector] ?: [(id)self.realDelegate methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    id delegate = self.realDelegate;
    if ([delegate respondsToSelector:invocation.selector])
    {
        [invocation invokeWithTarget:delegate];
    }
}

@end
