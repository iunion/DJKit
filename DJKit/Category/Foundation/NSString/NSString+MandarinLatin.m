//
//  NSString+MandarinLatin.m
//  DJkit
//
//  Created by DennisDeng on 2017/5/2.
//  Copyright © 2017年 DennisDeng. All rights reserved.
//

#import "NSString+MandarinLatin.h"

@implementation NSString (MandarinLatin)

- (NSString *)stringByReplacingMandarinToLatinWithDiacritics:(BOOL)diacritics firstLetterCapitalizes:(BOOL)capitalizes
{
    NSMutableString *original = [NSMutableString stringWithString:self];
    // 转换为带变声符的拼音
    if (!CFStringTransform((CFMutableStringRef)original, NULL, kCFStringTransformMandarinLatin, NO))
    {
        return nil;
    }
    
    if (!diacritics)
    {
        // 去除变音符
        if (!CFStringTransform((CFMutableStringRef)original, NULL, kCFStringTransformStripDiacritics, NO))
        {
            return nil;
        }
    }
    
    if (capitalizes)
    {
        return [original capitalizedString];
    }
    else
    {
        return [original copy];
    }
}

- (NSString *)mandarinLatinString
{
    return [self stringByReplacingMandarinToLatinWithDiacritics:YES firstLetterCapitalizes:NO];
}

- (NSString *)pinyinString
{
    return [self stringByReplacingMandarinToLatinWithDiacritics:NO firstLetterCapitalizes:NO];
}

@end
