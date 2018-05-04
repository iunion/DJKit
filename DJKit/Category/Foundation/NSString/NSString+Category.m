//
//  NSString+Category.m
//  DJkit
//
//  Created by DennisDeng on 12-1-6.
//  Copyright (c) 2012年 DennisDeng. All rights reserved.
//

#import "NSString+Category.h"
#import "NSDate+Category.h"
#import "NSDecimalNumber+Category.h"
#import "NSObject+Category.h"
//#import "UIDevice+Category.h"
#import "NSString+RegEx.h"


@implementation NSString (Category)

+ (NSString *)stringTrim:(NSString *)str
{
    NSString *string1;
    
    string1 = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return string1;
}

+ (NSString *)stringTrimStart:(NSString *)str
{
    NSString *string1;
    
    string1 = [[str stringByAppendingString:@"a"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return [string1 substringToIndex:[string1 length]-1];
}

+ (NSString *)stringTrimEnd:(NSString *)str
{
    NSString *string1;
    
    string1 = [[@"a" stringByAppendingString:str] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return [string1 substringFromIndex:1];
}

+ (NSString *)stringTrimAllSpace:(NSString *)trimmingStr
{
    return [trimmingStr trimAllSpace];
}

- (NSString *)trim
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)trimSpace
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

// @"@／：；（）¥「」＂、[]{}#%-*+=_\\|~＜＞$€^•'@#$%^&*()_+'\""
- (NSString *)trimWithCharacters:(NSString *)characters
{
    if ([characters isNotEmpty])
    {
        // 定义一个特殊字符的集合
        NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:characters];
        // 过滤字符串的特殊字符
        return [self stringByTrimmingCharactersInSet:set];
    }
    else
    {
        return self;
    }
}

- (NSString *)trimAllSpace
{
    NSString *resultStr;
    
    resultStr = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    NSArray *components = [resultStr componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    components = [components filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF != ' ' AND SELF != '\t'"]];
    resultStr = [components componentsJoinedByString:@""];
    
    return resultStr;
}

- (BOOL)containString:(NSString *)string
{
    return ([self rangeOfString:string].location == NSNotFound) ? NO : YES;
}

- (BOOL)containString:(NSString *)string options:(NSStringCompareOptions)mask
{
    NSUInteger location = [self rangeOfString:string options:mask].location;
    return (location == NSNotFound) ? NO : YES;
}

// 添加随机数
+ (NSString *)string:(NSString *)str appendRandom:(NSUInteger)ram
{
    int randValue = arc4random();
    if (randValue < 0)
    {
        randValue = randValue * -1;
    }
    randValue = randValue % (ram+1);
    return [NSString stringWithFormat:@"%@%d", str, randValue];
}

+ (NSString *)string:(NSString *)str appendRandom:(NSUInteger)ram startFrom:(NSUInteger)start
{
    NSUInteger randValue = arc4random();
    randValue = randValue % (ram+1-start) + start;
    return [NSString stringWithFormat:@"%@%lu", str, (unsigned long)randValue];
}

- (NSInteger)indexOfCharacter:(char)character
{
    for (NSUInteger i = 0; i < [self length]; i++)
    {
        if ([self characterAtIndex:i] == character)
        {
            return i;
        }
    }
    
    return NSNotFound;
}

- (NSString *)subStringFromCharacter:(char)character
{
    NSInteger index = [self indexOfCharacter:character];
    if (index != NSNotFound)
    {
        return [self substringFromIndex:(NSUInteger)index];
    }
    else
    {
        return nil;
    }
}

- (NSString *)subStringToCharacter:(char)character
{
    NSInteger index = [self indexOfCharacter:character];
    if (index != NSNotFound)
    {
        return [self substringToIndex:(NSUInteger)index];
    }
    else
    {
        return nil;
    }
}

- (NSString *)subStringFromChar:(char)charStart toChar:(char)charEnd
{
    NSUInteger startIndex = 0, endIndex = 0;
    NSUInteger length = 0;
    
    for (NSUInteger i = 0; i < [self length]; i++)
    {
        if ([self characterAtIndex:i] == charStart && startIndex == 0)
        {
            startIndex = i+1;
            i += 1;
            continue;
        }
        if ([self characterAtIndex:i] == charEnd)
        {
            endIndex = i;
            break;
        }
    }
    
    if (endIndex != 0)
    {
        length = endIndex - startIndex;
    }
    if (length != 0)
    {
        NSRange rang = NSMakeRange(startIndex, length);
        
        return [self substringWithRange:rang];
    }
    
    return nil;
}

+ (NSString *)storeString:(double)bsize
{
    if (bsize < 1024)
    {
        return [NSString stringWithFormat:@"%ldB", (long)bsize];
    }
    else if (bsize < 1024*1024)
    {
        double kbsize = (CGFloat)bsize / 1024;
        return [NSString stringWithFormat:@"%0.2fKB", kbsize];
    }
    else if (bsize < 1024*1024*1024)
    {
        double kbsize = (CGFloat)bsize / (1024*1024);
        return [NSString stringWithFormat:@"%0.2fMB", kbsize];
    }
    else
    {
        double kbsize = (CGFloat)bsize / (1024*1024*1024);
        return [NSString stringWithFormat:@"%0.2fGB", kbsize];
    }
}

+ (NSString *)countString:(NSUInteger)count
{
    if (count < 999)
    {
        return [NSString stringWithFormat:@"%ld", (long)count];
    }
    else if (count < 99000)
    {
        NSUInteger kcount = count / 1000;
        return [NSString stringWithFormat:@"%ldK", (long)kcount];
    }
    else
    {
        return @"99k+";
    }
}

// 得到一个时间格式为:02天 14时 49分 16秒
+ (NSString *)makeDayHourMinuteSecondStrWith:(NSUInteger)second
{
    NSUInteger days = second / SECONDS_IN_DAY;
    NSUInteger hours = (second / SECONDS_IN_HOUR) % 24;
    NSUInteger minutes = (second / SECONDS_IN_MINUTE) % 60;
    NSUInteger seconds = second % 60;
    
    return [NSString stringWithFormat:@"%@天 %@时 %@分 %@秒", @(days), @(hours), @(minutes), @(seconds)];
}

// 判断是否为整形
- (BOOL)isPureInt
{
    NSScanner* scan = [NSScanner scannerWithString:self];
    
    int val;
    
    return [scan scanInt:&val] && [scan isAtEnd];
}

// 判断是否为浮点形
- (BOOL)isPureFloat
{
    NSScanner* scan = [NSScanner scannerWithString:self];
    
    float val;
    
    return [scan scanFloat:&val] && [scan isAtEnd];
}

+ (NSUInteger)integerFromStr:(NSString *)string withBase:(NSInteger)base
{
    return (NSUInteger)strtoull([string UTF8String], NULL, (int)base);
}

// 转换16进制字符串为10进制数字
+ (NSUInteger)integerFromHexStr:(NSString *)hexString
{
    return (NSUInteger)strtoull([hexString UTF8String], 0, 16);
}

- (NSUInteger)hexStrToInteger
{
    return [NSString integerFromHexStr:self];
}

// 转换10进制数字为16进制字符串
+ (NSString *)hexStrFromInteger:(NSUInteger)intNum
{
    NSString *nLetterValue;
    NSString *str = @"";
    
    NSUInteger ttmpig;
    for (NSUInteger i = 0; i < 9; i++)
    {
        ttmpig = intNum%16;
        intNum = intNum/16;
        switch (ttmpig)
        {
            case 10:
                nLetterValue =@"A"; break;
            case 11:
                nLetterValue =@"B"; break;
            case 12:
                nLetterValue =@"C"; break;
            case 13:
                nLetterValue =@"D"; break;
            case 14:
                nLetterValue =@"E"; break;
            case 15:
                nLetterValue =@"F"; break;
            default:nLetterValue=[[NSString alloc] initWithFormat:@"%@", @(ttmpig)];
                
        }
        
        str = [nLetterValue stringByAppendingString:str];
        
        if (intNum == 0)
        {
            break;
        }
    }
    
    return str;
}

- (NSString *)toJsonString;
{
    return [NSString stringWithFormat:@"\"%@\"",
            [[self stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"] stringByReplacingOccurrencesOfString:@"\""withString:@"\\\""]
            ];
}

- (NSString *)escapeHTML
{
    NSMutableString *result = [[NSMutableString alloc] initWithString:self];
    
    [result replaceOccurrencesOfString:@"&" withString:@"&amp;" options:NSLiteralSearch range:NSMakeRange(0, [result length])];
    [result replaceOccurrencesOfString:@"<" withString:@"&lt;" options:NSLiteralSearch range:NSMakeRange(0, [result length])];
    [result replaceOccurrencesOfString:@">" withString:@"&gt;" options:NSLiteralSearch range:NSMakeRange(0, [result length])];
    [result replaceOccurrencesOfString:@"\"" withString:@"&quot;" options:NSLiteralSearch range:NSMakeRange(0, [result length])];
    [result replaceOccurrencesOfString:@"'" withString:@"&#39;" options:NSLiteralSearch range:NSMakeRange(0, [result length])];
    return result;
}

- (NSURL *)toURL
{
    if ([self isNotEmpty])
    {
        return [NSURL URLWithString:self];
    }
    return nil;
}

+ (NSString *)convertUnicode:(NSString *)aString
{
    //NSString *ret = [aString replace:RX(@"\\\\[uU]\\w{4}")
    NSString *ret = [aString replace:RX(@"\\\\?\\\\[uU]\\w{4}")
                           withBlock:^NSString *(NSString *match) {
                               NSString *str = [NSString stringWithCString:[match cStringUsingEncoding:NSUTF8StringEncoding]
                                                                  encoding:NSNonLossyASCIIStringEncoding];
                               return str ?: match;
                           }];
    
    return ret;
}

- (NSString *)convertUnicode
{
    return [NSString convertUnicode:self];
}

@end


#pragma mark Size

@implementation NSString (Size)

- (CGSize)sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode
{
    CGSize result;
    if (!font) font = [UIFont systemFontOfSize:12];
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableDictionary *attr = [NSMutableDictionary new];
        attr[NSFontAttributeName] = font;
        if (lineBreakMode != NSLineBreakByWordWrapping) {
            NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
            paragraphStyle.lineBreakMode = lineBreakMode;
            attr[NSParagraphStyleAttributeName] = paragraphStyle;
        }
        CGRect rect = [self boundingRectWithSize:size
                                         options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                      attributes:attr context:nil];
        result = rect.size;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        result = [self sizeWithFont:font constrainedToSize:size lineBreakMode:lineBreakMode];
#pragma clang diagnostic pop
    }
    return result;
}

- (CGFloat)widthForFont:(UIFont *)font
{
    CGSize size = [self sizeForFont:font size:CGSizeMake(HUGE, HUGE) mode:NSLineBreakByCharWrapping];
    return size.width;
}

- (CGFloat)heightForFont:(UIFont *)font width:(CGFloat)width
{
    CGSize size = [self sizeForFont:font size:CGSizeMake(width, HUGE) mode:NSLineBreakByCharWrapping];
    return size.height;
}


- (CGSize)sizeToFitWidth:(CGFloat)width withFont:(UIFont *)font
{
    CGSize maxSize = CGSizeMake(width, CGFLOAT_MAX);
    return [self sizeToFit:maxSize withFont:font lineBreakMode:NSLineBreakByCharWrapping];
}

- (CGSize)sizeToFitHeight:(CGFloat)height withFont:(UIFont *)font
{
    CGSize maxSize = CGSizeMake(CGFLOAT_MAX, height);
    return [self sizeToFit:maxSize withFont:font lineBreakMode:NSLineBreakByCharWrapping];
}

- (CGSize)sizeToFit:(CGSize)maxSize withFont:(UIFont *)font lineBreakMode:(NSLineBreakMode)lineBreakMode
{
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;

    if (lineBreakMode ==  NSLineBreakByTruncatingHead ||
        lineBreakMode ==  NSLineBreakByTruncatingTail ||
        lineBreakMode ==  NSLineBreakByTruncatingMiddle )
    {
        options |= NSStringDrawingTruncatesLastVisibleLine;
    }

    CGRect textRect = [self boundingRectWithSize:maxSize options:options attributes:@{NSFontAttributeName:font} context:nil];

    return textRect.size;
}

- (CGSize)sizeToFitWidth:(CGFloat)width withFont:(UIFont *)font paragraphStyle:(NSMutableParagraphStyle *)paragraphStyle
{
    CGSize maxSize = CGSizeMake(width, CGFLOAT_MAX);
    return [self sizeToFit:maxSize withFont:font paragraphStyle:paragraphStyle];
}

- (CGSize)sizeToFitHeight:(CGFloat)height withFont:(UIFont *)font paragraphStyle:(NSMutableParagraphStyle *)paragraphStyle
{
    CGSize maxSize = CGSizeMake(CGFLOAT_MAX, height);
    return [self sizeToFit:maxSize withFont:font paragraphStyle:paragraphStyle];
}

- (CGSize)sizeToFit:(CGSize)maxSize withFont:(UIFont *)font paragraphStyle:(NSMutableParagraphStyle *)paragraphStyle
{
//    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
//    paragraphStyle.alignment = NSTextAlignmentLeft;
//    paragraphStyle.hyphenationFactor = 0.0f;
//    paragraphStyle.firstLineHeadIndent = 0.0f;
//    paragraphStyle.paragraphSpacing = 0.0f;
//    paragraphStyle.headIndent = 0.0f;
//    paragraphStyle.lineSpacing = 3.0f;
    
    NSDictionary *attributes = @{NSFontAttributeName : font,
                                 NSParagraphStyleAttributeName : paragraphStyle};
    
    CGRect rect = [self boundingRectWithSize:maxSize options:(NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin) attributes:attributes context:nil];
    
    return rect.size;
}

@end


#pragma mark -
#pragma mark paths

@implementation NSString (paths)

#pragma mark Standard Paths

- (NSString *)getFullFileExtension
{
    NSString *extension = [self pathExtension];
    if (![extension isEqualToString:@""])
    {
        extension = [NSString stringWithFormat:@".%@", extension];
    }
    
    return extension;
}

+ (NSString *)cachesPath
{
    static dispatch_once_t onceToken;
    static NSString *cachedPath;
    
    dispatch_once(&onceToken, ^{
        cachedPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    });
    
    return cachedPath;
}

+ (NSString *)documentsPath
{
    static dispatch_once_t onceToken;
    static NSString *cachedPath;
    
    dispatch_once(&onceToken, ^{
        cachedPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    });
    
    return cachedPath;
}

+ (NSString *)libraryPath
{
    static dispatch_once_t onceToken;
    static NSString *cachedPath;
    
    dispatch_once(&onceToken, ^{
        cachedPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
    });
    
    return cachedPath;
}

+ (NSString *)bundlePath
{
    return [[NSBundle mainBundle] bundlePath];
}

+ (NSString *)applicationPath
{
    return [NSBundle mainBundle].executablePath;
}

+ (NSString *)applicationName
{
    return [NSString applicationPath].lastPathComponent;
}


#pragma mark - Temporary Paths

+ (NSString *)temporaryPath
{
    static dispatch_once_t onceToken;
    static NSString *cachedPath;
    
    dispatch_once(&onceToken, ^{
        cachedPath = NSTemporaryDirectory();
    });
    
    return cachedPath;
}

+ (NSString *)pathForTemporaryFile
{
    CFUUIDRef newUniqueId = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef newUniqueIdString = CFUUIDCreateString(kCFAllocatorDefault, newUniqueId);
    NSString *tmpPath = [[NSString temporaryPath] stringByAppendingPathComponent:(__bridge NSString *)newUniqueIdString];
    CFRelease(newUniqueId);
    CFRelease(newUniqueIdString);
    
    return tmpPath;
}

#pragma mark Working with Paths

// sdfds123 --> sdfds124
- (NSString *)pathByIncrementingSequenceNumber
{
    NSString *baseName = [self stringByDeletingPathExtension];
    NSString *extension = [self pathExtension];
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\(([0-9]+)\\)$" options:0 error:NULL];
    __block NSInteger sequenceNumber = 0;
    
    [regex enumerateMatchesInString:baseName options:0 range:NSMakeRange(0, [baseName length]) usingBlock:^(NSTextCheckingResult *match, NSMatchingFlags flags, BOOL *stop){
        
        NSRange range = [match rangeAtIndex:1]; // first capture group
        NSString *substring= [self substringWithRange:range];
        
        sequenceNumber = [substring integerValue];
        *stop = YES;
    }];
    
    NSString *nakedName = [baseName pathByDeletingSequenceNumber];
    
    if ([extension isEqualToString:@""])
    {
        return [nakedName stringByAppendingFormat:@"(%ld)", (long)sequenceNumber+1];
    }
    
    return [[nakedName stringByAppendingFormat:@"(%ld)", (long)sequenceNumber+1] stringByAppendingPathExtension:extension];
}

// sdfds123 --> sdfds
- (NSString *)pathByDeletingSequenceNumber
{
    NSString *baseName = [self stringByDeletingPathExtension];
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\([0-9]+\\)$" options:0 error:NULL];
    __block NSRange range = NSMakeRange(NSNotFound, 0);
    
    [regex enumerateMatchesInString:baseName options:0 range:NSMakeRange(0, [baseName length]) usingBlock:^(NSTextCheckingResult *match, NSMatchingFlags flags, BOOL *stop) {
        
        range = [match range];
        
        *stop = YES;
    }];
    
    if (range.location != NSNotFound)
    {
        return [self stringByReplacingCharactersInRange:range withString:@""];
    }
    
    return self;
}

@end


