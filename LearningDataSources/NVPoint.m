#import "NVPoint.h"
#import "NVPhotoType.h"
#import "NVPhoto.h"

@implementation NVPoint

- (instancetype)initWithName:(NSString *)name
    address:(NSString *)address
    photoTypes:(NSArray<NVPhotoType *> *)photoTypes
{
    self = [super init];
    if (self) {
        _name = [name copy];
        _address = [address copy];
        _photoTypes = [photoTypes copy];
        for (NVPhotoType *photoType in photoTypes) {
            for (NVPhoto *photo in photoType.photos) {
                photo.point = self;
            }
        }
    }

    return self;
}

+ (instancetype)pointWithName:(NSString *)name
    address:(NSString *)address
    photoTypes:(NSArray<NVPhotoType *> *)photoTypes
{
    return [[self alloc] initWithName:name address:nil photoTypes:photoTypes];
}

@end
