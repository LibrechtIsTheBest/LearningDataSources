#import "ViewController.h"
// Views
#import "NVPhotoCollectionViewCell.h"
#import "NVPointCollectionHeaderView.h"
#import "NVPhotoTypeCollectionHeaderView.h"
// ViewModels
#import "NVPointHeaderViewModel.h"
#import "NVPhotoTypeHeaderViewModel.h"
// Delegates
#import "NVPhotoTypeDataSourceFactory.h"
#import "NVPhotoTypeDataSourceAdapter.h"
#import "NVPhotosInteractor.h"
// Helpers
#import "UIView+NVLayout.h"

@interface ViewController () <UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;
@property (nonatomic) NVPointCollectionHeaderView *dummyPointHeader;

@property (nonatomic) NVPhotoTypeDataSourceFactory *dataSourceFactory;
@property (nonatomic) NVPhotoTypeDataSourceAdapter *adapter;
@property (nonatomic) NVDataSource *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dummyPointHeader = [[NVPointCollectionHeaderView alloc] init];
    self.dummyPointHeader.translatesAutoresizingMaskIntoConstraints = NO;

    CGFloat width = ([UIScreen mainScreen].bounds.size.width - self.flowLayout.minimumInteritemSpacing - self.flowLayout.sectionInset.left - self.flowLayout.sectionInset.right) / 2;
    self.flowLayout.itemSize = CGSizeMake(width, width * 1.2);
    
    [self.collectionView registerNib:[NVPhotoCollectionViewCell nib]
        forCellWithReuseIdentifier:[NVPhotoCollectionViewCell reuseIdentifier]];
    [self.collectionView registerNib:[NVPhotoTypeCollectionHeaderView nib]
        forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
        withReuseIdentifier:[NVPhotoTypeCollectionHeaderView reuseIdentifier]];
    [self.collectionView registerNib:[NVPointCollectionHeaderView nib]
        forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
        withReuseIdentifier:[NVPointCollectionHeaderView reuseIdentifier]];
    
    self.collectionView.backgroundView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    self.dataSourceFactory = [[NVPhotoTypeDataSourceFactory alloc] init];
    
    NVPhotosInteractor *interactor = [[NVPhotosInteractor alloc] init];
    interactor.photoTypeName = @"type1";
    [interactor getPointsWithCompletion:
        ^(NSArray<NVPoint *> *points, NVPhotoType *photoType, NSError *error) {
            [self createLayoutWithPoints:points photoType:photoType];
    }];
}

- (void)createLayoutWithPoints:(NSArray<NVPoint *> *)points photoType:(NVPhotoType *)type
{
    self.collectionView.backgroundView = nil;
    self.dataSource = [self.dataSourceFactory dataSourceWithPoints:points photoType:type];
    
    self.adapter = [[NVPhotoTypeDataSourceAdapter alloc] init];
    self.adapter.adaptee = self.dataSource;
    
    self.collectionView.dataSource = self.adapter;
    self.collectionView.delegate = self;
}

- (void)collectionView:(UICollectionView *)collectionView
    didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView
    layout:(UICollectionViewLayout *)collectionViewLayout
    referenceSizeForHeaderInSection:(NSInteger)section
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    NVElementObject *header = [self.dataSource headerObjectOfGroup:section];
    
    if ([header.viewModel isKindOfClass:[NVPointHeaderViewModel class]]) {
        [self.dummyPointHeader configureWithViewModel:header.viewModel];
        CGSize size = [self.dummyPointHeader sizeToFitWidth:width];
        return CGSizeMake(width, size.height);
    }
    else if ([header.viewModel isKindOfClass:[NVPhotoTypeHeaderViewModel class]]) {
        return CGSizeMake(width, 100);
    }
    return CGSizeZero;
}

@end
