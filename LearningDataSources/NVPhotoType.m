#import "NVPhotoType.h"
#import "NVPhoto.h"

@implementation NVPhotoType

- (instancetype)initWithName:(NSString *)name
    requiredQuantity:(NSUInteger)requiredQuantity
    photos:(NSArray<NVPhoto *> *)photos
{
    self = [super init];
    if (self) {
        _name = [name copy];
        _requiredQuantity = requiredQuantity;
        _photos = photos;
        for (NVPhoto *photo in photos) {
            photo.type = self;
        }
    }
    return self;
}

@end
