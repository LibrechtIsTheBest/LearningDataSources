#import "NVPhotoCollectionViewCell.h"
#import "NVPhotoViewModel.h"

@interface NVPhotoCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *imageNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

@end

@implementation NVPhotoCollectionViewCell

- (void)configureWithViewModel:(NVPhotoViewModel *)viewModel
{
    self.imageNameLabel.text = viewModel.imageName;
    self.commentLabel.text = viewModel.comment;
    self.backgroundColor = viewModel.backgroundColor;
}

@end
