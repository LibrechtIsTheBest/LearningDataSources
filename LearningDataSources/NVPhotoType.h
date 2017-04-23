#import <Foundation/Foundation.h>

@class NVPhoto;

@interface NVPhotoType : NSObject

- (instancetype)initWithName:(NSString *)name
    requiredQuantity:(NSUInteger)requiredQuantity
    photos:(NSArray<NVPhoto *> *)photos;

@property (copy, nonatomic) NSString *name;
@property (nonatomic) NSUInteger requiredQuantity;
@property (nonatomic) NSArray <NVPhoto *> *photos;

@end
