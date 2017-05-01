#import "NVPhotoCollectionViewController.h"
// Views
#import "NVPhotoCollectionViewCell.h"
#import "NVPointCollectionHeaderView.h"
#import "NVPhotoTypeCollectionHeaderView.h"
// ViewModels
#import "NVPointViewModel.h"
#import "NVPhotoTypeViewModel.h"
#import "NVPhotoViewModel.h"
#import "NVPhotoCollectionViewModel.h"
// DataSource Adapter
#import "NVCollectionViewDataSourceAdapter.h"
// Helpers
#import "UIView+NVLayout.h"


@interface NVPhotoCollectionViewController () <UICollectionViewDelegateFlowLayout, NVPhotoCollectionViewModelDelegate, NVPhotoCollectionViewModelOutput>

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic, weak) IBOutlet UICollectionViewFlowLayout *flowLayout;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *addPhotoItem;
@property (nonatomic) NVPointCollectionHeaderView *dummyPointHeader;

@property (nonatomic) NVCollectionViewDataSourceAdapter *adapter;
@property (nonatomic) NVPhotoCollectionViewModel *viewModel;

@end


@implementation NVPhotoCollectionViewController

#pragma mark - View life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dummyPointHeader = [[NVPointCollectionHeaderView alloc] init];
    self.dummyPointHeader.translatesAutoresizingMaskIntoConstraints = NO;
    
    // NOTE: ViewModel should come from outside
    self.viewModel = [[NVPhotoCollectionViewModel alloc] init];
    self.viewModel.delegate = self;
    self.viewModel.output = self;
    
    [self prepareCollectionViewLayout];
    [self prepareCollectionViewDataSource];
    [self registerCells];
    
    [self.viewModel updateData];
}

#pragma mark - <PhotoCollectionViewModelDelegate>

- (NSString *)photoTypeHeaderReuseID
{
    return [NVPhotoTypeCollectionHeaderView reuseIdentifier];
}

- (NSString *)pointHeaderReuseID
{
    return [NVPointCollectionHeaderView reuseIdentifier];
}

- (NSString *)photoCellReuseID
{
    return [NVPhotoCollectionViewCell reuseIdentifier];
}

- (CGSize)photoTypeHeaderSizeForViewModel:(NVPhotoTypeViewModel *)viewModel
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    return CGSizeMake(width, 100);
}

- (CGSize)pointHeaderSizeForViewModel:(NVPointViewModel *)viewModel
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    [self.dummyPointHeader configureWithViewModel:viewModel];
    CGSize size = [self.dummyPointHeader sizeToFitWidth:width];
    return CGSizeMake(width, size.height);
}

#pragma mark - <PhotoCollectionViewModelOutput>

- (void)viewModelDidDidStartUpdatingDataSource
{
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [indicator startAnimating];
    self.collectionView.backgroundView = indicator;
    self.addPhotoItem.enabled = NO;
}

- (void)viewModelDidUpdateDataSource
{
    [self.collectionView reloadData];
}

- (void)viewModelDidDidEndUpdatingDataSource
{
    self.collectionView.backgroundView = nil;
    self.addPhotoItem.enabled = YES;
}

- (void)viewModelDidAddPhotoAtIndex:(NSInteger)index inSection:(NSInteger)section
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:section];
    [self.collectionView insertItemsAtIndexPaths:@[indexPath]];
}

- (void)viewModelDidDeletePhotoAtIndex:(NSInteger)index inSection:(NSInteger)section
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:section];
    [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
}

#pragma mark - Private

- (void)prepareCollectionViewLayout
{
    CGFloat width = ([UIScreen mainScreen].bounds.size.width - self.flowLayout.minimumInteritemSpacing - self.flowLayout.sectionInset.left - self.flowLayout.sectionInset.right) / 2;
    self.flowLayout.itemSize = CGSizeMake(width, width * 1.2);
}

- (void)prepareCollectionViewDataSource
{
    self.adapter = [[NVCollectionViewDataSourceAdapter alloc] init];
    self.adapter.adaptee = self.viewModel.dataSource;
    
    self.collectionView.dataSource = self.adapter;
    self.collectionView.delegate = self;
}

- (void)registerCells
{
    [self.collectionView registerNib:[NVPhotoCollectionViewCell nib]
        forCellWithReuseIdentifier:[NVPhotoCollectionViewCell reuseIdentifier]];
    [self.collectionView registerNib:[NVPhotoTypeCollectionHeaderView nib]
        forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
        withReuseIdentifier:[NVPhotoTypeCollectionHeaderView reuseIdentifier]];
    [self.collectionView registerNib:[NVPointCollectionHeaderView nib]
        forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
        withReuseIdentifier:[NVPointCollectionHeaderView reuseIdentifier]];
}

#pragma mark - <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView
    didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.viewModel userDidSelectCellAtIndex:indexPath.item inSection:indexPath.section];
}

- (CGSize)collectionView:(UICollectionView *)collectionView
    layout:(UICollectionViewLayout *)collectionViewLayout
    referenceSizeForHeaderInSection:(NSInteger)section
{
    return [self.viewModel sizeForHeaderInSection:section];
}

#pragma mark - Target - Action

- (IBAction)addItem:(id)sender
{
    [self.viewModel addNewPhoto];
}

@end
