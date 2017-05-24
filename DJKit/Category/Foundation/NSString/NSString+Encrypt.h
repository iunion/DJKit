//
//  NSString+Encrypt.h
//  DJkit
//
//  Created by DennisDeng on 2017/5/2.
//  Copyright © 2017年 DennisDeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Encrypt)

/**
 Returns a NSString for base64 encoded.
 */
+ (NSString *)base64EncodeData:(NSData *)data;

/**
 Returns a NSData for base64 decoded.
 */
+ (NSData *)base64DecodeString:(NSString *)base64Str;

#pragma mark - 散列函数
/**
 Returns a lowercase NSString for md2 hash.
 */
- (NSString *)md2String;

/**
 Returns a lowercase NSString for md4 hash.
 */
- (NSString *)md4String;

/**
 Returns a lowercase NSString for md5 hash.
 */
- (NSString *)md5String;
- (NSString *)md5HexDigest16;

/**
 Returns a lowercase NSString for sha1 hash.
 */
- (NSString *)sha1String;

/**
 Returns a lowercase NSString for sha224 hash.
 */
- (NSString *)sha224String;

/**
 Returns a lowercase NSString for sha256 hash.
 */
- (NSString *)sha256String;

/**
 Returns a lowercase NSString for sha384 hash.
 */
- (NSString *)sha384String;

/**
 Returns a lowercase NSString for sha512 hash.
 */
- (NSString *)sha512String;

#pragma mark - HMAC 散列函数
/**
 Returns a lowercase NSString for hmac using algorithm md5 with key.
 @param key The hmac key.
 */
- (NSString *)hmacMD5StringWithKey:(NSString *)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha1 with key.
 @param key The hmac key.
 */
- (NSString *)hmacSHA1StringWithKey:(NSString *)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha224 with key.
 @param key The hmac key.
 */
- (NSString *)hmacSHA224StringWithKey:(NSString *)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha256 with key.
 @param key The hmac key.
 */
- (NSString *)hmacSHA256StringWithKey:(NSString *)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha384 with key.
 @param key The hmac key.
 */
- (NSString *)hmacSHA384StringWithKey:(NSString *)key;

/**
 Returns a lowercase NSString for hmac using algorithm sha512 with key.
 @param key The hmac key.
 */
- (NSString *)hmacSHA512StringWithKey:(NSString *)key;

/**
 Returns a lowercase NSString for crc32 hash.
 */
- (NSString *)crc32String;

#pragma mark - Encrypt and Decrypt

// DES+base64
// key为24位 kCCKeySize3DES
// 编码
+ (NSString *)encodeDES:(NSString *)plainText key:(NSString *)key;
// 解码
+ (NSString *)decodeDES:(NSString *)plainText key:(NSString *)key;

/**
 Returns an encrypted lowercase NSString in hex using an algorithm(AES, DES ...).
 
  @param key        A key length of 16, 24 or 32 (128, 192 or 256bits).
                    NSData or NSString.
 
 @param iv          An initialization vector length of 16(128bits).
                    Pass nil when you don't want to use iv.
                    NSData or NSString.
 
 @return            An NSData encrypted, or nil if an error occurs.
 */
- (nullable NSString *)AES256EncryptedDataUsingKey:(id)key iv:(nullable id)iv error:(NSError * _Nullable * _Nullable)error;
- (nullable NSString *)AES256DecryptedDataUsingKey:(id)key iv:(nullable id)iv error:(NSError * _Nullable * _Nullable)error;
- (nullable NSString *)DESEncryptedDataUsingKey:(id)key iv:(nullable id)iv error:(NSError * _Nullable * _Nullable)error;
- (nullable NSString *)DESDecryptedDataUsingKey:(id)key iv:(nullable id)iv error:(NSError * _Nullable * _Nullable)error;
- (nullable NSString *)TripleDESEncryptedDataUsingKey:(id)key iv:(nullable id)iv error:(NSError * _Nullable * _Nullable)error;
- (nullable NSString *)TripleDESDecryptedDataUsingKey:(id)key iv:(nullable id)iv error:(NSError * _Nullable * _Nullable)error;

/**
 Returns an encrypted base64 encoded NSString using an algorithm(AES, DES ...).
 
 @param key         A key length of 16, 24 or 32 (128, 192 or 256bits).
                    NSData or NSString.
 
 @param iv          An initialization vector length of 16(128bits).
                    Pass nil when you don't want to use iv.
                    NSData or NSString.
 
 @return            An NSData encrypted, or nil if an error occurs.
 */
- (nullable NSString *)Base64AES256EncryptedDataUsingKey:(id)key iv:(nullable id)iv error:(NSError * _Nullable * _Nullable)error;
- (nullable NSString *)Base64AES256DecryptedDataUsingKey:(id)key iv:(nullable id)iv error:(NSError * _Nullable * _Nullable)error;
- (nullable NSString *)Base64DESEncryptedDataUsingKey:(id)key iv:(nullable id)iv error:(NSError * _Nullable * _Nullable)error;
- (nullable NSString *)Base64DESDecryptedDataUsingKey:(id)key iv:(nullable id)iv error:(NSError * _Nullable * _Nullable)error;
- (nullable NSString *)Base64TripleDESEncryptedDataUsingKey:(id)key iv:(nullable id)iv error:(NSError * _Nullable * _Nullable)error;
- (nullable NSString *)Base64TripleDESDecryptedDataUsingKey:(id)key iv:(nullable id)iv error:(NSError * _Nullable * _Nullable)error;


#pragma mark - 文件散列函数

- (nullable NSString *)fileMD5Hash;

- (nullable NSString *)fileSHA1Hash;

- (nullable NSString *)fileSHA256Hash;

- (nullable NSString *)fileSHA512Hash;

- (nullable NSString *)fileCRC32SHash;


@end

NS_ASSUME_NONNULL_END
