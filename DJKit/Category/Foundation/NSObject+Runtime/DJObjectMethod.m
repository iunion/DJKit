//
//  DJObjectMethod.m
//  DJkit
//
//  Created by DennisDeng on 2017/3/23.
//  Copyright © 2017年 DennisDeng. All rights reserved.
//

#import "DJObjectMethod.h"

@implementation DJObjectMethod

- (instancetype)initWithMethod:(Method)method
{
    if (!method)
    {
        return nil;
    }
    
    self = [super init];
    if (self)
    {
        _method = method;
        [self freshMethod];
    }
    return self;
}

- (void)freshMethod
{
    _sel = method_getName(self.method);
    _imp = method_getImplementation(self.method);
    
    const char *name = sel_getName(_sel);
    if (name)
    {
        _name = [NSString stringWithUTF8String:name];
    }
    
    const char *typeEncoding = method_getTypeEncoding(self.method);
    if (typeEncoding)
    {
        _typeEncoding = [NSString stringWithUTF8String:typeEncoding];
    }
    
    char *returnType = method_copyReturnType(self.method);
    if (returnType)
    {
        _returnTypeEncoding = [NSString stringWithUTF8String:returnType];
        free(returnType);
    }
    
    unsigned int argumentCount = method_getNumberOfArguments(self.method);
    if (argumentCount > 0)
    {
        NSMutableArray *argumentTypes = [NSMutableArray array];
        for (unsigned int i = 0; i < argumentCount; i++)
        {
            char *argumentType = method_copyArgumentType(self.method, i);
            NSString *type = argumentType ? [NSString stringWithUTF8String:argumentType] : nil;
            [argumentTypes addObject:type ? type : @""];
            if (argumentType)
            {
                free(argumentType);
            }
        }
        _argumentTypeEncodings = argumentTypes;
    }
}

- (void)setMethod:(Method)amethod
{
    if (_method != amethod)
    {
        _method = amethod;
        [self freshMethod];
    }
}


@end
