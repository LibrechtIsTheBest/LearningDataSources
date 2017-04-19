#import "PhotoTypeHeaderViewModel.h"
#import "PhotoType.h"

@interface PhotoTypeHeaderViewModel ()

@property (nonatomic) PhotoType *photoType;

@end

@implementation PhotoTypeHeaderViewModel

- (instancetype)initWithPhotoType:(PhotoType *)photoType
{
    self = [super init];
    if (self) {
        _photoType = photoType;
        _title = [NSString stringWithFormat:@"All photos in category: %@", photoType.name];
        _subtitle = [NSString stringWithFormat:@"X / %@", @(photoType.requaredQuantity)];
        _backgroundColor = photoType.requaredQuantity > 5 ? [UIColor redColor] : [UIColor blackColor];
    }
    return self;
}

@end
