#import "NVPointCollectionHeaderView.h"
#import "NVPointViewModel.h"

@interface NVPointCollectionHeaderView ()

@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *addressLabel;

@end

@implementation NVPointCollectionHeaderView

- (instancetype)init
{
    self = [NVPointCollectionHeaderView view];
    return self;
}

- (void)configureWithViewModel:(NVPointViewModel *)viewModel
{
    self.nameLabel.text = viewModel.name;
    self.addressLabel.text = viewModel.address;
}

@end
