//
//  NSString+URLEncode.h
//  DJkit
//
//  Created by Scott James Remnant on 6/1/11.
//  Copyright 2011 Scott James Remnant <scott@netsplit.com>. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (NSString_URLEncode)

- (NSString *)URLEncode;
- (NSString *)URLEncodeUsingEncoding:(NSStringEncoding)encoding;

- (NSString *)URLDecode;
- (NSString *)URLDecodeUsingEncoding:(NSStringEncoding)encoding;

+ (NSString *)URLString:(NSString *)URLString appendingQueryString:(NSString *)queryString;
+ (NSString *)URLString:(NSString *)URLString appendingQueryParameters:(NSDictionary *)parameters usingEncoding:(NSStringEncoding)encoding;

- (NSString *)URLStringByAppendingQueryString:(NSString *)queryString;
- (NSString *)URLStringByAppendingQueryParameters:(NSDictionary *)parameters usingEncoding:(NSStringEncoding)encoding;

@end
