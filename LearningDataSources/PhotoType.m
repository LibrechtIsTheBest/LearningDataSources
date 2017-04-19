#import "PhotoType.h"

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
        
    }
    return self;
}

@end
