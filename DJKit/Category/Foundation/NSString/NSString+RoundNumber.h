//
//  NSString+RoundNumber.h
//  miaoqian
//
//  Created by DJ on 2017/5/26.
//  Copyright © 2017年 MiaoQian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (RoundNumber)

+ (NSString *)stringFromFloat:(float)value roundingScale:(short)scale;
+ (NSString *)stringFromFloat:(float)value roundingScale:(short)scale roundingMode:(NSRoundingMode)mode;
+ (NSString *)stringFromFloat:(float)value roundingScale:(short)scale roundingMode:(NSRoundingMode)mode fractionDigitsPadded:(BOOL)isPadded;
+ (NSString *)stringFromFloat:(float)value roundingScale:(short)scale roundingMode:(NSRoundingMode)mode fractionDigitsPadded:(BOOL)isPadded decimalStyle:(BOOL)isDecimalStyle;
+ (NSString *)stringFromFloat:(float)value roundingScale:(short)scale roundingMode:(NSRoundingMode)mode maximumFractionDigits:(NSUInteger)maximumFractionDigits minimumFractionDigits:(NSUInteger)minimumFractionDigits;
+ (NSString *)stringFromFloat:(float)value roundingScale:(short)scale roundingMode:(NSRoundingMode)mode maximumFractionDigits:(NSUInteger)maximumFractionDigits minimumFractionDigits:(NSUInteger)minimumFractionDigits decimalStyle:(BOOL)isDecimalStyle;

+ (NSString *)stringFromDouble:(double)value roundingScale:(short)scale;
+ (NSString *)stringFromDouble:(double)value roundingScale:(short)scale roundingMode:(NSRoundingMode)mode;
+ (NSString *)stringFromDouble:(double)value roundingScale:(short)scale roundingMode:(NSRoundingMode)mode fractionDigitsPadded:(BOOL)isPadded;
+ (NSString *)stringFromDouble:(double)value roundingScale:(short)scale roundingMode:(NSRoundingMode)mode fractionDigitsPadded:(BOOL)isPadded decimalStyle:(BOOL)isDecimalStyle;
+ (NSString *)stringFromDouble:(double)value roundingScale:(short)scale roundingMode:(NSRoundingMode)mode maximumFractionDigits:(NSUInteger)maximumFractionDigits minimumFractionDigits:(NSUInteger)minimumFractionDigits;
+ (NSString *)stringFromDouble:(double)value roundingScale:(short)scale roundingMode:(NSRoundingMode)mode maximumFractionDigits:(NSUInteger)maximumFractionDigits minimumFractionDigits:(NSUInteger)minimumFractionDigits decimalStyle:(BOOL)isDecimalStyle;

+ (NSString *)stringFromNumber:(NSNumber *)number fractionDigits:(NSUInteger)fractionDigits;
+ (NSString *)stringFromNumber:(NSNumber *)number maximumFractionDigits:(NSUInteger)maximumFractionDigits minimumFractionDigits:(NSUInteger)minimumFractionDigits;
+ (NSString *)stringFromNumber:(NSNumber *)number maximumFractionDigits:(NSUInteger)maximumFractionDigits minimumFractionDigits:(NSUInteger)minimumFractionDigits decimalStyle:(BOOL)isDecimalStyle;

@end

NS_ASSUME_NONNULL_END
