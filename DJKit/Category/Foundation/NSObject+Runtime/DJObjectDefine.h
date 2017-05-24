//
//  DJObjectDefine.h
//  DJkit
//
//  Created by DennisDeng on 2017/3/22.
//  Copyright © 2017年 DennisDeng. All rights reserved.
//

#ifndef DJObjectDefine_h
#define DJObjectDefine_h

#import <objc/runtime.h>

typedef NS_OPTIONS(NSUInteger, DJEncodingType)
{
    DJEncodingTypeMask       = 0xFF,    ///< mask of type value
    DJEncodingTypeUnknown    = 0,       ///< unknown
    DJEncodingTypeVoid       = 1,       ///< void
    DJEncodingTypeBool       = 2,       ///< bool
    DJEncodingTypeInt8       = 3,       ///< char / BOOL
    DJEncodingTypeUInt8      = 4,       ///< unsigned char
    DJEncodingTypeInt16      = 5,       ///< short
    DJEncodingTypeUInt16     = 6,       ///< unsigned short
    DJEncodingTypeInt32      = 7,       ///< int
    DJEncodingTypeUInt32     = 8,       ///< unsigned int
    DJEncodingTypeInt64      = 9,       ///< long long
    DJEncodingTypeUInt64     = 10,      ///< unsigned long long
    DJEncodingTypeFloat      = 11,      ///< float
    DJEncodingTypeDouble     = 12,      ///< double
    DJEncodingTypeLongDouble = 13,      ///< long double
    DJEncodingTypeObject     = 14,      ///< id
    DJEncodingTypeClass      = 15,      ///< Class
    DJEncodingTypeSEL        = 16,      ///< SEL
    DJEncodingTypeBlock      = 17,      ///< block
    DJEncodingTypePointer    = 18,      ///< void*
    DJEncodingTypeStruct     = 19,      ///< struct
    DJEncodingTypeUnion      = 20,      ///< union
    DJEncodingTypeCString    = 21,      ///< char*
    DJEncodingTypeCArray     = 22,      ///< char[10] (for example)

    DJEncodingTypeQualifierMask   = 0xFF00,     ///< mask of qualifier
    DJEncodingTypeQualifierConst  = 1 << 8,     ///< const
    DJEncodingTypeQualifierIn     = 1 << 9,     ///< in
    DJEncodingTypeQualifierInout  = 1 << 10,    ///< inout
    DJEncodingTypeQualifierOut    = 1 << 11,    ///< out
    DJEncodingTypeQualifierBycopy = 1 << 12,    ///< bycopy
    DJEncodingTypeQualifierByref  = 1 << 13,    ///< byref
    DJEncodingTypeQualifierOneway = 1 << 14,    ///< oneway

    DJEncodingTypePropertyMask         = 0xFF0000,  ///< mask of property
    DJEncodingTypePropertyReadonly     = 1 << 16,   ///< readonly
    DJEncodingTypePropertyCopy         = 1 << 17,   ///< copy
    DJEncodingTypePropertyRetain       = 1 << 18,   ///< retain
    DJEncodingTypePropertyNonatomic    = 1 << 19,   ///< nonatomic
    DJEncodingTypePropertyWeak         = 1 << 20,   ///< weak
    DJEncodingTypePropertyCustomGetter = 1 << 21,   ///< getter=
    DJEncodingTypePropertyCustomSetter = 1 << 22,   ///< setter=
    DJEncodingTypePropertyDynamic      = 1 << 23,   ///< @dynamic
};

#endif /* DJObjectDefine_h */
