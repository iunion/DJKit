//
//  DJObjectMethod.h
//  DJkit
//
//  Created by DennisDeng on 2017/3/23.
//  Copyright © 2017年 DennisDeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DJObjectDefine.h"

@interface DJObjectMethod : NSObject

@property (nullable, nonatomic, assign) Method method;                  ///< method opaque struct
@property (nullable, nonatomic, strong, readonly) NSString *name;                 ///< method name
@property (nullable, nonatomic, assign, readonly) SEL sel;                        ///< method's selector
@property (nullable, nonatomic, assign, readonly) IMP imp;                        ///< method's implementation
@property (nullable, nonatomic, strong, readonly) NSString *typeEncoding;         ///< method's parameter and return types
@property (nullable, nonatomic, strong, readonly) NSString *returnTypeEncoding;   ///< return value's type
@property (nullable, nonatomic, strong, readonly) NSArray<NSString *> *argumentTypeEncodings; ///< array of arguments' type

- (nullable instancetype)initWithMethod:(nullable Method)method;

@end
