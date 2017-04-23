#import "NVPhotoTypeCollectionHeaderView.h"
#import "NVPhotoTypeHeaderViewModel.h"

@interface NVPhotoTypeCollectionHeaderView ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;

@end

@implementation NVPhotoTypeCollectionHeaderView

- (void)configureWithViewModel:(NVPhotoTypeHeaderViewModel *)viewModel
{
    self.titleLabel.text = viewModel.title;
    self.subtitleLabel.text = viewModel.subtitle;
    self.backgroundColor = viewModel.backgroundColor;
}

@end
