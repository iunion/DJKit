//
//  UIWindow+Category.h
//  DJkit
//
//  Created by DennisDeng on 15-2-26.
//  Copyright (c) 2015年 DennisDeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (Category)

- (nonnull UIImage *)screenshot;
- (nonnull UIImage *)screenshotWithRect:(CGRect)rect;

- (void)screenshotWithDelay:(CGFloat)delay rect:(CGRect)rect completion:(void (^ _Nullable)(UIImage * _Nullable image))completion;

@end
