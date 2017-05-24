//
//  UIView+Animation.h
//  DJkit
//
//  Created by DennisDeng on 14-5-4.
//  Copyright (c) 2014年 DennisDeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Animation)

// Moves
- (void)moveTo:(CGPoint)destination duration:(NSTimeInterval)secs option:(UIViewAnimationOptions)option;
- (void)moveTo:(CGPoint)destination duration:(NSTimeInterval)secs option:(UIViewAnimationOptions)option delegate:(id)delegate callback:(SEL)method;
- (void)moveTo:(CGPoint)destination duration:(NSTimeInterval)secs option:(UIViewAnimationOptions)option callbackBlock:(void(^)())block;
- (void)raceTo:(CGPoint)destination withSnapBack:(BOOL)withSnapBack;
- (void)raceTo:(CGPoint)destination withSnapBack:(BOOL)withSnapBack delegate:(id)delegate callback:(SEL)method;

// Transforms
- (void)rotate:(NSInteger)degrees secs:(NSTimeInterval)secs delegate:(id)delegate callback:(SEL)method;
- (void)scale:(NSTimeInterval)secs x:(CGFloat)scaleX y:(CGFloat)scaleY delegate:(id)delegate callback:(SEL)method;
- (void)spinClockwise:(NSTimeInterval)secs;
- (void)spinCounterClockwise:(NSTimeInterval)secs;

// Transitions
- (void)curlDown:(NSTimeInterval)secs;
- (void)curlUpAndAway:(NSTimeInterval)secs;

/*
- (void)drainAway:(float)secs;
*/

// Effects
- (void)changeAlpha:(CGFloat)newAlpha secs:(NSTimeInterval)secs;

@end
