//
//  NSObject+DJRuntime.m
//  DJkit
//
//  Created by DennisDeng on 2017/3/22.
//  Copyright © 2017年 DennisDeng. All rights reserved.
//

#import "NSObject+DJRuntime.h"

#if TARGET_OS_IPHONE
#import <objc/runtime.h>
#import <objc/message.h>
#else
#import <objc/objc-class.h>
#endif

#import "NSArray+Category.h"

#pragma mark -
#pragma mark Runtime

@implementation NSObject (DJRuntime)

+ (NSArray *)applicationClassList
{
    NSArray *classArray = nil;
    
    NSString *app = [NSBundle mainBundle].executablePath;
    if (!app)
    {
        return nil;
    }
    
    unsigned int classNamesCount = 0;
    const char **classNames = objc_copyClassNamesForImage([app UTF8String], &classNamesCount);
    if (classNames)
    {
        NSMutableArray *classNameStrings = [NSMutableArray array];
        for (unsigned int i = 0; i < classNamesCount; i++)
        {
            const char *className = classNames[i];
            NSString *classNameString = [NSString stringWithUTF8String:className];
            [classNameStrings addObject:classNameString];
        }
        
        classArray = [classNameStrings sortedArray];
        
        free(classNames);
    }
    
    return classArray;
}

+ (NSArray *)propertyList
{
    return [DJObjectManager propertyListWithClass:self];
}

+ (NSArray *)inheritedPropertyList
{
    return [DJObjectManager inheritedPropertyListWithClass:self];
}

+ (NSArray *)allPropertyList
{
    return [DJObjectManager allPropertyListWithClass:self];
}

+ (NSArray *)ivarList
{
    return [DJObjectManager ivarListWithClass:self];
}

+ (NSArray *)inheritedIvarList
{
    return [DJObjectManager inheritedIvarListWithClass:self];
}

+ (NSArray *)allIvarList
{
    return [DJObjectManager allIvarListWithClass:self];
}

+ (NSArray *)methodList
{
    return [DJObjectManager methodListWithClass:self];
}

+ (NSArray *)inheritedMethodList
{
    return [DJObjectManager inheritedMethodListWithClass:self];
}

+ (NSArray *)allMethodList
{
    return [DJObjectManager allMethodListWithClass:self];
}

+ (NSArray *)classMethodList
{
    return [DJObjectManager classMethodListWithClass:self];
}

+ (NSArray *)inheritedClassMethodList
{
    return [DJObjectManager inheritedClassMethodListWithClass:self];
}

+ (NSArray *)allClassMethodList
{
    return [DJObjectManager allClassMethodListWithClass:self];
}

+ (NSArray *)superClassList
{
    return [DJObjectManager superClassListWithClass:self];
}

+ (NSArray *)allSuperClassList
{
    return [DJObjectManager allSuperClassListWithClass:self];
}

- (Class)getMetaClass
{
    return objc_getMetaClass(class_getName([self class]));
}

@end
