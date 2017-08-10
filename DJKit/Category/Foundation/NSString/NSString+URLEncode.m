//
//  NSString+URLEncode.m
//  DJkit
//
//  Created by Scott James Remnant on 6/1/11.
//  Copyright 2011 Scott James Remnant <scott@netsplit.com>. All rights reserved.
//

#import "NSString+URLEncode.h"


@implementation NSString (NSString_URLEncode)

- (NSString *)URLEncode
{
    return [self URLEncodeUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)URLEncodeUsingEncoding:(NSStringEncoding)encoding
{
    NSLog(@"原url: %@", self);
    NSString *encodedString = (NSString *) CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)self, (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]", NULL, CFStringConvertNSStringEncodingToEncoding(encoding)));
    NSLog(@"转码url: %@", encodedString);
    
    return encodedString;
}

- (NSString *)URLDecode
{
    return [self URLDecodeUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)URLDecodeUsingEncoding:(NSStringEncoding)encoding
{
    NSLog(@"转码url: %@", self);
    NSString *decodedString = (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (__bridge CFStringRef)self, CFSTR(""), CFStringConvertNSStringEncodingToEncoding(encoding));
    NSLog(@"还原url: %@", decodedString);
    
    return decodedString;
}

+ (NSString *)URLString:(NSString *)URLString appendingQueryString:(NSString *)queryString
{
    return [URLString URLStringByAppendingQueryString:queryString];
}

+ (NSString *)URLString:(NSString *)URLString appendingQueryParameters:(NSDictionary *)parameters usingEncoding:(NSStringEncoding)encoding
{
    return [URLString URLStringByAppendingQueryParameters:parameters usingEncoding:encoding];
}

- (NSString *)URLStringByAppendingQueryString:(NSString *)queryString
{
    if (![queryString length])
    {
        return self;
    }
    
    NSString *URLString = [NSString stringWithFormat:@"%@%@%@", self, [self rangeOfString:@"?"].location == NSNotFound ? @"&" : @"?", queryString];
    return URLString;
}

- (NSString *)URLStringByAppendingQueryParameters:(NSDictionary *)parameters usingEncoding:(NSStringEncoding)encoding
{
    if (!parameters.count)
    {
        return self;
    }
    
    __block NSString *queryString = nil;
    [parameters enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL *stop) {
        NSString *escapedKey = key;
        if (encoding >= NSASCIIStringEncoding)
        {
            escapedKey = [key stringByAddingPercentEscapesUsingEncoding:encoding];
        }
        NSString *escapedValue = value;
        if (encoding >= NSASCIIStringEncoding)
        {
            escapedValue = [value stringByAddingPercentEscapesUsingEncoding:encoding];
        }
        if (!queryString)
        {
            queryString = [NSString stringWithFormat:@"%@=%@", escapedKey, escapedValue];
        }
        else
        {
            queryString = [queryString stringByAppendingFormat:@"&%@=%@", escapedKey, escapedValue];
        }
    }];
    
    return [self URLStringByAppendingQueryString:queryString];
}

@end
