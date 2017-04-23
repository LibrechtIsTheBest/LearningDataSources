#import <Foundation/Foundation.h>

@class NVPhotoType;

@interface NVPoint : NSObject

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *address;
@property (copy, nonatomic) NSArray <NVPhotoType *> *photoTypes;

- (instancetype)initWithName:(NSString *)name
    address:(NSString *)address
    photoTypes:(NSArray<NVPhotoType *> *)photoTypes;

+ (instancetype)pointWithName:(NSString *)name
    address:(NSString *)address
    photoTypes:(NSArray<NVPhotoType *> *)photoTypes;


@end
