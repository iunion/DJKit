//
//  DJObjectProperty.m
//  DJkit
//
//  Created by DennisDeng on 2017/3/22.
//  Copyright © 2017年 DennisDeng. All rights reserved.
//

#import "DJObjectProperty.h"

#import "DJObjectManager.h"
#import "NSString+Category.h"

// See https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtPropertyIntrospection.html#//apple_ref/doc/uid/TP40008048-CH101-SW6
const char kNSObjectRuntimeAttributeTypeEncoding = 'T';
const char kNSObjectRuntimeAttributeBackingIvar = 'V';
const char kNSObjectRuntimeAttributeReadOnly = 'R';
const char kNSObjectRuntimeAttributeCopy = 'C';
const char kNSObjectRuntimeAttributeRetain = '&';
const char kNSObjectRuntimeAttributeNonAtomic = 'N';
const char kNSObjectRuntimeAttributeCustomGetter = 'G';
const char kNSObjectRuntimeAttributeCustomSetter = 'S';
const char kNSObjectRuntimeAttributeDynamic = 'D';
const char kNSObjectRuntimeAttributeWeak = 'W';
const char kNSObjectRuntimeAttributeGarbageCollectable = 'P';
const char kNSObjectRuntimeAttributeOldStyleTypeEncoding = 't';


@implementation DJObjectProperty

- (instancetype)initWithProperty:(objc_property_t)property
{
    if (!property)
    {
        return nil;
    }

    self = [super init];
    
    if (self)
    {
        _property = property;
        [self freshProperty];
    }
    
    return self;
}

- (void)setProperty:(objc_property_t)aproperty
{
    if (_property != aproperty)
    {
        _property = aproperty;
        [self freshProperty];
    }
}

- (void)freshProperty
{
    const char *name = property_getName(self.property);
    if (name)
    {
        //_name = @(name);
        _name = [NSString stringWithUTF8String:name];
    }
    
    DJEncodingType type = DJEncodingTypeUnknown;

    NSLog(@"%@", @(property_getAttributes(self.property)));
          
    unsigned int attrCount;
    objc_property_attribute_t *attrs = property_copyAttributeList(self.property, &attrCount);
    for (unsigned int i = 0; i < attrCount; i++)
    {
        //NSLog(@"%@, %@", @(attrs[i].name), @(attrs[i].value));
        
        char attributeChar = attrs[i].name[0];
        switch (attributeChar)
        {
            // Type encoding
            case kNSObjectRuntimeAttributeTypeEncoding:
            {
                if (attrs[i].value)
                {
                    _typeEncoding = [NSString stringWithUTF8String:attrs[i].value];
                    type = [DJObjectManager encodingTypeWith:attrs[i].value];
                    
                    if ((type & DJEncodingTypeMask) == DJEncodingTypeObject && _typeEncoding.length)
                    {
                        NSScanner *scanner = [NSScanner scannerWithString:_typeEncoding];
                        if (![scanner scanString:@"@\"" intoString:NULL]) continue;
                        
                        NSString *clsName = nil;
                        if ([scanner scanUpToCharactersFromSet: [NSCharacterSet characterSetWithCharactersInString:@"\"<"] intoString:&clsName])
                        {
                            if (clsName.length)
                            {
                                _cls = objc_getClass(clsName.UTF8String);
                                _objectClassName = clsName;
                            }
                        }
                        
                        NSMutableArray *protocols = nil;
                        while ([scanner scanString:@"<" intoString:NULL])
                        {
                            NSString* protocol = nil;
                            if ([scanner scanUpToString:@">" intoString: &protocol])
                            {
                                if (protocol.length)
                                {
                                    if (!protocols)
                                    {
                                        protocols = [NSMutableArray array];
                                    }
                                    [protocols addObject:protocol];
                                }
                            }
                            [scanner scanString:@">" intoString:NULL];
                        }
                        _protocols = protocols;
                    }
                    else if ((type & DJEncodingTypeMask) == DJEncodingTypeStruct && _typeEncoding.length)
                    {
                        _structureName = [_typeEncoding subStringFromChar:'{' toChar:'='];
                    }
                    else if ((type & DJEncodingTypeMask) == DJEncodingTypeUnion && _typeEncoding.length)
                    {
                        _unionName = [_typeEncoding subStringFromChar:'(' toChar:'='];
                    }
                }
            }
                break;
                
            // Instance variable
            case kNSObjectRuntimeAttributeBackingIvar:
            {
                if (attrs[i].value)
                {
                    _ivarName = [NSString stringWithUTF8String:attrs[i].value];
                }
            }
                break;
                
            case kNSObjectRuntimeAttributeReadOnly:
            {
                type |= DJEncodingTypePropertyReadonly;
            }
                break;
                
            case kNSObjectRuntimeAttributeCopy:
            {
                type |= DJEncodingTypePropertyCopy;
            }
                break;
                
            case kNSObjectRuntimeAttributeRetain:
            {
                type |= DJEncodingTypePropertyRetain;
            }
                break;
                
            case kNSObjectRuntimeAttributeNonAtomic:
            {
                type |= DJEncodingTypePropertyNonatomic;
            }
                break;
                
            case kNSObjectRuntimeAttributeDynamic:
            {
                type |= DJEncodingTypePropertyDynamic;
            }
                break;
                
            case kNSObjectRuntimeAttributeWeak:
            {
                type |= DJEncodingTypePropertyWeak;
            }
                break;
                
            case kNSObjectRuntimeAttributeCustomGetter:
            {
                type |= DJEncodingTypePropertyCustomGetter;
                if (attrs[i].value)
                {
                    _getterName = [NSString stringWithUTF8String:attrs[i].value];
                    _getter = NSSelectorFromString(_getterName);
                }
            }
                break;
                
            case kNSObjectRuntimeAttributeCustomSetter:
            {
                type |= DJEncodingTypePropertyCustomSetter;
                if (attrs[i].value)
                {
                    _setterName = [NSString stringWithUTF8String:attrs[i].value];
                    _setter = NSSelectorFromString(_setterName);
                }
            }
                break;
                
            default: break;
        }
    }
    
    if (attrs)
    {
        free(attrs);
        attrs = NULL;
    }

    _type = type;
    
    if (_name.length)
    {
        if (!_getter)
        {
            _getterName = _name;
            _getter = NSSelectorFromString(_name);
        }
        if (!_setter)
        {
            if (_name.length > 1)
            {
                _setterName = [NSString stringWithFormat:@"set%@%@:", [_name substringToIndex:1].uppercaseString, [_name substringFromIndex:1]];
                _setter = NSSelectorFromString(_setterName);
            }
            else
            {
                _setterName = [NSString stringWithFormat:@"set%@:", [_name substringToIndex:1].uppercaseString];
                _setter = NSSelectorFromString(_setterName);
            }
        }
    }
}


@end
