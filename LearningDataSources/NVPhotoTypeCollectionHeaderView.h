#import "UIView+NVReusable.h"
#import "NVViewModelConfigurable.h"

@class NVPhotoTypeViewModel;

@interface NVPhotoTypeCollectionHeaderView : UICollectionReusableView <NVViewModelConfigurable>

- (void)configureWithViewModel:(NVPhotoTypeViewModel *)viewModel;

@end
