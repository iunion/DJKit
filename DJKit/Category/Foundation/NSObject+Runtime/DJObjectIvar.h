//
//  DJObjectIvar.h
//  DJkit
//
//  Created by DennisDeng on 2017/3/23.
//  Copyright © 2017年 DennisDeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DJObjectDefine.h"

@interface DJObjectIvar : NSObject

@property (nullable, nonatomic, assign) Ivar ivar;                ///< ivar opaque struct
@property (nullable, nonatomic, strong, readonly) NSString *name;           ///< Ivar's name
@property (nonatomic, assign, readonly) ptrdiff_t offset;                   ///< Ivar's offset
@property (nonatomic, assign, readonly) DJEncodingType type;                ///< Ivar's type
@property (nullable, nonatomic, strong, readonly) NSString *typeEncoding;   ///< Ivar's type encoding

- (nullable instancetype)initWithIvar:(nullable Ivar)ivar;

@end
