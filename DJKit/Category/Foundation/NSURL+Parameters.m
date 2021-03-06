//
//  NSURL+Parameters.m
//  DJkit
//
//  Created DennisDeng DJ on 2017/4/1.
//  Copyright © 2017年 DennisDeng. All rights reserved.
//

#import "NSURL+Parameters.h"

@implementation NSURL (Parameters)

- (NSDictionary *)queryDictionary
{
    NSString *keyValues = self.query;
    if (![keyValues isNotEmpty]) return nil;
    
    return [self queryDictionaryWithKeysValues:keyValues];
}

// 从k=v中获取键值
- (NSString *)valueFromKeyValue:(NSString *)keyValue atIndex:(NSUInteger)index
{
    return [[keyValue componentsSeparatedByString:@"="] objectAtIndex:index];
}

- (NSDictionary *)queryDictionaryWithKeysValues:(NSString *)keyValues
{
    if (!(keyValues.length > 0)) return @{};
    
    NSArray *pairArray = [keyValues componentsSeparatedByString:@"&"];  //键值对字符串
    NSMutableDictionary *queryDic= [NSMutableDictionary dictionaryWithCapacity:pairArray.count];
    NSString *key = nil;
    NSString *obj = nil;
    if (pairArray.count > 1)
    {
        for (NSString *pair in pairArray)
        {
            key = [self valueFromKeyValue:pair atIndex:0];
            obj = [self valueFromKeyValue:pair atIndex:1];
            [queryDic setObject:[obj stringByRemovingPercentEncoding] forKey:key];
        }
    }
    else if (pairArray.count == 1)
    {
        key = [self valueFromKeyValue:keyValues atIndex:0];
        obj = [self valueFromKeyValue:keyValues atIndex:1];
        [queryDic setObject:[obj stringByRemovingPercentEncoding] forKey:key];
    }
    
    return queryDic;
}

- (NSURL *)URLByAppendingQueryString:(NSString *)queryString
{
    if (![queryString length])
    {
        return self;
    }
    
    NSString *URLString = [NSString stringWithFormat:@"%@%@%@", [self absoluteString], [self query] ? @"&" : @"?", queryString];
    return [NSURL URLWithString:URLString];
}

- (NSURL *)URLByAppendingQueryParameters:(NSDictionary *)parameters
{
    return [self URLByAppendingQueryParameters:parameters usingEncoding:NSUTF8StringEncoding];
}

- (NSURL *)URLByAppendingQueryParameters:(NSDictionary *)parameters usingEncoding:(NSStringEncoding)encoding
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
    
    return [self URLByAppendingQueryString:queryString];
}

@end
