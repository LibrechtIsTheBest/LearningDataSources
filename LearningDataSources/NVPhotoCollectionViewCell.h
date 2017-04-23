#import "UIView+NVReusable.h"
#import "NVViewModelConfigurable.h"

@class NVPhotoViewModel;

@interface NVPhotoCollectionViewCell : UICollectionViewCell <NVViewModelConfigurable>

- (void)configureWithViewModel:(NVPhotoViewModel *)viewModel;

@end
