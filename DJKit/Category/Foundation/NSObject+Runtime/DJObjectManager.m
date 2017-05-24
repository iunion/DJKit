//
//  DJObjectManager.m
//  DJkit
//
//  Created by DennisDeng on 2017/3/23.
//  Copyright © 2017年 DennisDeng. All rights reserved.
//

#import "DJObjectManager.h"
#import <CoreData/CoreData.h>
#import "NSObject+Category.h"


//@interface DJObjectProtocol : NSObject
//@property (nonatomic, assign) Protocol *protocol;
//@end


@implementation DJObjectManager

// 用户添加
+ (NSSet *)foundationClasses
{
    static NSSet *DJFoundationClasses = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        DJFoundationClasses = [NSSet setWithObjects:
                              [NSURL class],
                              [NSDate class],
                              [NSValue class],
                              [NSData class],
                              [NSError class],
                              [NSArray class],
                              [NSDictionary class],
                              [NSString class],
                              [NSAttributedString class], nil];
    });
    
    return DJFoundationClasses;
}

+ (BOOL)isClassFromFoundation:(Class)cls
{
    if (cls == [NSObject class] || cls == [NSManagedObject class])
    {
        return YES;
    }
    
    __block BOOL result = NO;
    [[self foundationClasses] enumerateObjectsUsingBlock:^(Class foundationClass, BOOL *stop) {
        if ([cls isSubclassOfClass:foundationClass])
        {
            result = YES;
            *stop = YES;
        }
    }];
    return result;
}

+ (Class)superClassWithoutFoundation:(Class)cls
{
    Class class = [cls superclass];
    if ([DJObjectManager isClassFromFoundation:class])
    {
        return NULL;
    }
    
    return class;
}

+ (NSArray *)propertyListWithClass:(Class)cls
{
    NSMutableArray *propertieArray = [NSMutableArray array];
    unsigned int propertyCount = 0;
    objc_property_t *properties = class_copyPropertyList(cls, &propertyCount);
    if (properties)
    {
        for (unsigned int i = 0; i < propertyCount; i++)
        {
            DJObjectProperty *objectProperty = [[DJObjectProperty alloc] initWithProperty:properties[i]];
            [propertieArray addObject:objectProperty];
        }
        free(properties);
    }
    
    return propertieArray;
}

+ (NSArray *)inheritedPropertyListWithClass:(Class)cls
{
    NSMutableArray *inheritedPropertyArray = [NSMutableArray array];
    Class class = cls;
    while ((class = [DJObjectManager superClassWithoutFoundation:class]))
    {
        [inheritedPropertyArray addObjectsFromArray:[DJObjectManager propertyListWithClass:class]];
    }
    
    return inheritedPropertyArray;
}

+ (NSArray *)allPropertyListWithClass:(Class)cls
{
    NSMutableArray *propertieArray = [NSMutableArray array];
    [propertieArray addObjectsFromArray:[DJObjectManager propertyListWithClass:cls]];
    [propertieArray addObjectsFromArray:[DJObjectManager inheritedPropertyListWithClass:cls]];
    
    return propertieArray;
}

+ (NSArray *)ivarListWithClass:(Class)cls
{
    NSMutableArray *ivarArray = [NSMutableArray array];
    unsigned int ivarCount = 0;
    Ivar *ivars = class_copyIvarList(cls, &ivarCount);
    if (ivars)
    {
        for (unsigned int i = 0; i < ivarCount; i++)
        {
            DJObjectIvar *objectIvar = [[DJObjectIvar alloc] init];
            objectIvar.ivar = ivars[i];
            [ivarArray addObject:objectIvar];
        }
        free(ivars);
    }
    return ivarArray;
}

+ (NSArray *)inheritedIvarListWithClass:(Class)cls
{
    NSMutableArray *inheritedIvarArray = [NSMutableArray array];
    Class class = cls;
    while ((class = [DJObjectManager superClassWithoutFoundation:class]))
    {
        [inheritedIvarArray addObjectsFromArray:[DJObjectManager ivarListWithClass:class]];
    }
    return inheritedIvarArray;
}

+ (NSArray *)allIvarListWithClass:(Class)cls
{
    NSMutableArray *ivarArray = [NSMutableArray array];
    [ivarArray addObjectsFromArray:[DJObjectManager ivarListWithClass:cls]];
    [ivarArray addObjectsFromArray:[DJObjectManager inheritedIvarListWithClass:cls]];
    
    return ivarArray;
}

+ (NSArray *)methodListWithClass:(Class)cls
{
    NSMutableArray *methodArray = [NSMutableArray array];
    unsigned int methodCount = 0;
    Method *methods = class_copyMethodList(cls, &methodCount);
    if (methods)
    {
        for (unsigned int i = 0; i < methodCount; i++)
        {
            DJObjectMethod *objectMethod = [[DJObjectMethod alloc] init];
            objectMethod.method = methods[i];
            [methodArray addObject:objectMethod];
        }
        free(methods);
    }
    return methodArray;
}

+ (NSArray *)inheritedMethodListWithClass:(Class)cls
{
    NSMutableArray *inheritedMethodArray = [NSMutableArray array];
    Class class = cls;
    while ((class = [DJObjectManager superClassWithoutFoundation:class]))
    {
        [inheritedMethodArray addObjectsFromArray:[DJObjectManager methodListWithClass:class]];
    }
    return inheritedMethodArray;
}

