#import "PhotoType.h"
#import "Photo.h"

@implementation PhotoType

- (instancetype)initWithName:(NSString *)name
    requiredQuantity:(NSUInteger)requiredQuantity
    photos:(NSArray<Photo *> *)photos
{
    self = [super init];
    if (self) {
        _name = [name copy];
        _requiredQuantity = requiredQuantity;
        _photos = photos;
        for (Photo *photo in photos) {
            photo.type = self;
        }
    }
    return self;
}

@end
