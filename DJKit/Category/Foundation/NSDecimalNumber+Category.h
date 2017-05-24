//
//  NSDecimalNumber+Category.h
//  DJkit
//
//  Created by DennisDeng on 16/7/2.
//  Copyright © 2016年 DennisDeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDecimalNumber (Category)

+ (NSDecimalNumber *)rounding:(CGFloat)price withRoundingMode:(NSRoundingMode)mode decimalPlaces:(NSUInteger)places;
+ (NSDecimalNumber *)roundingNumber:(NSDecimalNumber *)ouncesDecimal withRoundingMode:(NSRoundingMode)mode decimalPlaces:(NSUInteger)places;

+ (NSDecimalNumber *)decimalNumberWithFloat:(float)value;
+ (NSDecimalNumber *)decimalNumberWithDouble:(double)value;
+ (NSDecimalNumber *)decimalNumberWithBool:(BOOL)value;
+ (NSDecimalNumber *)decimalNumberWithInteger:(NSInteger)value NS_AVAILABLE(10_5, 2_0);
+ (NSDecimalNumber *)decimalNumberWithUnsignedInteger:(NSUInteger)value NS_AVAILABLE(10_5, 2_0);

@end

NS_ASSUME_NONNULL_END

