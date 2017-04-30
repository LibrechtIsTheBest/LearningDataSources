#import <Foundation/Foundation.h>

@class NVPhotoType;

@interface NVPoint : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *address;
@property (nonatomic, copy, readonly) NSArray <NVPhotoType *> *photoTypes;

- (instancetype)initWithName:(NSString *)name
    address:(NSString *)address
    photoTypes:(NSArray<NVPhotoType *> *)photoTypes;

+ (instancetype)pointWithName:(NSString *)name
    address:(NSString *)address
    photoTypes:(NSArray<NVPhotoType *> *)photoTypes;


@end
