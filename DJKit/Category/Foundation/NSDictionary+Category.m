//
//  NSDictionary+Category.m
//  DJkit
//
//  Created by DennisDeng on 16/1/21.
//  Copyright © 2016年 DennisDeng. All rights reserved.
//

#import "NSDictionary+Category.h"
#import "NSArray+Category.h"
#import "NSObject+Category.h"
#import "NSDate+Category.h"
#import "NSString+Category.h"
#import "NSDecimalNumber+Category.h"

@implementation NSDictionary (Category)

- (long long)longForKey:(id)key
{
    return [self longForKey:key withDefault:0];
}

- (long long)longForKey:(id)key withDefault:(long long)theDefault
{
    return [self longForKey:key formatNumberStyle:NSNumberFormatterNoStyle withDefault:theDefault];
}

- (long long)longForKey:(id)key formatNumberStyle:(NSNumberFormatterStyle)numberStyle withDefault:(long long)theDefault
{
    long long value = 0;
    
    id object = [self objectForKey:key];
    if ([object isValided] && ([object isKindOfClass:[NSNumber class]] || [object isKindOfClass:[NSString class]]))
    {
        if ([object isKindOfClass:[NSString class]])
        {
            // ((NSString *)object).longLongValue;
            // @"1,000" -> 1
            NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
            nf.numberStyle = numberStyle;
            object = [nf numberFromString:object];
        }
        
        if ([object isKindOfClass:[NSNumber class]])
        {
            value = [object longLongValue];
        }
    }
    
    return value;
}

- (NSInteger)intForKey:(id)key
{
    return [self intForKey:key withDefault:0];
}

- (NSInteger)intForKey:(id)key withDefault:(NSInteger)theDefault
{
    return [self intForKey:key formatNumberStyle:NSNumberFormatterNoStyle withDefault:theDefault];
}

- (NSInteger)intForKey:(id)key formatNumberStyle:(NSNumberFormatterStyle)numberStyle withDefault:(NSInteger)theDefault
{
    NSInteger value = theDefault;
    
    id object = [self objectForKey:key];
    if ([object isValided] && ([object isKindOfClass:[NSNumber class]] || [object isKindOfClass:[NSString class]]))
    {
        if ([object isKindOfClass:[NSString class]])
        {
            NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
            nf.numberStyle = numberStyle;
            object = [nf numberFromString:object];
        }
        
        if ([object isKindOfClass:[NSNumber class]])
        {
            value = [object integerValue];
        }
    }
    
    return value;
}

- (NSUInteger)uintForKey:(id)key
{
    return [self uintForKey:key withDefault:0];
}

- (NSUInteger)uintForKey:(id)key withDefault:(NSUInteger)theDefault
{
    return [self uintForKey:key formatNumberStyle:NSNumberFormatterNoStyle withDefault:theDefault];
}

- (NSUInteger)uintForKey:(id)key formatNumberStyle:(NSNumberFormatterStyle)numberStyle withDefault:(NSUInteger)theDefault
{
    NSUInteger value = theDefault;
    
    id object = [self objectForKey:key];
    if ([object isValided] && ([object isKindOfClass:[NSNumber class]] || [object isKindOfClass:[NSString class]]))
    {
        if ([object isKindOfClass:[NSString class]])
        {
            NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
            nf.numberStyle = numberStyle;
            object = [nf numberFromString:object];
        }
        
        if ([object isKindOfClass:[NSNumber class]])
        {
            return [object unsignedIntegerValue];
        }
    }
    
    return value;
}

- (BOOL)boolForKey:(id)key
{
    return [self boolForKey:key withDefault:NO];
}

- (BOOL)boolForKey:(id)key withDefault:(BOOL)theDefault
{
    BOOL value = theDefault;
    
    id object = [self objectForKey:key];
    if ([object isValided] && ([object isKindOfClass:[NSNumber class]] || [object isKindOfClass:[NSString class]]))
    {
        value = [object boolValue];
    }
    
    return value;
}

- (float)floatForKey:(id)key
{
    return [self floatForKey:key withDefault:0.0f];
}

- (float)floatForKey:(id)key withDefault:(float)theDefault
{
    return [self floatForKey:key withDefault:theDefault roundingScale:-1 roundingMode:NSRoundPlain];
}

