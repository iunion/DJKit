//
//  NSURL+Parameters.m
//  DJkit
//
//  Created DennisDeng DJ on 2017/4/1.
//  Copyright © 2017年 DennisDeng. All rights reserved.
//

#import "NSURL+Parameters.h"

@implementation NSURL (Parameters)

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
