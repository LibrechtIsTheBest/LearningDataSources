#import "UIView+NVReusable.h"
#import "NVViewModelConfigurable.h"

@class NVPointHeaderViewModel;

@interface NVPointCollectionHeaderView : UICollectionReusableView <NVViewModelConfigurable>

- (void)configureWithViewModel:(NVPointHeaderViewModel *)viewModel;

@end
