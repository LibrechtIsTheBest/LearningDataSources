#import "NVPhotoViewModel.h"
#import "NVPhoto.h"

@implementation NVPhotoViewModel

- (instancetype)initWithPhoto:(NVPhoto *)photo
{
    self = [super init];
    if (self) {
        _imageName = photo.imageName;
        _comment = photo.comment;
        _backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@: imageName: %@, comment: %@", super.description, self.imageName, self.comment];
}

@end
