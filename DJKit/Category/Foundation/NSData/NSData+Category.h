//
//  NSData+Category.h
//  DJkit
//
//  Created by DennisDeng on 12-6-11.
//  Copyright (c) 2012年 DennisDeng. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSData (Category)

@property (nonatomic, readonly, nonnull) NSString *hexStringValue;

+ (nonnull NSData *)dataFromHexString:(nonnull NSString *)hexString;

@end


@interface NSData (RSHexDump)

//- (NSString *)description;

// startOffset may be negative, indicating offset from end of data
- (nonnull NSString *)descriptionFromOffset:(NSInteger)startOffset;
- (nonnull NSString *)descriptionFromOffset:(NSInteger)startOffset limitingToByteCount:(NSUInteger)maxBytes;

@end