- (float)floatForKey:(id)key formatNumberStyle:(NSNumberFormatterStyle)numberStyle withDefault:(float)theDefault
{
    return [self floatForKey:key formatNumberStyle:numberStyle withDefault:theDefault roundingScale:-1 roundingMode:NSRoundPlain];
}

- (float)floatForKey:(id)key withDefault:(float)theDefault roundingScale:(short)scale roundingMode:(NSRoundingMode)mode
{
    return [self floatForKey:key formatNumberStyle:NSNumberFormatterNoStyle withDefault:theDefault roundingScale:-1 roundingMode:mode];
}

- (float)floatForKey:(id)key formatNumberStyle:(NSNumberFormatterStyle)numberStyle withDefault:(float)theDefault roundingScale:(short)scale roundingMode:(NSRoundingMode)mode
{
    NSDecimalNumber *value = [self numberForKey:key formatNumberStyle:numberStyle withDefault:theDefault roundingScale:scale roundingMode:mode];
    
    return [value floatValue];
}

- (double)doubleForKey:(id)key
{
    return [self doubleForKey:key withDefault:0.0f];
}

- (double)doubleForKey:(id)key withDefault:(double)theDefault
{
    return [self doubleForKey:key formatNumberStyle:NSNumberFormatterNoStyle withDefault:theDefault];
}

- (double)doubleForKey:(id)key formatNumberStyle:(NSNumberFormatterStyle)numberStyle withDefault:(double)theDefault
{
    return [self doubleForKey:key formatNumberStyle:numberStyle withDefault:theDefault roundingScale:-1 roundingMode:NSRoundPlain];
}

- (double)MqDoubleForKey:(id)key
{
    return [self MqDoubleForKey:key withDefault:0.0f];
}

- (double)MqDoubleForKey:(id)key withDefault:(double)theDefault
{
    return [self MqDoubleForKey:key formatNumberStyle:NSNumberFormatterNoStyle withDefault:theDefault];
}

- (double)MqDoubleForKey:(id)key formatNumberStyle:(NSNumberFormatterStyle)numberStyle withDefault:(double)theDefault
{
    return [self doubleForKey:key formatNumberStyle:numberStyle withDefault:theDefault roundingScale:2 roundingMode:NSRoundPlain];
}

- (double)doubleForKey:(id)key withDefault:(double)theDefault roundingScale:(short)scale roundingMode:(NSRoundingMode)mode
{
    return [self doubleForKey:key formatNumberStyle:NSNumberFormatterNoStyle withDefault:theDefault roundingScale:scale roundingMode:mode];
}

- (double)doubleForKey:(id)key formatNumberStyle:(NSNumberFormatterStyle)numberStyle withDefault:(double)theDefault roundingScale:(short)scale roundingMode:(NSRoundingMode)mode
{
    NSDecimalNumber *value = [self numberForKey:key formatNumberStyle:numberStyle withDefault:theDefault roundingScale:scale roundingMode:mode];
    
    return [value doubleValue];
}

- (NSDecimalNumber *)numberForKey:(id)key
{
    return [self numberForKey:key withDefault:0.0f];
}

- (NSDecimalNumber *)numberForKey:(id)key withDefault:(double)theDefault
{
    return [self numberForKey:key formatNumberStyle:NSNumberFormatterNoStyle withDefault:theDefault];
}

- (NSDecimalNumber *)numberForKey:(id)key formatNumberStyle:(NSNumberFormatterStyle)numberStyle withDefault:(double)theDefault
{
    return [self numberForKey:key formatNumberStyle:numberStyle withDefault:theDefault roundingScale:-1 roundingMode:NSRoundPlain];
}

- (NSDecimalNumber *)numberForKey:(id)key withDefault:(double)theDefault roundingScale:(short)scale roundingMode:(NSRoundingMode)mode
{
    return [self numberForKey:key formatNumberStyle:NSNumberFormatterNoStyle withDefault:theDefault  roundingScale:scale roundingMode:mode];
}

- (NSDecimalNumber *)numberForKey:(id)key formatNumberStyle:(NSNumberFormatterStyle)numberStyle withDefault:(double)theDefault roundingScale:(short)scale roundingMode:(NSRoundingMode)mode
{
    return [self numberForKey:key formatNumberStyle:numberStyle withDefault:@(theDefault) roundingScale:scale roundingMode:mode isDouble:YES];
}


