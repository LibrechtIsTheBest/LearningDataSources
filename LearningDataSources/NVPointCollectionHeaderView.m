#import "NVPointCollectionHeaderView.h"
#import "NVPointHeaderViewModel.h"

@interface NVPointCollectionHeaderView ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@end

@implementation NVPointCollectionHeaderView

- (instancetype)init
{
    self = [NVPointCollectionHeaderView view];
    return self;
}

- (void)configureWithViewModel:(NVPointHeaderViewModel *)viewModel
{
    self.nameLabel.text = viewModel.name;
    self.addressLabel.text = viewModel.address;
}

@end
