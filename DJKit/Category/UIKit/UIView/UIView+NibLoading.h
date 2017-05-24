//
//  UIView+NibLoading.h
//  DJkit
//
//  Created by DennisDeng on 14-5-5.
//  Copyright (c) 2014年 DennisDeng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (NibLoading)

+ (instancetype)instanceWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)bundleOrNil owner:(nullable id)ownerOrNil;
- (void)loadContentsWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)bundleOrNil;

@end

NS_ASSUME_NONNULL_END
