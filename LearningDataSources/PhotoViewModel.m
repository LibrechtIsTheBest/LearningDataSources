#import "PhotoViewModel.h"
#import "Photo.h"

@implementation PhotoViewModel

- (instancetype)initWithPhoto:(Photo *)photo
{
    self = [super init];
    if (self) {
        _imageName = photo.imageName;
        _comment = photo.comment;
    }
    return self;
}

@end