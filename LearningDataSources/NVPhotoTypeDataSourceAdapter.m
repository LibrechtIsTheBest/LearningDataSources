#import "NVPhotoTypeDataSourceAdapter.h"
// DataSource
#import "NVDataSource.h"
// Cells
#import "NVViewModelConfigurable.h"

@implementation NVPhotoTypeDataSourceAdapter

#pragma mark - <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.adaptee numberOfGroups];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return [self.adaptee numberOfElementsInGroup:section];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
    cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NVElementObject *element = [self.adaptee elementObjectAtIndex:indexPath.item
        inGroup:indexPath.section];
    UICollectionViewCell <NVViewModelConfigurable> *cell =
        [collectionView dequeueReusableCellWithReuseIdentifier: element.reuseIdentifier
        forIndexPath:indexPath];
    [cell configureWithViewModel:element.viewModel];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
    viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    NVElementObject *supplementaryElement;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        supplementaryElement = [self.adaptee headerObjectOfGroup:indexPath.section];
    }
    else {
        supplementaryElement = [self.adaptee footerObjectOfGroup:indexPath.section];
    }
    UICollectionReusableView <NVViewModelConfigurable> *headerView =
        [collectionView dequeueReusableSupplementaryViewOfKind:kind
            withReuseIdentifier:supplementaryElement.reuseIdentifier forIndexPath:indexPath];
    [headerView configureWithViewModel:supplementaryElement.viewModel];
    return headerView;
}

@end
