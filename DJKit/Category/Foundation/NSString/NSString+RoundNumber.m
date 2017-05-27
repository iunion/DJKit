//
//  NSString+RoundNumber.m
//  miaoqian
//
//  Created by DJ on 2017/5/26.
//  Copyright © 2017年 MiaoQian. All rights reserved.
//

#import "NSString+RoundNumber.h"

@implementation NSString (RoundNumber)

+ (NSString *)stringFromFloat:(float)value roundingScale:(short)scale
{
    return [NSString stringFromFloat:value roundingScale:scale roundingMode:NSRoundPlain];
}

+ (NSString *)stringFromFloat:(float)value roundingScale:(short)scale roundingMode:(NSRoundingMode)mode
{
    return [NSString stringFromFloat:value roundingScale:scale roundingMode:NSRoundPlain fractionDigitsPadded:NO];
}

+ (NSString *)stringFromFloat:(float)value roundingScale:(short)scale roundingMode:(NSRoundingMode)mode fractionDigitsPadded:(BOOL)isPadded
{
    return [NSString stringFromFloat:value roundingScale:scale roundingMode:NSRoundPlain fractionDigitsPadded:NO decimalStyle:NO];
}

+ (NSString *)stringFromFloat:(float)value roundingScale:(short)scale roundingMode:(NSRoundingMode)mode fractionDigitsPadded:(BOOL)isPadded decimalStyle:(BOOL)isDecimalStyle
{
    if (isPadded)
    {
        return [NSString stringFromFloat:value roundingScale:scale roundingMode:NSRoundPlain maximumFractionDigits:scale minimumFractionDigits:scale decimalStyle:isDecimalStyle];
    }
    
    NSDecimalNumber *decimalNumber = [NSDecimalNumber decimalNumberWithFloat:value roundingScale:scale roundingMode:mode];
    return [NSString stringWithFormat:@"%@", decimalNumber];
}

+ (NSString *)stringFromFloat:(float)value roundingScale:(short)scale roundingMode:(NSRoundingMode)mode maximumFractionDigits:(NSUInteger)maximumFractionDigits minimumFractionDigits:(NSUInteger)minimumFractionDigits
{
    return [NSString stringFromFloat:value roundingScale:scale roundingMode:mode maximumFractionDigits:maximumFractionDigits minimumFractionDigits:minimumFractionDigits decimalStyle:NO];
}

+ (NSString *)stringFromFloat:(float)value roundingScale:(short)scale roundingMode:(NSRoundingMode)mode maximumFractionDigits:(NSUInteger)maximumFractionDigits minimumFractionDigits:(NSUInteger)minimumFractionDigits decimalStyle:(BOOL)isDecimalStyle
{
    NSDecimalNumber *decimalNumber = [NSDecimalNumber decimalNumberWithFloat:value roundingScale:scale roundingMode:mode];
    return [NSString stringFromNumber:decimalNumber maximumFractionDigits:maximumFractionDigits minimumFractionDigits:minimumFractionDigits decimalStyle:isDecimalStyle];
}

+ (NSString *)stringFromDouble:(double)value roundingScale:(short)scale
{
    return [NSString stringFromDouble:value roundingScale:scale roundingMode:NSRoundPlain];
}

+ (NSString *)stringFromDouble:(double)value roundingScale:(short)scale roundingMode:(NSRoundingMode)mode
{
    return [NSString stringFromDouble:value roundingScale:scale roundingMode:NSRoundPlain fractionDigitsPadded:NO];
}

+ (NSString *)stringFromDouble:(double)value roundingScale:(short)scale roundingMode:(NSRoundingMode)mode fractionDigitsPadded:(BOOL)isPadded
{
    return [NSString stringFromDouble:value roundingScale:scale roundingMode:NSRoundPlain fractionDigitsPadded:NO decimalStyle:NO];
}

+ (NSString *)stringFromDouble:(double)value roundingScale:(short)scale roundingMode:(NSRoundingMode)mode fractionDigitsPadded:(BOOL)isPadded decimalStyle:(BOOL)isDecimalStyle
{
    if (isPadded)
    {
        return [NSString stringFromDouble:value roundingScale:scale roundingMode:NSRoundPlain maximumFractionDigits:scale minimumFractionDigits:scale decimalStyle:isDecimalStyle];
    }
    
    NSDecimalNumber *decimalNumber = [NSDecimalNumber decimalNumberWithFloat:value roundingScale:scale roundingMode:mode];
    return [NSString stringWithFormat:@"%@", decimalNumber];
}

+ (NSString *)stringFromDouble:(double)value roundingScale:(short)scale roundingMode:(NSRoundingMode)mode maximumFractionDigits:(NSUInteger)maximumFractionDigits minimumFractionDigits:(NSUInteger)minimumFractionDigits
{
    return [NSString stringFromDouble:value roundingScale:scale roundingMode:mode maximumFractionDigits:maximumFractionDigits minimumFractionDigits:minimumFractionDigits decimalStyle:NO];
}

+ (NSString *)stringFromDouble:(double)value roundingScale:(short)scale roundingMode:(NSRoundingMode)mode maximumFractionDigits:(NSUInteger)maximumFractionDigits minimumFractionDigits:(NSUInteger)minimumFractionDigits decimalStyle:(BOOL)isDecimalStyle
{
    NSDecimalNumber *decimalNumber = [NSDecimalNumber decimalNumberWithDouble:value roundingScale:scale roundingMode:mode];
    return [NSString stringFromNumber:decimalNumber maximumFractionDigits:maximumFractionDigits minimumFractionDigits:minimumFractionDigits decimalStyle:isDecimalStyle];
}

+ (NSString *)stringFromNumber:(NSNumber *)number fractionDigits:(NSUInteger)fractionDigits
{
    return [NSString stringFromNumber:number maximumFractionDigits:fractionDigits minimumFractionDigits:fractionDigits];
}

+ (NSString *)stringFromNumber:(NSNumber *)number maximumFractionDigits:(NSUInteger)maximumFractionDigits minimumFractionDigits:(NSUInteger)minimumFractionDigits
{
    return [NSString stringFromNumber:number maximumFractionDigits:maximumFractionDigits minimumFractionDigits:minimumFractionDigits decimalStyle:NO];
}

+ (NSString *)stringFromNumber:(NSNumber *)number maximumFractionDigits:(NSUInteger)maximumFractionDigits minimumFractionDigits:(NSUInteger)minimumFractionDigits decimalStyle:(BOOL)isDecimalStyle
{
    NSNumberFormatter *numberFormatter = [NSNumberFormatter new];
    [numberFormatter setMaximumFractionDigits:maximumFractionDigits];
    [numberFormatter setMinimumFractionDigits:minimumFractionDigits];
    if (isDecimalStyle)
    {
        numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    }
    
    return [numberFormatter stringFromNumber:number];
}

@end
