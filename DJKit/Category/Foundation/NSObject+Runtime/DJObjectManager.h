//
//  DJObjectManager.h
//  DJkit
//
//  Created by DennisDeng on 2017/3/23.
//  Copyright © 2017年 DennisDeng. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DJObjectDefine.h"

#import "DJObjectProperty.h"
#import "DJObjectIvar.h"
#import "DJObjectMethod.h"

NS_ASSUME_NONNULL_BEGIN

@interface DJObjectManager : NSObject

+ (NSArray<DJObjectProperty *> *)propertyListWithClass:(Class)cls;
+ (NSArray<DJObjectProperty *> *)inheritedPropertyListWithClass:(Class)cls;
+ (NSArray<DJObjectProperty *> *)allPropertyListWithClass:(Class)cls;

+ (NSArray<DJObjectIvar *> *)ivarListWithClass:(Class)cls;
+ (NSArray<DJObjectIvar *> *)inheritedIvarListWithClass:(Class)cls;
+ (NSArray<DJObjectIvar *> *)allIvarListWithClass:(Class)cls;

+ (NSArray<DJObjectMethod *> *)methodListWithClass:(Class)cls;
+ (NSArray<DJObjectMethod *> *)inheritedMethodListWithClass:(Class)cls;
+ (NSArray<DJObjectMethod *> *)allMethodListWithClass:(Class)cls;

+ (NSArray<DJObjectMethod *> *)classMethodListWithClass:(Class)cls;
+ (NSArray<DJObjectMethod *> *)inheritedClassMethodListWithClass:(Class)cls;
+ (NSArray<DJObjectMethod *> *)allClassMethodListWithClass:(Class)cls;

+ (NSArray<NSString *> *)superClassListWithClass:(Class)cls;
+ (NSArray<NSString *> *)allSuperClassListWithClass:(Class)cls;

/**
 Get the type from a Type-Encoding string.
 
 @discussion See also:
 https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html
 https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtPropertyIntrospection.html
 
 @param typeEncoding  A Type-Encoding string.
 @return The encoding type.
 */
+ (DJEncodingType)encodingTypeWith:(const char *)typeEncoding;

@end

NS_ASSUME_NONNULL_END
