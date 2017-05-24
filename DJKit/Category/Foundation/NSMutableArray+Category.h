//
//  NSMutableArray+Category.h
//  DJkit
//
//  Created by DennisDeng on 2017/5/19.
//  Copyright © 2016年 DennisDeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Category)

- (void)moveObjectToTop:(NSUInteger)index;

- (void)moveObjectFromIndex:(NSUInteger)oldIndex toIndex:(NSUInteger)newIndex;

- (nonnull NSMutableArray *)removeFirstObject;

// maxCount 数组最大容量
- (BOOL)addObject:(nonnull id)anObject withMaxCount:(NSUInteger)maxCount;
- (NSUInteger)addObjects:(nullable NSArray *)array withMaxCount:(NSUInteger)maxCount;

- (void)insertArray:(nonnull NSArray *)array atIndex:(NSUInteger)index;
- (NSUInteger)replaceObject:(nonnull id)objectToReplace withObject:(nonnull id)object;

- (void)shuffle;

@end
