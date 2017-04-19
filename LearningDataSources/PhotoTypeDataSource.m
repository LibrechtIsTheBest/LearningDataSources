#import "PhotoTypeDataSource.h"
#import "BaseDataSource+Protected.h"

#import "Photo.h"
#import "PhotoType.h"
#import "PhotoTypeHeaderViewModel.h"


@implementation PhotoTypeDataSource

- (instancetype)initWithPhotoType:(PhotoType *)photoType
{
    self = [super init];
    if (self) {
        [self initializeWithPhotoType:photoType];
    }
    return self;
}

- (void)initializeWithPhotoType:(PhotoType *)photoType
{
    // Custom setup code
    GroupObject *group0 = [[GroupObject alloc] init];
    group0.headerObject = [[PhotoTypeHeaderViewModel alloc] initWithPhotoType:photoType];

    for (Photo *photo in photoType.photos) {
        
    }
    
}

@end
