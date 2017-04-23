#import "UIView+NVReusable.h"
#import "NVViewModelConfigurable.h"

@class NVPhotoTypeHeaderViewModel;

@interface NVPhotoTypeCollectionHeaderView : UICollectionReusableView <NVViewModelConfigurable>

- (void)configureWithViewModel:(NVPhotoTypeHeaderViewModel *)viewModel;

@end
