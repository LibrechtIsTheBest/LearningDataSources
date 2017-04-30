#import "NVPhotoCollectionViewCell.h"
#import "NVPhotoViewModel.h"

@interface NVPhotoCollectionViewCell ()

@property (nonatomic, weak) IBOutlet UILabel *imageNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *commentLabel;

@end

@implementation NVPhotoCollectionViewCell

- (void)configureWithViewModel:(NVPhotoViewModel *)viewModel
{
    self.imageNameLabel.text = viewModel.imageName;
    self.commentLabel.text = viewModel.comment;
    self.backgroundColor = viewModel.backgroundColor;
}

@end
