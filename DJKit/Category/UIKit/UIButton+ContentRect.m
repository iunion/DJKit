//
//  UIButton+ContentRect.m
//  DJkit
//
//  Created by DennisDeng on 15/7/20.
//  Copyright (c) 2015年 DennisDeng. All rights reserved.
//

#import "UIButton+ContentRect.h"
#import "NSObject+Category.h"
#import <objc/runtime.h>


@implementation UIButton (ContentRect)

static const char *titleRectKey = "DJTitleRectKey";
static const char *imageRectKey = "DJImageRectKey";

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethod:@selector(titleRectForContentRect:) withMethod:@selector(dj_titleRectForContentRect:) error:nil];
        [self swizzleMethod:@selector(imageRectForContentRect:) withMethod:@selector(dj_imageRectForContentRect:) error:nil];
    });
}

- (CGRect)titleRect
{
    NSValue *rectValue = objc_getAssociatedObject(self, titleRectKey);
    return [rectValue CGRectValue];
}

- (void)setTitleRect:(CGRect)rect
{
    objc_setAssociatedObject(self, titleRectKey, [NSValue valueWithCGRect:rect], OBJC_ASSOCIATION_RETAIN);
}

- (CGRect)imageRect
{
    NSValue *rectValue = objc_getAssociatedObject(self, imageRectKey);
    return [rectValue CGRectValue];
}

- (void)setImageRect:(CGRect)rect
{
    objc_setAssociatedObject(self, imageRectKey, [NSValue valueWithCGRect:rect], OBJC_ASSOCIATION_RETAIN);
}

- (CGRect)dj_titleRectForContentRect:(CGRect)contentRect
{
    if (!CGRectIsEmpty(self.titleRect) && !CGRectEqualToRect(self.titleRect, CGRectZero))
    {
        return self.titleRect;
    }
    return [self dj_titleRectForContentRect:contentRect];
    
}

- (CGRect)dj_imageRectForContentRect:(CGRect)contentRect
{
    if (!CGRectIsEmpty(self.imageRect) && !CGRectEqualToRect(self.imageRect, CGRectZero))
    {
        return self.imageRect;
    }
    return [self dj_imageRectForContentRect:contentRect];
}

@end