- (NSDecimalNumber *)MqNumberForKey:(id)key
{
    return [self numberForKey:key withDefault:0.0f roundingScale:2 roundingMode:NSRoundPlain];
}

- (NSDecimalNumber *)MqNumberForKey:(id)key withDefault:(double)theDefault
{
    return [self MqNumberForKey:key formatNumberStyle:NSNumberFormatterNoStyle withDefault:theDefault];
}

- (NSDecimalNumber *)MqNumberForKey:(id)key formatNumberStyle:(NSNumberFormatterStyle)numberStyle withDefault:(double)theDefault
{
    return [self numberForKey:key formatNumberStyle:numberStyle withDefault:theDefault roundingScale:2 roundingMode:NSRoundPlain];
}

- (NSDecimalNumber *)MqNumberForKey:(id)key withDefaultDecimalNumber:(NSDecimalNumber *)theDefault
{
    return [self MqNumberForKey:key formatNumberStyle:NSNumberFormatterNoStyle withDefaultDecimalNumber:theDefault];
}

- (NSDecimalNumber *)MqNumberForKey:(id)key formatNumberStyle:(NSNumberFormatterStyle)numberStyle withDefaultDecimalNumber:(NSDecimalNumber *)theDefault
{
    return [self numberForKey:key formatNumberStyle:numberStyle withDefault:theDefault roundingScale:2 roundingMode:NSRoundPlain isDouble:NO];
}

- (NSDecimalNumber *)numberForKey:(id)key withDefault:(id)theDefault roundingScale:(short)scale roundingMode:(NSRoundingMode)mode isDouble:(BOOL)isDouble
{
    return [self numberForKey:key formatNumberStyle:NSNumberFormatterNoStyle withDefault:theDefault roundingScale:scale roundingMode:mode isDouble:isDouble];
}

- (NSDecimalNumber *)numberForKey:(id)key formatNumberStyle:(NSNumberFormatterStyle)numberStyle withDefault:(id)theDefault roundingScale:(short)scale roundingMode:(NSRoundingMode)mode isDouble:(BOOL)isDouble
{
    NSDecimalNumber *value = isDouble ? [[NSDecimalNumber alloc] initWithDouble:[theDefault doubleValue]] : theDefault;
    
    id object = [self objectForKey:key];
    if ([object isValided])
    {
        if ([object isKindOfClass:[NSNumber class]])
        {
            value = [[NSDecimalNumber alloc] initWithDecimal:[((NSNumber *)object) decimalValue]];
        }
        else if ([object isKindOfClass:[NSString class]])
        {
            NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
            nf.numberStyle = numberStyle;
            NSNumber *number = [nf numberFromString:object];
            
            if ([number isKindOfClass:[NSNumber class]])
            {
                value = [[NSDecimalNumber alloc] initWithDecimal:[number decimalValue]];
            }
            else
            {
                value = [NSDecimalNumber decimalNumberWithString:(NSString *)object];
            }
            
            if ([value isEqualToNumber:[NSDecimalNumber notANumber]])
            {
                value = isDouble ? [[NSDecimalNumber alloc] initWithDouble:[theDefault doubleValue]] : theDefault;
            }
        }
    }
    
    if (scale < 0)
    {
        return value;
    }
    
    NSDecimalNumber *rounded = [NSDecimalNumber roundingNumber:value withScale:scale mode:mode];
    
    return rounded;
};

- (NSDate *)dateForKey:(id)key
{
    return [self dateForKey:key withDefault:nil format:nil];
}

- (NSDate *)dateForKey:(id)key withFormat:(NSString *)format
{
    return [self dateForKey:key withDefault:nil format:format];
}

- (NSDate *)dateForKey:(id)key withDefault:(NSDate *)theDefault format:(NSString *)format
{
    NSDate *value = theDefault;
    
    id object = [self objectForKey:key];
    
    if ([object isValided])
    {
        if ([object isKindOfClass:[NSDate class]])
        {
            return (NSDate *)object;
        }
        
        if (![format isNotEmpty])
        {
            if ([object isKindOfClass:[NSNumber class]] || [object isKindOfClass:[NSString class]])
            {
                value = [NSDate dateWithTimeIntervalSince1970:[object doubleValue]];
            }
        }
        else
        {
            if ([object isKindOfClass:[NSString class]])
            {
                value = [NSDate dateFromString:object withFormat:format];
            }
        }
    }
    
    return value;
}

