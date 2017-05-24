//
//  wiNSString+MD5HexDigest.h
//  DJkit
//
//  Created by DennisDeng on 12-1-6.
//  Copyright (c) 2012年 DennisDeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Category)

// 删除空白字符
+ (NSString *)stringTrim:(NSString *)str;
+ (NSString *)stringTrimStart:(NSString *)str;
+ (NSString *)stringTrimEnd:(NSString *)str;
// 删除首尾和中间的空白字符
+ (NSString *)stringTrimAllSpace:(NSString *)trimmingStr;

- (NSString *)trim;
- (NSString *)trimSpace;
- (NSString *)trimWithCharacters:(NSString *)characters;
- (NSString *)trimAllSpace;

- (BOOL)containString:(NSString *)string;
- (BOOL)containString:(NSString *)string options:(NSStringCompareOptions)mask;

// 添加随机数
+ (NSString *)string:(NSString *)str appendRandom:(NSUInteger)ram;
+ (NSString *)string:(NSString *)str appendRandom:(NSUInteger)ram startFrom:(NSUInteger)start;

- (NSInteger)indexOfCharacter:(char)character;

- (NSString *)subStringFromCharacter:(char)character;
- (NSString *)subStringToCharacter:(char)character;

- (NSString *)subStringFromChar:(char)charStart toChar:(char)charEnd;

// 从bit转化为KB、MB、GB
+ (NSString *)storeString:(double)bsize;
+ (NSString *)countString:(NSUInteger)count;

// 得到一个时间格式为:02天 14时 49分 16秒
+ (NSString *)makeDayHourMinuteSecondStrWith:(NSUInteger)second;

// 判断是否为整形
- (BOOL)isPureInt;
// 判断是否为浮点形
- (BOOL)isPureFloat;

+ (NSUInteger)integerFromStr:(NSString *)string withBase:(NSInteger)base;
// 转换16进制字符串为10进制数字
+ (NSUInteger)integerFromHexStr:(NSString *)hexString;
- (NSUInteger)hexStrToInteger;
// 转换10进制数字为大写16进制字符串
+ (NSString *)hexStrFromInteger:(NSUInteger)intNum;

- (NSString *)toJsonString;

- (NSString *)escapeHTML;

- (NSURL *)toURL;

+ (NSString *)convertUnicode:(NSString *)aString;
- (NSString *)convertUnicode;

@end


#pragma mark - Size

@interface NSString (Size)

/**
 Returns the size of the string if it were rendered with the specified constraints.
 
 @param font          The font to use for computing the string size.
 
 @param size          The maximum acceptable size for the string. This value is
 used to calculate where line breaks and wrapping would occur.
 
 @param lineBreakMode The line break options for computing the size of the string.
 For a list of possible values, see NSLineBreakMode.
 
 @return              The width and height of the resulting string's bounding box.
 These values may be rounded up to the nearest whole number.
 */
- (CGSize)sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode;

/**
 Returns the width of the string if it were to be rendered with the specified
 font on a single line.
 
 @param font  The font to use for computing the string width.
 
 @return      The width of the resulting string's bounding box. These values may be
 rounded up to the nearest whole number.
 */
- (CGFloat)widthForFont:(UIFont *)font;

/**
 Returns the height of the string if it were rendered with the specified constraints.
 
 @param font   The font to use for computing the string size.
 
 @param width  The maximum acceptable width for the string. This value is used
 to calculate where line breaks and wrapping would occur.
 
 @return       The height of the resulting string's bounding box. These values
 may be rounded up to the nearest whole number.
 */
- (CGFloat)heightForFont:(UIFont *)font width:(CGFloat)width;


- (CGSize)sizeToFitWidth:(CGFloat)width withFont:(UIFont *)font;
- (CGSize)sizeToFitHeight:(CGFloat)height withFont:(UIFont *)font;
- (CGSize)sizeToFit:(CGSize)maxSize withFont:(UIFont *)font lineBreakMode:(NSLineBreakMode)lineBreakMode;

- (CGSize)sizeToFitWidth:(CGFloat)width withFont:(UIFont *)font paragraphStyle:(NSMutableParagraphStyle *)paragraphStyle;
- (CGSize)sizeToFitHeight:(CGFloat)height withFont:(UIFont *)font paragraphStyle:(NSMutableParagraphStyle *)paragraphStyle;
- (CGSize)sizeToFit:(CGSize)maxSize withFont:(UIFont *)font paragraphStyle:(NSMutableParagraphStyle *)paragraphStyle;

@end


#pragma mark - paths

/**
 A collection of useful additions for `NSString` to deal with paths.
 */

@interface NSString (paths)

/**-------------------------------------------------------------------------------------
 @name Getting Standard Paths
 ---------------------------------------------------------------------------------------
 */

/** Determines the path to the Library/Caches folder in the current application's sandbox.
 
 The return value is cached on the first call.
 
 @return The path to the app's Caches folder.
 */
+ (NSString *)cachesPath;


/** Determines the path to the Documents folder in the current application's sandbox.
 
 The return value is cached on the first call.
 
 @return The path to the app's Documents folder.
 */
+ (NSString *)documentsPath;

+ (NSString *)libraryPath;
+ (NSString *)bundlePath;

+ (NSString *)applicationPath;
+ (NSString *)applicationName;

/**-------------------------------------------------------------------------------------
 @name Getting Temporary Paths
 ---------------------------------------------------------------------------------------
 */

/** Determines the path for temporary files in the current application's sandbox.
 
 The return value is cached on the first call. This value is different in Simulator than on the actual device. In Simulator you get a reference to /tmp wheras on iOS devices it is a special folder inside the application folder.
 
 @return The path to the app's folder for temporary files.
 */
+ (NSString *)temporaryPath;


/** Creates a unique filename that can be used for one temporary file or folder.
 
 The returned string is different on every call. It is created by combining the result from temporaryPath with a unique UUID.
 
 @return The generated temporary path.
 */
+ (NSString *)pathForTemporaryFile;


/**-------------------------------------------------------------------------------------
 @name Working with Paths
 ---------------------------------------------------------------------------------------
 */
/*!
 Path extension with . or "" as before.
 
 "spliff.tiff" => ".tiff"
 "spliff" => ""
 
 @result Full path extension with .
 */
- (NSString *) getFullFileExtension;

/** Appends or Increments a sequence number in brackets
 
 If the receiver already has a number suffix then it is incremented. If not then (1) is added.
 
 @return The incremented path
 */
- (NSString *)pathByIncrementingSequenceNumber;


/** Removes a sequence number in brackets
 
 If the receiver number suffix then it is removed. If not the receiver is returned.
 
 @return The modified path
 */
- (NSString *)pathByDeletingSequenceNumber;

@end

