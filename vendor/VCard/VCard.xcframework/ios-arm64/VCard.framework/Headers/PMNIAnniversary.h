// AUTOGENERATED FILE - DO NOT MODIFY!
// This file was generated by Djinni from open_pgp.djinni

#import <Foundation/Foundation.h>
@class PMNIAnniversary;


@interface PMNIAnniversary : NSObject

- (nonnull NSString *)getDate;

- (nonnull NSString *)getType;

+ (nullable PMNIAnniversary *)createInstance:(nonnull NSString *)type
                                        date:(nonnull NSString *)date;

@end
