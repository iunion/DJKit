//
//  DJObjectProperty.h
//  DJkit
//
//  Created by DennisDeng on 2017/3/22.
//  Copyright © 2017年 DennisDeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DJObjectDefine.h"

// See https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtPropertyIntrospection.html#//apple_ref/doc/uid/TP40008048-CH101-SW6
extern const char kNSObjectRuntimeAttributeTypeEncoding;
extern const char kNSObjectRuntimeAttributeBackingIvar;
extern const char kNSObjectRuntimeAttributeReadOnly;
extern const char kNSObjectRuntimeAttributeCopy;
extern const char kNSObjectRuntimeAttributeRetain;
extern const char kNSObjectRuntimeAttributeNonAtomic;
extern const char kNSObjectRuntimeAttributeCustomGetter;
extern const char kNSObjectRuntimeAttributeCustomSetter;
extern const char kNSObjectRuntimeAttributeDynamic;
extern const char kNSObjectRuntimeAttributeWeak;
extern const char kNSObjectRuntimeAttributeGarbageCollectable;
extern const char kNSObjectRuntimeAttributeOldStyleTypeEncoding;


@interface DJObjectProperty : NSObject

@property (nullable, nonatomic, assign) objc_property_t property;
@property (nonnull, nonatomic, strong, readonly) NSString *name;            ///< property's name
@property (nonatomic, assign, readonly) DJEncodingType type;                ///< property's type
@property (nonnull, nonatomic, strong, readonly) NSString *typeEncoding;    ///< property's encoding value
@property (nonnull, nonatomic, strong, readonly) NSString *ivarName;        ///< property's ivar name
@property (nullable, nonatomic, assign, readonly) Class cls;                ///< may be nil
@property (nullable, nonatomic, strong, readonly) NSArray<NSString *> *protocols; ///< may nil
@property (nonnull, nonatomic, assign, readonly) SEL getter;                ///< getter (nonnull)
@property (nonnull, nonatomic, assign, readonly) SEL setter;                ///< setter (nonnull)
@property (nonnull, nonatomic, strong, readonly) NSString *getterName;      ///< getterName (nonnull)
@property (nonnull, nonatomic, strong, readonly) NSString *setterName;      ///< setterName (nonnull)

@property (nullable, nonatomic, strong, readonly) NSString *objectClassName; ///< objectClass Name (nullable)
@property (nullable, nonatomic, strong, readonly) NSString *structureName;   ///< structure Name (nullable)
@property (nullable, nonatomic, strong, readonly) NSString *unionName;       ///< union Name (nullable)

- (nullable instancetype)initWithProperty:(nullable objc_property_t)property;

@end