- (NSString *)stringForKey:(id)key
{
    return [self stringForKey:key withDefault:nil];
}

- (NSString *)DJStringForKey:(id)key
{
    return [self DJStringForKey:key withDefault:nil];
}


- (NSString *)stringForKey:(id)key withDefault:(NSString *)theDefault
{
    NSString *value = theDefault;
    
    id object = [self objectForKey:key];
    if ([object isValided])
    {
        if ([object isKindOfClass:[NSString class]])
        {
            value = (NSString *)object;
        }
        else if ([object isKindOfClass:[NSNumber class]])
        {
            value = ((NSNumber *)object).stringValue;
        }
        else if ([object isKindOfClass:[NSURL class]])
        {
            value = ((NSURL *)object).absoluteString;
        }
    }
    
    return value;
}

- (NSString *)DJStringForKey:(id)key withDefault:(NSString *)theDefault
{
    NSString *value = theDefault;
    
    id object = [self objectForKey:key];
    if ([object isValided])
    {
        if ([object isKindOfClass:[NSString class]])
        {
            value = (NSString *)object;
        }
        else if ([object isKindOfClass:[NSNumber class]])
        {
            value = ((NSNumber *)object).stringValue;
        }
        else if ([object isKindOfClass:[NSURL class]])
        {
            value = ((NSURL *)object).absoluteString;
        }
    }
    
    return value;
}


- (NSString *)stringTrimForKey:(id)key
{
    return [self stringTrimForKey:key withDefault:nil];
}

- (NSString *)stringTrimForKey:(id)key withDefault:(NSString *)theDefault
{
    NSString *value = [self stringForKey:key withDefault:theDefault];
    
    return [value trim];
}

- (CGPoint)pointForKey:(id)key
{
    CGPoint point = CGPointZero;
    NSDictionary *dictionary = [self valueForKey:key];
    
    if ([dictionary isValided] && [dictionary isKindOfClass:[NSDictionary class]])
    {
        BOOL success = CGPointMakeWithDictionaryRepresentation((__bridge CFDictionaryRef)dictionary, &point);
        if (success)
            return point;
        else
            return CGPointZero;
    }
    
    return CGPointZero;
}

- (CGSize)sizeForKey:(id)key
{
    CGSize size = CGSizeZero;
    NSDictionary *dictionary = [self valueForKey:key];
    
    if ([dictionary isValided] && [dictionary isKindOfClass:[NSDictionary class]])
    {
        BOOL success = CGSizeMakeWithDictionaryRepresentation((__bridge CFDictionaryRef)dictionary, &size);
        if (success)
            return size;
        else
            return CGSizeZero;
    }
    
    return CGSizeZero;
}

- (CGRect)rectForKey:(id)key
{
    CGRect rect = CGRectZero;
    NSDictionary *dictionary = [self valueForKey:key];
    
    if ([dictionary isValided] && [dictionary isKindOfClass:[NSDictionary class]])
    {
        BOOL success = CGRectMakeWithDictionaryRepresentation((__bridge CFDictionaryRef)dictionary, &rect);
        if (success)
            return rect;
        else
            return CGRectZero;
    }
    
    return CGRectZero;
}

- (NSArray *)arrayForKey:(id)key
{
    NSArray *value = nil;
    
    id object = [self objectForKey:key];
    if ([object isValided] && [object isKindOfClass:[NSArray class]])
    {
        value = (NSArray *)object;
    }
    
    return value;
}

- (NSDictionary *)dictionaryForKey:(id)key
{
    NSDictionary *value = nil;
    
    id object = [self objectForKey:key];
    if ([object isValided] && [object isKindOfClass:[NSDictionary class]])
    {
        value = (NSDictionary *)object;
    }
    
    return value;
}

- (BOOL)containsObjectForKey:(id)key
{
    return [[self allKeys] containsObject:key];
}

- (NSArray *)allKeysSorted
{
    return [[self allKeys] sortedArray];
}

