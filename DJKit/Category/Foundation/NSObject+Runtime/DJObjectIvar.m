//
//  DJObjectIvar.m
//  DJkit
//
//  Created by DennisDeng on 2017/3/23.
//  Copyright © 2017年 DennisDeng. All rights reserved.
//

#import "DJObjectIvar.h"

#import "DJObjectManager.h"

@implementation DJObjectIvar

- (instancetype)initWithIvar:(Ivar)ivar
{
    if (!ivar)
    {
        return nil;
    }
    
    self = [super init];
    if (self)
    {
        _ivar = ivar;
        [self freshIvar];
    }
    return self;
}

- (void)freshIvar
{
    const char *name = ivar_getName(self.ivar);
    if (name)
    {
        _name = [NSString stringWithUTF8String:name];
    }
    _offset = ivar_getOffset(self.ivar);
    const char *typeEncoding = ivar_getTypeEncoding(self.ivar);
    if (typeEncoding)
    {
        _typeEncoding = [NSString stringWithUTF8String:typeEncoding];
        _type = [DJObjectManager encodingTypeWith:typeEncoding];
    }
}

- (void)setIvar:(Ivar)aivar
{
    if (_ivar != aivar)
    {
        _ivar = aivar;
        [self freshIvar];
    }
}

@end
