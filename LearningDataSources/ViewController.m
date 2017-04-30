#import "ViewController.h"
// Views
#import "NVPhotoCollectionViewCell.h"
#import "NVPointCollectionHeaderView.h"
#import "NVPhotoTypeCollectionHeaderView.h"
// ViewModels
#import "NVPointViewModel.h"
#import "NVPhotoTypeViewModel.h"
#import "NVPhotoViewModel.h"
// Models
#import "NVPoint.h"
#import "NVPhotoType.h"
// Delegates
#import "NVDataSource.h"
#import "NVPhotoTypeDataSourceAdapter.h"
#import "NVPhotosInteractor.h"
// Helpers
#import "NSArray+NVHelper.h"
#import "UIView+NVLayout.h"


@interface ViewController () <UICollectionViewDelegateFlowLayout, NVPhotosInteractorOutput>

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic, weak) IBOutlet UICollectionViewFlowLayout *flowLayout;
@property (nonatomic) NVPointCollectionHeaderView *dummyPointHeader;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addPhotoItem;

@property (nonatomic) NVPhotosInteractor *interactor;
@property (nonatomic) NVPhotoTypeDataSourceAdapter *adapter;
@property (nonatomic) NVDataSource<NVPhotoViewModel *, id, id> *dataSource;

@end


@implementation ViewController

#pragma mark - View life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dummyPointHeader = [[NVPointCollectionHeaderView alloc] init];
    self.dummyPointHeader.translatesAutoresizingMaskIntoConstraints = NO;
    self.addPhotoItem.enabled = NO;
    
    [self prepareCollectionViewLayout];
    [self prepareCollectionViewDataSource];
    [self registerCells];
    
    self.collectionView.backgroundView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    self.interactor = [[NVPhotosInteractor alloc] init];
    self.interactor.photoTypeName = @"type1";
    self.interactor.output = self;
    [self.interactor requestPhotoData];
}

#pragma mark - <NVPhotosInteractorOutput>

- (void)interactorDidRecievePhotoType:(NVPhotoTypeViewModel *)viewModel
{
    NVGroup *group = [[NVGroup alloc] init];
    NVElement<NVPhotoTypeViewModel *> *header = [[NVElement alloc]
        initWithReuseIdentifier:[NVPhotoTypeCollectionHeaderView reuseIdentifier]
        viewModel:viewModel];
    header.attributes.elementSize = ^CGSize (NVElement *element) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        return CGSizeMake(width, 100);
    };
    group.header = header;
    [self.dataSource addGroup:group];
    [self.collectionView reloadData];
}

- (void)interactorDidRecievePoints:(NSArray<NVPointViewModel *> *)viewModels
{
    for (NVPointViewModel *pointViewModel in viewModels) {
        NVGroup *group = [self groupForPointViewModel:pointViewModel];
        [self.dataSource addGroup:group];
    }
    [self.collectionView reloadData];
}

- (void)interactorDidCreateRandomPhoto:(NVPhotoViewModel *)photoViewModel
{
    nv_define_weak_self(weakSelf);
    NVElement<NVPhotoViewModel *> *element =
    [NVElement elementWithReuseIdentifier:[NVPhotoCollectionViewCell reuseIdentifier]
        viewModel:photoViewModel];
    element.attributes.onDidSelect = ^(NSIndexPath *indexPath) {
        [weakSelf didSelectViewModel:photoViewModel atIndexPath:indexPath];
    };
    NSInteger last = [self.dataSource numberOfElementsInGroup:0];
    [self.dataSource insertElement:element atIndex:last inGroup:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:last inSection:0];
    [self.collectionView insertItemsAtIndexPaths:@[indexPath]];
}

- (void)interactorDidEndRequesting
{
    self.collectionView.backgroundView = nil;
    self.addPhotoItem.enabled = YES;
}

#pragma mark - Private

- (void)prepareCollectionViewLayout
{
    CGFloat width = ([UIScreen mainScreen].bounds.size.width - self.flowLayout.minimumInteritemSpacing - self.flowLayout.sectionInset.left - self.flowLayout.sectionInset.right) / 2;
    self.flowLayout.itemSize = CGSizeMake(width, width * 1.2);
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

- (void)prepareCollectionViewDataSource
{
    self.dataSource = [[NVDataSource alloc] init];
    
    self.adapter = [[NVPhotoTypeDataSourceAdapter alloc] init];
    self.adapter.adaptee = self.dataSource;
    
    self.collectionView.dataSource = self.adapter;
    self.collectionView.delegate = self;
}

- (NVGroup *)groupForPointViewModel:(NVPointViewModel *)pointViewModel
{
    nv_define_weak_self(weakSelf);
    NSArray<NVElement *> *elements =
        [pointViewModel.photoViewModels map:^NVElement *(NVPhotoViewModel *viewModel) {
        NVElement<NVPhotoViewModel *> *element =
            [NVElement elementWithReuseIdentifier:[NVPhotoCollectionViewCell reuseIdentifier]
                viewModel:viewModel];
        element.attributes.onDidSelect = ^(NSIndexPath *indexPath) {
            [weakSelf didSelectViewModel:viewModel atIndexPath:indexPath];
        };
        return element;
    }];

    NVGroup *group = [[NVGroup alloc] initWithElements:elements];
    group.header = [[NVElement alloc]
        initWithReuseIdentifier:[NVPointCollectionHeaderView reuseIdentifier]
        viewModel:pointViewModel];
    group.header.attributes.elementSize = ^CGSize (NVElement *header) {
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        [self.dummyPointHeader configureWithViewModel:header.viewModel];
        CGSize size = [self.dummyPointHeader sizeToFitWidth:width];
        return CGSizeMake(width, size.height);
    };
    return group;
}

- (void)didSelectViewModel:(id)viewModel atIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Did select viewModel: %@ at indexPath %@", viewModel, indexPath);
    [self.dataSource deleteElementAtIndex:indexPath.item inGroup:indexPath.section];
    [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
}

#pragma mark - <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView
    didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NVElement *element = [self.dataSource elementAtIndex:indexPath.item inGroup:indexPath.section];
    nv_safe_block_call(element.attributes.onDidSelect, indexPath);
}

- (CGSize)collectionView:(UICollectionView *)collectionView
    layout:(UICollectionViewLayout *)collectionViewLayout
    referenceSizeForHeaderInSection:(NSInteger)section
{
    NVElement *header = [self.dataSource headerOfGroup:section];
    nv_safe_block_call_return(header.attributes.elementSize, CGSizeZero, header);
}

#pragma mark - Target - Action

- (IBAction)addItem:(id)sender
{
    [self.interactor createRandomPhoto];
}

@end
