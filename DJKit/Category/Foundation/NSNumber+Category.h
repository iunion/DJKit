//
//  NSNumber+Category.h
//  DJkit
//
//  Created by DennisDeng on 16/1/21.
//  Copyright © 2016年 DennisDeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Category)

// 0 --> 0.00
- (nullable NSString *)stringWithDecimalStyle;

// 0 --> 0
- (nullable NSString *)stringWithNormalDecimalStyle;

// 转换数字保留places位小数
- (nullable NSString *)stringWithNoStyleDecimalPlaces:(NSUInteger)places;
- (nullable NSString *)stringWithDecimalStyleDecimalPlaces:(NSUInteger)places;
- (nullable NSString *)stringWithNumberFormatUsePositiveFormat:(nullable NSString *)positiveFormat;
- (nullable NSString *)stringWithNumberFormat:(nullable NSNumberFormatter *)formatter;

@end
