//
//  DJClassInfor.m
//  DJkit
//
//  Created by DennisDeng on 2017/3/24.
//  Copyright © 2017年 DennisDeng. All rights reserved.
//

#import "DJClassInfor.h"

@interface DJClassInfor ()
{
    BOOL _needUpdate;
}
@end

@implementation DJClassInfor

+ (instancetype)classInfoWithClass:(Class)cls
{
    if (!cls) return nil;
    
    static CFMutableDictionaryRef classCache;
    static CFMutableDictionaryRef metaCache;
    
    static dispatch_once_t onceToken;
    static dispatch_semaphore_t lock;
    dispatch_once(&onceToken, ^{
        classCache = CFDictionaryCreateMutable(CFAllocatorGetDefault(), 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        metaCache = CFDictionaryCreateMutable(CFAllocatorGetDefault(), 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        lock = dispatch_semaphore_create(1);
    });
    
    dispatch_semaphore_wait(lock, DISPATCH_TIME_FOREVER);
    DJClassInfor *info = CFDictionaryGetValue(class_isMetaClass(cls) ? metaCache : classCache, (__bridge const void *)(cls));
    if (info && info->_needUpdate)
    {
        [info _update];
    }
    dispatch_semaphore_signal(lock);
    if (!info)
    {
        info = [[DJClassInfor alloc] initWithClass:cls];
        if (info)
        {
            dispatch_semaphore_wait(lock, DISPATCH_TIME_FOREVER);
            CFDictionarySetValue(info.isMeta ? metaCache : classCache, (__bridge const void *)(cls), (__bridge const void *)(info));
            dispatch_semaphore_signal(lock);
        }
    }
    
    return info;
}

+ (instancetype)classInfoWithClassName:(NSString *)className
{
    Class cls = NSClassFromString(className);
    return [self classInfoWithClass:cls];
}

- (instancetype)initWithClass:(Class)cls
{
    if (!cls) return nil;
    self = [super init];
    
    if (self)
    {
        _cls = cls;
        _superCls = class_getSuperclass(cls);
        _isMeta = class_isMetaClass(cls);
        if (!_isMeta)
        {
            _metaCls = objc_getMetaClass(class_getName(cls));
        }
        _className = NSStringFromClass(cls);
        [self _update];
        
        _superClassInfo = [self.class classInfoWithClass:_superCls];
    }
    
    return self;
}

- (void)_update
{
    _propertys = nil;
    _ivars = nil;
    _methods = nil;
    
    Class cls = self.cls;
    
    _propertys = [DJObjectManager propertyListWithClass:cls];
    _ivars = [DJObjectManager ivarListWithClass:cls];
    
    if (_isMeta)
    {
        _methods = [DJObjectManager methodListWithClass:cls];
    }
    else
    {
        _methods = [DJObjectManager classMethodListWithClass:cls];
    }
        
    _needUpdate = NO;
}

- (void)setNeedUpdate
{
    _needUpdate = YES;
}

- (BOOL)needUpdate
{
    return _needUpdate;
}

@end
