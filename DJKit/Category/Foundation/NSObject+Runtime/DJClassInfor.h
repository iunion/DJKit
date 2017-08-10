//
//  DJClassInfor.h
//  DJkit
//
//  Created by DennisDeng on 2017/3/24.
//  Copyright © 2017年 DennisDeng. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DJObjectManager.h"


NS_ASSUME_NONNULL_BEGIN

@interface DJClassInfor : NSObject

@property (nonatomic, assign, readonly) Class cls;                  ///< class object
@property (nullable, nonatomic, assign, readonly) Class superCls;   ///< super class object
@property (nullable, nonatomic, assign, readonly) Class metaCls;    ///< class's meta class object
@property (nonatomic, readonly) BOOL isMeta;                        ///< whether this class is meta class
@property (nonatomic, strong, readonly) NSString *className;             ///< class name

@property (nullable, nonatomic, strong, readonly) DJClassInfor *superClassInfo; ///< super class's class info

@property (nullable, nonatomic, strong, readonly) NSArray *propertys;
@property (nullable, nonatomic, strong, readonly) NSArray *ivars;
@property (nullable, nonatomic, strong, readonly) NSArray *methods;

+ (nullable instancetype)classInfoWithClass:(Class)cls;

+ (nullable instancetype)classInfoWithClassName:(NSString *)className;

- (void)setNeedUpdate;
- (BOOL)needUpdate;

@end

NS_ASSUME_NONNULL_END

