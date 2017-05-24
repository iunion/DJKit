//
//  NSString+MandarinLatin.h
//  DJkit
//
//  Created by DennisDeng on 2017/5/2.
//  Copyright © 2017年 DennisDeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MandarinLatin)

- (nullable NSString *)stringByReplacingMandarinToLatinWithDiacritics:(BOOL)diacritics firstLetterCapitalizes:(BOOL)capitalizes;

- (nullable NSString *)mandarinLatinString;
- (nullable NSString *)pinyinString;

@end