- (NSArray *)allValuesSortedByKeys
{
    NSArray *sortedKeys = [self allKeysSorted];
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    for (id key in sortedKeys)
    {
        [arr addObject:self[key]];
    }
    return arr;
}

- (NSString *)toJSON
{
    // NSJSONWritingPrettyPrinted
    return [self toJSONWithOptions:0];
}

- (NSString *)toJSONWithOptions:(NSJSONWritingOptions)options
{
    NSString *json = nil;
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:options error:&error];
    
    if (!jsonData)
    {
        return @"{}";
    }
    else if (!error)
    {
        json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return json;
    }
    else
    {
        NSLog(@"%@", error.localizedDescription);
    }
    
    return nil;
}

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

// for LLPaySdk
- (NSData *)transformToData
{
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    [archiver encodeObject:self forKey:@"talkData"];
    [archiver finishEncoding];
    
    return data;
}


@end


@implementation NSDictionary (DeepMutableCopy)


- (NSMutableDictionary *)deepMutableCopy
{
    NSMutableDictionary *newDictionary;
    NSEnumerator *keyEnumerator;
    id anObject;
    id aKey;
	
    newDictionary = [self mutableCopy];
    // Run through the new dictionary and replace any objects that respond to -deepMutableCopy or -mutableCopy with copies.
    keyEnumerator = [[newDictionary allKeys] objectEnumerator];
    while ((aKey = [keyEnumerator nextObject])) {
        anObject = [newDictionary objectForKey:aKey];
        if ([anObject respondsToSelector:@selector(deepMutableCopy)]) {
            anObject = [anObject deepMutableCopy];
            [newDictionary setObject:anObject forKey:aKey];
            //[anObject ah_release];
        } else if ([anObject respondsToSelector:@selector(mutableCopyWithZone:)]) {
            anObject = [anObject mutableCopyWithZone:nil];
            [newDictionary setObject:anObject forKey:aKey];
            //[anObject ah_release];
        } else {
			[newDictionary setObject:anObject forKey:aKey];
		}
    }
	
    return newDictionary;
}

@end


@implementation NSMutableDictionary (bbCategory)

- (void)setInteger:(NSInteger)value forKey:(id)key
{
    NSNumber *number = [NSNumber numberWithInteger:value];
    [self setObject:number forKey:key];    
}

- (void)setUInteger:(NSUInteger)value forKey:(id)key
{
    NSNumber *number = [NSNumber numberWithUnsignedInteger:value];
    [self setObject:number forKey:key];
}

- (void)setBool:(BOOL)value forKey:(id)key
{
    NSNumber *number = [NSNumber numberWithBool:value];
    [self setObject:number forKey:key];    
}

- (void)setFloat:(float)value forKey:(id)key
{
    NSNumber *number = [NSNumber numberWithFloat:value];
    [self setObject:number forKey:key];
}

- (void)setDouble:(double)value forKey:(id)key
{
    NSNumber *number = [NSNumber numberWithDouble:value];
    [self setObject:number forKey:key];
}

- (void)setString:(NSString *)value forKey:(id)key
{
    if (!value)
    {
       return;
    }
    [self setObject:value forKey:key];
}

- (void)setPoint:(CGPoint)value forKey:(id)key
{
    CFDictionaryRef dictionary = CGPointCreateDictionaryRepresentation(value);
    NSDictionary *pointDict = [NSDictionary dictionaryWithDictionary:
                               (__bridge NSDictionary *)dictionary]; // autoreleased
    CFRelease(dictionary);
    
    [self setValue:pointDict forKey:key];
}

- (void)setSize:(CGSize)value forKey:(id)key
{
    CFDictionaryRef dictionary = CGSizeCreateDictionaryRepresentation(value);
    NSDictionary *sizeDict = [NSDictionary dictionaryWithDictionary:
                               (__bridge NSDictionary *)dictionary]; // autoreleased
    CFRelease(dictionary);
    
    [self setValue:sizeDict forKey:key];
}

- (void)setRect:(CGRect)value forKey:(id)key
{
    CFDictionaryRef dictionary = CGRectCreateDictionaryRepresentation(value);
    NSDictionary *rectDict = [NSDictionary dictionaryWithDictionary:
                              (__bridge NSDictionary *)dictionary]; // autoreleased
    CFRelease(dictionary);
    
    [self setValue:rectDict forKey:key];
}

@end
