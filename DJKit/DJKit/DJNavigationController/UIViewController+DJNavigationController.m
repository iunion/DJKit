//
//  UIViewController+DJNavigationController.m
//  DJkit
//
//  Created by DennisDeng on 14-4-1.
//  Copyright (c) 2014年 DennisDeng. All rights reserved.
//

#import "UIViewController+DJNavigationController.h"

@implementation UIViewController (DJNavigationController)

- (BOOL)canPopGesutreRecognized
{
    // 根据实际情况重写此函数，设定是否可以手势返回
    return YES;
}

@end
