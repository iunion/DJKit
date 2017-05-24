//
//  NSString+Encrypt.m
//  DJkit
//
//  Created by DennisDeng on 2017/5/2.
//  Copyright © 2017年 DennisDeng. All rights reserved.
//

#import "NSString+Encrypt.h"
#import <CommonCrypto/CommonCrypto.h>
#import "NSData+Encrypt.h"

@implementation NSString (Encrypt)

+ (NSString *)base64EncodeData:(NSData *)data
{
    NSData *encodeData = [data base64EncodedDataWithOptions:0];
    NSString *base64Str = [[NSString alloc] initWithData:encodeData encoding:NSUTF8StringEncoding];
    return base64Str;
}

+ (NSData *)base64DecodeString:(NSString *)base64Str
{
    NSData *data = [[NSData alloc] initWithBase64EncodedString:base64Str options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return data;
}


#pragma mark - Hash

- (NSString *)md2String
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding] md2String];
}

- (NSString *)md4String
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding] md4String];
}

- (NSString *)md5String
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding] md5String];
}

- (NSString *)md5HexDigest16
{
    const char *original_str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(original_str, (CC_LONG)strlen(original_str), result);
    
    NSMutableString *hash = [NSMutableString string];
    for (NSInteger i = 4; i < 12; i++)
    {
        [hash appendFormat:@"%02x", result[i]];
    }
    
    return hash;
}

- (NSString *)sha1String
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sha1String];
}

- (NSString *)sha224String
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sha224String];
}

- (NSString *)sha256String
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sha256String];
}

- (NSString *)sha384String
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sha384String];
}

- (NSString *)sha512String
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding] sha512String];
}

- (NSString *)hmacMD5StringWithKey:(NSString *)key
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            hmacMD5StringWithKey:key];
}

- (NSString *)hmacSHA1StringWithKey:(NSString *)key
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            hmacSHA1StringWithKey:key];
}

- (NSString *)hmacSHA224StringWithKey:(NSString *)key
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            hmacSHA224StringWithKey:key];
}

- (NSString *)hmacSHA256StringWithKey:(NSString *)key
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            hmacSHA256StringWithKey:key];
}

- (NSString *)hmacSHA384StringWithKey:(NSString *)key
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            hmacSHA384StringWithKey:key];
}

- (NSString *)hmacSHA512StringWithKey:(NSString *)key
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding]
            hmacSHA512StringWithKey:key];
}

- (NSString *)crc32String
{
    return [[self dataUsingEncoding:NSUTF8StringEncoding] crc32String];
}

#pragma mark - Encrypt and Decrypt

+ (NSString *)TripleDES:(NSString *)plainText encryptOrDecrypt:(CCOperation)encryptOrDecrypt key:(NSString *)key
{
    return [NSString TripleDES:plainText encryptOrDecrypt:encryptOrDecrypt key:key iv:@"init Vec"];
}

+ (NSString *)TripleDES:(NSString *)plainText encryptOrDecrypt:(CCOperation)encryptOrDecrypt key:(NSString *)key iv:(NSString *)iv
{
    const void *vplainText;
    size_t plainTextBufferSize;
    
    if (encryptOrDecrypt == kCCDecrypt)
    {
        NSData *EncryptData = [NSString base64DecodeString:plainText];
        plainTextBufferSize = [EncryptData length];
        vplainText = [EncryptData bytes];
    }
    else
    {
        NSData* data = [plainText dataUsingEncoding:NSUTF8StringEncoding];
        plainTextBufferSize = [data length];
        vplainText = (const void *)[data bytes];
    }
    
    CCCryptorStatus ccStatus;
    uint8_t *bufferPtr = NULL;
    size_t bufferPtrSize = 0;
    size_t movedBytes = 0;
    // uint8_t ivkCCBlockSize3DES;
    
    bufferPtrSize = (plainTextBufferSize + kCCBlockSize3DES) & ~(kCCBlockSize3DES - 1);
    bufferPtr = malloc( bufferPtrSize * sizeof(uint8_t));
    memset((void *)bufferPtr, 0x0, bufferPtrSize);
    // memset((void *) iv, 0x0, (size_t) sizeof(iv));
    
    //NSString *key = @"123456789012345678901234";
    NSString *initVec = iv;//@"init Vec";
    //const void *keyPtr = (const void *) [key UTF8String];
    //const void *ivPtr = (const void *) [initVec UTF8String];
    
    char keyPtr[kCCKeySize3DES+1];
    //char keyPtr[kCCKeySize3DES];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    char ivPtr[kCCBlockSize3DES+1];
    //char ivPtr[kCCBlockSize3DES];
    bzero(ivPtr, sizeof(ivPtr));
    [initVec getCString:ivPtr maxLength:sizeof(ivPtr) encoding:NSUTF8StringEncoding];

    ccStatus = CCCrypt(encryptOrDecrypt,
                       kCCAlgorithm3DES,
                       kCCOptionPKCS7Padding,
                       keyPtr, //"123456789012345678901234", //key
                       kCCKeySize3DES,
                       ivPtr, //"init Vec", //iv,
                       vplainText, //"Your Name", //plainText,
                       plainTextBufferSize,
                       (void *)bufferPtr,
                       bufferPtrSize,
                       &movedBytes);
    
    if (kCCSuccess != ccStatus)
    {
        free(bufferPtr);
        return @"";
    }
    //if (ccStatus == kCCSuccess) NSLog(@"SUCCESS");
    /*else if (ccStatus == kCC ParamError) return @"PARAM ERROR";
     else if (ccStatus == kCCBufferTooSmall) return @"BUFFER TOO SMALL";
     else if (ccStatus == kCCMemoryFailure) return @"MEMORY FAILURE";
     else if (ccStatus == kCCAlignmentError) return @"ALIGNMENT";
     else if (ccStatus == kCCDecodeError) return @"DECODE ERROR";
     else if (ccStatus == kCCUnimplemented) return @"UNIMPLEMENTED"; */
    
    NSString *result;
    
    if (encryptOrDecrypt == kCCDecrypt)
    {
        result = [[NSString alloc] initWithData:[NSData dataWithBytes:(const void *)bufferPtr
                                                               length:(NSUInteger)movedBytes]
                                       encoding:NSUTF8StringEncoding];
    }
    else
    {
        NSData *myData = [NSData dataWithBytes:(const void *)bufferPtr length:(NSUInteger)movedBytes];
        result = [NSString base64EncodeData:myData];
    }
    
    free(bufferPtr);
    return result;
}

