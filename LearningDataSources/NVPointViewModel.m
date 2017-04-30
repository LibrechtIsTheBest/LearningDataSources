#import "NVPointViewModel.h"
#import "NVPhotoViewModel.h"
#import "NVPhotoType.h"
#import "NVPoint.h"
#import "NSArray+NVHelper.h"


@implementation NVPointViewModel

- (instancetype)initWithPoint:(NVPoint *)point
{
    self = [super init];
    if (self) {
        _name = point.name;
        _address = point.address;
        _photoViewModels = [point.photoTypes flatMap:^id(NVPhotoType *photoType) {
            return [photoType.photos map:^id(NVPhoto *photo) {
                return [[NVPhotoViewModel alloc] initWithPhoto:photo];
            }];
        }];
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@: name: %@ address: %@",
        super.description, self.name, self.address];
}

@end