+ (NSArray *)allMethodListWithClass:(Class)cls
{
    NSMutableArray *methodArray = [NSMutableArray array];
    [methodArray addObjectsFromArray:[DJObjectManager methodListWithClass:cls]];
    [methodArray addObjectsFromArray:[DJObjectManager inheritedMethodListWithClass:cls]];
    
    return methodArray;
}

+ (NSArray *)classMethodListWithClass:(Class)cls
{
    Class metaClass = objc_getMetaClass(class_getName(cls));
    
    return [DJObjectManager methodListWithClass:metaClass];
}

+ (NSArray *)inheritedClassMethodListWithClass:(Class)cls
{
    NSMutableArray *inheritedMethodArray = [NSMutableArray array];
    Class class = cls;
    while ((class = [DJObjectManager superClassWithoutFoundation:class]))
    {
        [inheritedMethodArray addObjectsFromArray:[DJObjectManager classMethodListWithClass:class]];
    }
    return inheritedMethodArray;
}

+ (NSArray *)allClassMethodListWithClass:(Class)cls
{
    NSMutableArray *methodArray = [NSMutableArray array];
    [methodArray addObjectsFromArray:[DJObjectManager classMethodListWithClass:cls]];
    [methodArray addObjectsFromArray:[DJObjectManager inheritedClassMethodListWithClass:cls]];
    
    return methodArray;
}

+ (NSArray *)superClassListWithClass:(Class)cls
{
    NSMutableArray *superClassArray = [NSMutableArray array];
    Class class = cls;
    while ((class = [class superclass]))
    {
        [superClassArray addObject:[class className]];
    }
    return superClassArray;
}

+ (NSArray *)allSuperClassListWithClass:(Class)cls
{
    NSMutableArray *superClassArray = [NSMutableArray array];
    [superClassArray addObject:[cls className]];
    [superClassArray addObjectsFromArray:[DJObjectManager superClassListWithClass:cls]];
    
    return superClassArray;
}

+ (DJEncodingType)encodingTypeWith:(const char *)typeEncoding
{
    char *type = (char *)typeEncoding;
    if (!type)
    {
        return DJEncodingTypeUnknown;
    }
    size_t len = strlen(type);
    if (len == 0)
    {
        return DJEncodingTypeUnknown;
    }
    
    DJEncodingType qualifier = 0;
    bool prefix = true;
    while (prefix)
    {
        switch (*type)
        {
            case 'r':
            {
                qualifier |= DJEncodingTypeQualifierConst;
                type++;
            }
                break;
            case 'n':
            {
                qualifier |= DJEncodingTypeQualifierIn;
                type++;
            }
                break;
            case 'N':
            {
                qualifier |= DJEncodingTypeQualifierInout;
                type++;
            }
                break;
            case 'o':
            {
                qualifier |= DJEncodingTypeQualifierOut;
                type++;
            }
                break;
            case 'O':
            {
                qualifier |= DJEncodingTypeQualifierBycopy;
                type++;
            }
                break;
            case 'R':
            {
                qualifier |= DJEncodingTypeQualifierByref;
                type++;
            }
                break;
            case 'V':
            {
                qualifier |= DJEncodingTypeQualifierOneway;
                type++;
            }
                break;
            default:
            {
                prefix = false;
            }
                break;
        }
    }
    
    len = strlen(type);
    if (len == 0)
    {
        return DJEncodingTypeUnknown | qualifier;
    }
    
    switch (*type)
    {
        case 'v': return DJEncodingTypeVoid | qualifier;
        case 'B': return DJEncodingTypeBool | qualifier;
        case 'c': return DJEncodingTypeInt8 | qualifier;
        case 'C': return DJEncodingTypeUInt8 | qualifier;
        case 's': return DJEncodingTypeInt16 | qualifier;
        case 'S': return DJEncodingTypeUInt16 | qualifier;
        case 'i': return DJEncodingTypeInt32 | qualifier;
        case 'I': return DJEncodingTypeUInt32 | qualifier;
        case 'l': return DJEncodingTypeInt32 | qualifier;
        case 'L': return DJEncodingTypeUInt32 | qualifier;
        case 'q': return DJEncodingTypeInt64 | qualifier;
        case 'Q': return DJEncodingTypeUInt64 | qualifier;
        case 'f': return DJEncodingTypeFloat | qualifier;
        case 'd': return DJEncodingTypeDouble | qualifier;
        case 'D': return DJEncodingTypeLongDouble | qualifier;
        case '#': return DJEncodingTypeClass | qualifier;
        case ':': return DJEncodingTypeSEL | qualifier;
        case '*': return DJEncodingTypeCString | qualifier;
        case '^': return DJEncodingTypePointer | qualifier;
        case '[': return DJEncodingTypeCArray | qualifier;
        case '(': return DJEncodingTypeUnion | qualifier;
        case '{': return DJEncodingTypeStruct | qualifier;
        case '@':
        {
            if (len == 2 && *(type + 1) == '?')
                return DJEncodingTypeBlock | qualifier;
            else
                return DJEncodingTypeObject | qualifier;
        }
        default: return DJEncodingTypeUnknown | qualifier;
    }
}

@end
