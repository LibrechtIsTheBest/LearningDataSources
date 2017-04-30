#import "UIView+NVReusable.h"
#import "NVViewModelConfigurable.h"

@class NVPointViewModel;

@interface NVPointCollectionHeaderView : UICollectionReusableView <NVViewModelConfigurable>

- (void)configureWithViewModel:(NVPointViewModel *)viewModel;

@end
