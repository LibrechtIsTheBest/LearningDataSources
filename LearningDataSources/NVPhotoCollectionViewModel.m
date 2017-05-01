#import "NVPhotoCollectionViewModel.h"
// Delegates
#import "NVDataSource.h"
#import "NVPhotosInteractor.h"
// ViewModels
#import "NVPointViewModel.h"
// Helpers
#import "NSArray+NVHelper.h"


@interface NVPhotoCollectionViewModel () <NVPhotosInteractorOutput>

@property (nonatomic) NVPhotosInteractor *interactor;
@property (nonatomic) NVDataSource<NVPhotoViewModel *, id, id> *dataSource;

@end


@implementation NVPhotoCollectionViewModel

#pragma mark - Initialization

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dataSource = [[NVDataSource alloc] init];
        
        _interactor = [[NVPhotosInteractor alloc] init];
        _interactor.photoTypeName = @"type1";
        _interactor.output = self;
    }
    return self;
}

#pragma mark - Public

- (CGSize)sizeForHeaderInSection:(NSInteger)section
{
    NVElement *header = [self.dataSource headerOfGroup:section];
    nv_safe_block_call_return(header.attributes.elementSize, CGSizeZero, header);
}

#pragma mark - <PhotoCollectionViewModelInput>

- (void)updateData
{
    [self.interactor requestPhotoData];
    [self.output viewModelDidDidStartUpdatingDataSource];
}

- (void)addNewPhoto
{
    [self.interactor createRandomPhoto];
}

- (void)userDidSelectCellAtIndex:(NSInteger)index inSection:(NSInteger)section
{
    NVElement *element =
        [self.dataSource elementAtIndex:index inGroup:section];
    nv_safe_block_call(element.attributes.onDidSelect, index, section);
}

#pragma mark - <NVPhotosInteractorOutput>

- (void)interactorDidRecievePhotoType:(NVPhotoTypeViewModel *)viewModel
{
    nv_define_weak_self(weakSelf);
    
    NVGroup *group = [[NVGroup alloc] init];
    NVElement<NVPhotoTypeViewModel *> *header =
        [NVElement elementWithReuseIdentifier:[self.delegate photoTypeHeaderReuseID]
        viewModel:viewModel];
    header.attributes.elementSize = ^CGSize (NVElement<NVPhotoTypeViewModel *> *element) {
        return [weakSelf.delegate photoTypeHeaderSizeForViewModel:element.viewModel];
    };
    
    group.header = header;
    [self.dataSource addGroup:group];
    [self.output viewModelDidUpdateDataSource];
}

- (void)interactorDidRecievePoints:(NSArray<NVPointViewModel *> *)viewModels
{
    for (NVPointViewModel *pointViewModel in viewModels) {
        NVGroup *group = [self groupForPointViewModel:pointViewModel];
        [self.dataSource addGroup:group];
    }
    [self.output viewModelDidUpdateDataSource];
}

- (void)interactorDidCreateRandomPhoto:(NVPhotoViewModel *)photoViewModel
{
    nv_define_weak_self(weakSelf);
    NVElement<NVPhotoViewModel *> *element =
        [NVElement elementWithReuseIdentifier:[self.delegate photoCellReuseID]
        viewModel:photoViewModel];
    element.attributes.onDidSelect = ^(NSInteger index, NSInteger group) {
        [weakSelf deleteViewModel:photoViewModel atIndex:index inGroup:group];
    };
    NSInteger last = [self.dataSource numberOfElementsInGroup:0];
    [self.dataSource insertElement:element atIndex:last inGroup:0];
    [self.output viewModelDidAddPhotoAtIndex:last inSection:0];
}

- (void)interactorDidEndRequesting
{
    [self.output viewModelDidDidEndUpdatingDataSource];
}

#pragma mark - Private

- (NVGroup *)groupForPointViewModel:(NVPointViewModel *)pointViewModel
{
    nv_define_weak_self(weakSelf);
    
    NSArray<NVElement *> *elements =
        [pointViewModel.photoViewModels map:^NVElement *(NVPhotoViewModel *viewModel) {
        NVElement<NVPhotoViewModel *> *element =
            [NVElement elementWithReuseIdentifier:[self.delegate photoCellReuseID]
                viewModel:viewModel];
        element.attributes.onDidSelect = ^(NSInteger index, NSInteger group) {
            [weakSelf deleteViewModel:viewModel atIndex:index inGroup:group];
        };
        return element;
    }];

    NVGroup *group = [[NVGroup alloc] initWithElements:elements];
    NVElement<NVPointViewModel *> *header =
        [NVElement elementWithReuseIdentifier:[self.delegate pointHeaderReuseID]
        viewModel:pointViewModel];
    header.attributes.elementSize = ^CGSize (NVElement<NVPointViewModel *> *element) {
        return [weakSelf.delegate pointHeaderSizeForViewModel:element.viewModel];
    };
    group.header = header;
    return group;
}

- (void)deleteViewModel:(id)viewModel atIndex:(NSInteger)index inGroup:(NSInteger)group
{
    NSLog(@"Did select viewModel: %@ at index %@ in group: %@", viewModel, @(index), @(group));
    [self.dataSource deleteElementAtIndex:index inGroup:group];
    [self.output viewModelDidDeletePhotoAtIndex:index inSection:group];
}

@end