// 编码
+ (NSString *)encodeDES:(NSString *)plainText key:(NSString *)key
{
    NSString* ret = [NSString TripleDES:plainText encryptOrDecrypt:kCCEncrypt key:key];
    NSLog(@"3DES/Base64 Encode Result=%@", ret);
    
    return ret;
}

// 解码
+ (NSString *)decodeDES:(NSString *)plainText key:(NSString *)key
{
    NSString* ret = [NSString TripleDES:plainText encryptOrDecrypt:kCCDecrypt key:key];
    NSLog(@"3DES/Base64 Decode Result=%@", ret);
    
    return ret;
}

- (NSString *)AES256EncryptedDataUsingKey:(id)key iv:(id)iv error:(NSError **)error
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSData *result = [data AES256EncryptedDataUsingKey:key iv:iv error:error];
    
    return [result lowerHexString];
}

- (NSString *)AES256DecryptedDataUsingKey:(id)key iv:(id)iv error:(NSError **)error
{
    NSData *data = [NSData dataWithHexString:self];
    NSData *result = [data AES256DecryptedDataUsingKey:key iv:iv error:error];
    
    return [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
}

- (NSString *)DESEncryptedDataUsingKey:(id)key iv:(id)iv error:(NSError **)error
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSData *result = [data DESEncryptedDataUsingKey:key iv:iv error:error];
    
    return [result lowerHexString];
}

- (NSString *)DESDecryptedDataUsingKey:(id)key iv:(id)iv error:(NSError **)error
{
    NSData *data = [NSData dataWithHexString:self];
    NSData *result = [data DESDecryptedDataUsingKey:key iv:iv error:error];
    
    return [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
}

- (NSString *)TripleDESEncryptedDataUsingKey:(id)key iv:(id)iv error:(NSError **)error
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSData *result = [data TripleDESEncryptedDataUsingKey:key iv:iv error:error];
    
    return [result lowerHexString];
}

- (NSString *)TripleDESDecryptedDataUsingKey:(id)key iv:(id)iv error:(NSError **)error
{
    NSData *data = [NSData dataWithHexString:self];
    NSData *result = [data TripleDESDecryptedDataUsingKey:key iv:iv error:error];
    
    return [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
}

- (NSString *)Base64AES256EncryptedDataUsingKey:(id)key iv:(id)iv error:(NSError **)error
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSData *result = [data AES256EncryptedDataUsingKey:key iv:iv error:error];
    
    return [NSString base64EncodeData:result];
}

- (NSString *)Base64AES256DecryptedDataUsingKey:(id)key iv:(id)iv error:(NSError **)error
{
    NSData *data = [NSString base64DecodeString:self];
    NSData *result = [data AES256DecryptedDataUsingKey:key iv:iv error:error];
    
    return [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
}

- (NSString *)Base64DESEncryptedDataUsingKey:(id)key iv:(id)iv error:(NSError **)error
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSData *result = [data DESEncryptedDataUsingKey:key iv:iv error:error];
    
    return [NSString base64EncodeData:result];
}

- (NSString *)Base64DESDecryptedDataUsingKey:(id)key iv:(id)iv error:(NSError **)error
{
    NSData *data = [NSString base64DecodeString:self];
    NSData *result = [data DESDecryptedDataUsingKey:key iv:iv error:error];
    
    return [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
}

- (NSString *)Base64TripleDESEncryptedDataUsingKey:(id)key iv:(id)iv error:(NSError **)error
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSData *result = [data TripleDESEncryptedDataUsingKey:key iv:iv error:error];
    
    return [NSString base64EncodeData:result];
}

- (NSString *)Base64TripleDESDecryptedDataUsingKey:(id)key iv:(id)iv error:(NSError **)error
{
    NSData *data = [NSString base64DecodeString:self];
    NSData *result = [data TripleDESDecryptedDataUsingKey:key iv:iv error:error];
    
    return [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
}


#pragma mark - 文件散列函数

- (NSString *)fileMD5Hash
{
    return [NSData getFileMD5HashString:self];
}

- (NSString *)fileSHA1Hash
{
    return [NSData getFileSHA1HashString:self];
}

- (NSString *)fileSHA256Hash
{
    return [NSData getFileSHA256HashString:self];
}

- (NSString *)fileSHA512Hash
{
    return [NSData getFileSHA512HashString:self];
}

- (NSString *)fileCRC32SHash
{
    return [NSData getFileCRC32String:self];
}

@end
