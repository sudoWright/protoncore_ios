// Objective-C API for talking to github.com/ProtonVPN/go-vpn-lib/ed25519 Go package.
//   gobind -lang=objc github.com/ProtonVPN/go-vpn-lib/ed25519
//
// File is generated by gobind. Do not edit.

#ifndef __Ed25519_H__
#define __Ed25519_H__

@import Foundation;
#include "ref.h"
#include "Universe.objc.h"


@class Ed25519KeyPair;

@interface Ed25519KeyPair : NSObject <goSeqRefInterface> {
}
@property(strong, readonly) _Nonnull id _ref;

- (nonnull instancetype)initWithRef:(_Nonnull id)ref;
/**
 * NewKeyPair generates new ED25519 key pair
 */
- (nullable instancetype)init;
/**
 * Clear clears memory storing key pair
 */
- (void)clear;
- (NSData* _Nullable)privateKeyBytes;
/**
 * PrivateKeyPKIX private key in PKIX, ASN.1 DER format
 */
- (NSData* _Nullable)privateKeyPKIX;
/**
 * PrivateKeyPKIXBase64 returns private key PKIX, ASN.1 DER in Base64
 */
- (NSString* _Nonnull)privateKeyPKIXBase64;
/**
 * PrivateKeyPKIXPem returns private key ASN.1 DER representation as PEM
 */
- (NSString* _Nonnull)privateKeyPKIXPem;
- (NSData* _Nullable)publicKeyBytes;
/**
 * PublicKeyPKIX returns public key in PKIX, ASN.1 DER format
 */
- (NSData* _Nullable)publicKeyPKIX:(NSError* _Nullable* _Nullable)error;
/**
 * PublicKeyPKIXBase64 public key in PKIX, ASN.1 DER in Base64
 */
- (NSString* _Nonnull)publicKeyPKIXBase64:(NSError* _Nullable* _Nullable)error;
/**
 * PublicKeyPKIXPem returns public key in ASN.1 DER representation as PEM
 */
- (NSString* _Nonnull)publicKeyPKIXPem:(NSError* _Nullable* _Nullable)error;
/**
 * ToX25519 converts to X25519 secret key.
 */
- (NSData* _Nullable)toX25519;
/**
 * ToX25519Base64 converts to X25519 secret key encoded as base64.
 */
- (NSString* _Nonnull)toX25519Base64;
@end

@interface Ed25519 : NSObject
+ (NSData* _Nullable) ed25519PKIXPrivatePrefix;
+ (void) setEd25519PKIXPrivatePrefix:(NSData* _Nullable)v;

+ (NSData* _Nullable) ed25519PKIXPublicPrefix;
+ (void) setEd25519PKIXPublicPrefix:(NSData* _Nullable)v;

@end

/**
 * NewKeyPair generates new ED25519 key pair
 */
FOUNDATION_EXPORT Ed25519KeyPair* _Nullable Ed25519NewKeyPair(NSError* _Nullable* _Nullable error);

#endif
