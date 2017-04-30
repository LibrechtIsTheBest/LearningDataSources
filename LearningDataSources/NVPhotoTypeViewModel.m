#import "NVPhotoTypeViewModel.h"
#import "NVPhotoType.h"


@interface NVPhotoTypeViewModel () <NSObject>

@property (nonatomic) NVPhotoType *photoType;

@end


@implementation NVPhotoTypeViewModel

- (instancetype)initWithPhotoType:(NVPhotoType *)photoType
{
    self = [super init];
    if (self) {
        _photoType = photoType;
        _title = [NSString stringWithFormat:@"All photos in category: %@", photoType.name];
        _subtitle = [NSString stringWithFormat:@"X / %@", @(photoType.requiredQuantity)];
        _backgroundColor = photoType.requiredQuantity > 5 ?
            UIColor.redColor : UIColor.greenColor;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@: title: %@ subtitle: %@ backgroundColor: %@",
        super.description, self.title, self.subtitle, self.backgroundColor];
}

@end
