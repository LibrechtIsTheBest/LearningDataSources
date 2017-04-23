#import "NVPhotoTypeDataSourceFactory.h"
// Views
#import "NVPhotoCollectionViewCell.h"
#import "NVPointCollectionHeaderView.h"
#import "NVPhotoTypeCollectionHeaderView.h"
// ViewModels
#import "NVPointHeaderViewModel.h"
#import "NVPhotoTypeHeaderViewModel.h"
#import "NVPhotoViewModel.h"
// Models
#import "NVPoint.h"
#import "NVPhotoType.h"
// Helpers
#import "NSArray+NVHelper.h"

@implementation NVPhotoTypeDataSourceFactory

- (NVDataSource *)dataSourceWithPoints:(NSArray <NVPoint *> *)points
    photoType:(NVPhotoType *)photoType
{
    NVDataSource<NVPhotoViewModel *, id, id> *dataSource = [[NVDataSource alloc] init];
    NVGroupObject *group = [[NVGroupObject alloc] init];
    group.headerObject = [[NVElementObject alloc]
        initWithReuseIdentifier:[NVPhotoTypeCollectionHeaderView reuseIdentifier]
        viewModel:[[NVPhotoTypeHeaderViewModel alloc] initWithPhotoType:photoType]];
    [dataSource addGroupObject:group];

    for (NVPoint *point in points) {
        for (NVPhotoType *type in point.photoTypes) {
            NVGroupObject *group = [self groupObjectForType:type point:point];
            [dataSource addGroupObject:group];
        }
    }
    return dataSource;
}

- (NVGroupObject *)groupObjectForType:(NVPhotoType *)type point:(NVPoint *)point
{
    NSArray<NVElementObject *> *elementObjects = [type.photos map:^NVElementObject *(NVPhoto *obj) {
        NVElementObject<NVPhotoViewModel *> *elementObject =
            [NVElementObject elementObjectWithReuseIdentifier:[NVPhotoCollectionViewCell reuseIdentifier]
                viewModel:[[NVPhotoViewModel alloc] initWithPhoto:obj]];
        return elementObject;
    }];
    NVGroupObject *group = [[NVGroupObject alloc] initWithElementObjects:elementObjects];
    group.headerObject = [[NVElementObject alloc]
        initWithReuseIdentifier:[NVPointCollectionHeaderView reuseIdentifier]
        viewModel:[[NVPointHeaderViewModel alloc] initWithPoint:point]];
    return group;
}

@end
