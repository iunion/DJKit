//
//  NSDecimalNumber+Category.m
//  DJkit
//
//  Created by DennisDeng on 16/7/2.
//  Copyright © 2016年 DennisDeng. All rights reserved.
//

#import "NSDecimalNumber+Category.h"


@implementation NSDecimalNumber (Category)

+ (NSDecimalNumber *)rounding:(CGFloat)price withRoundingMode:(NSRoundingMode)mode decimalPlaces:(NSUInteger)places
{
    NSDecimalNumber *ouncesDecimal;
    ouncesDecimal = [[NSDecimalNumber alloc] initWithFloat:price];
    return [NSDecimalNumber roundingNumber:ouncesDecimal withRoundingMode:mode decimalPlaces:places];
}

+ (NSDecimalNumber *)roundingNumber:(NSDecimalNumber *)ouncesDecimal withRoundingMode:(NSRoundingMode)mode decimalPlaces:(NSUInteger)places
{
    NSDecimalNumberHandler *roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:mode scale:places raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    
    NSDecimalNumber *roundedOunces;
    
    roundedOunces = [ouncesDecimal decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    
    return roundedOunces;
}

+ (NSDecimalNumber *)decimalNumberWithFloat:(float)value
{
    NSDecimalNumber *decimalNumber = [[NSDecimalNumber alloc] initWithFloat:value];

    return decimalNumber;
}

+ (NSDecimalNumber *)decimalNumberWithDouble:(double)value
{
    NSDecimalNumber *decimalNumber = [[NSDecimalNumber alloc] initWithDouble:value];
    
    return decimalNumber;
}

+ (NSDecimalNumber *)decimalNumberWithBool:(BOOL)value
{
    NSDecimalNumber *decimalNumber = [[NSDecimalNumber alloc] initWithBool:value];
    
    return decimalNumber;
}

+ (NSDecimalNumber *)decimalNumberWithInteger:(NSInteger)value
{
    NSDecimalNumber *decimalNumber = [[NSDecimalNumber alloc] initWithInteger:value];
    
    return decimalNumber;
}

+ (NSDecimalNumber *)decimalNumberWithUnsignedInteger:(NSUInteger)value
{
    NSDecimalNumber *decimalNumber = [[NSDecimalNumber alloc] initWithUnsignedInteger:value];
    
    return decimalNumber;
}

@end
