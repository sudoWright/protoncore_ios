// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from open_pgp.djinni

#import <Foundation/Foundation.h>
@class PMNIAddress;


@interface PMNIAddress : NSObject

- (nonnull NSString *)getStreetAddress;

- (nonnull NSString *)getExtendedAddress;

- (nonnull NSString *)getLocality;

- (nonnull NSString *)getRegion;

- (nonnull NSString *)getPostalCode;

- (nonnull NSString *)getCountry;

- (nonnull NSArray<NSString *> *)getTypes;

- (nonnull NSString *)getPoBox;

- (nonnull NSArray<NSString *> *)getPoBoxes;

+ (nullable PMNIAddress *)createInstance:(nonnull NSString *)type
                                  street:(nonnull NSString *)street
                            extendstreet:(nonnull NSString *)extendstreet
                                locality:(nonnull NSString *)locality
                                  region:(nonnull NSString *)region
                                     zip:(nonnull NSString *)zip
                                 country:(nonnull NSString *)country
                                   pobox:(nonnull NSString *)pobox;

@end
