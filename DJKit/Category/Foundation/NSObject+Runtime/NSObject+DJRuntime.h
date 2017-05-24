//
//  NSObject+DJRuntime.h
//  DJkit
//
//  Created by DennisDeng on 2017/3/22.
//  Copyright © 2017年 DennisDeng. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DJObjectManager.h"


NS_ASSUME_NONNULL_BEGIN

@interface NSObject (DJRuntime)

+ (nullable NSArray *)applicationClassList;
//+ (NSString *)className;
//- (NSString *)className;

+ (NSArray *)propertyList;
+ (NSArray *)inheritedPropertyList;
+ (NSArray *)allPropertyList;

+ (NSArray *)ivarList;
+ (NSArray *)inheritedIvarList;
+ (NSArray *)allIvarList;

+ (NSArray *)methodList;
+ (NSArray *)inheritedMethodList;
+ (NSArray *)allMethodList;

+ (NSArray *)classMethodList;
+ (NSArray *)inheritedClassMethodList;
+ (NSArray *)allClassMethodList;

+ (NSArray *)superClassList;
+ (NSArray *)allSuperClassList;

- (Class)getMetaClass;

@end

NS_ASSUME_NONNULL_END

