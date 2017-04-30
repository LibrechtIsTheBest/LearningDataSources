#import "NVPhotoTypeCollectionHeaderView.h"
#import "NVPhotoTypeViewModel.h"

@interface NVPhotoTypeCollectionHeaderView ()

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *subtitleLabel;

@end

@implementation NVPhotoTypeCollectionHeaderView

- (void)configureWithViewModel:(NVPhotoTypeViewModel *)viewModel
{
    self.titleLabel.text = viewModel.title;
    self.subtitleLabel.text = viewModel.subtitle;
    self.backgroundColor = viewModel.backgroundColor;
}

@end
