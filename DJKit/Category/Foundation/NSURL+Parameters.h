//
//  NSURL+Parameters.h
//  DJkit
//
//  Created by DennisDeng on 2017/4/1.
//  Copyright © 2017年 DennisDeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (Parameters)

- (NSURL *)URLByAppendingQueryString:(NSString *)queryString;
- (NSURL *)URLByAppendingQueryParameters:(NSDictionary *)parameters;
- (NSURL *)URLByAppendingQueryParameters:(NSDictionary *)parameters usingEncoding:(NSStringEncoding)encoding;

@end
