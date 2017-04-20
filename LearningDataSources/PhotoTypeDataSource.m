#import "PhotoTypeDataSource.h"
#import "BaseDataSource+Protected.h"
#import "NSArray+Helper.h"

#import "ANIPoint.h"
#import "PhotoType.h"
#import "PhotoTypeHeaderViewModel.h"
#import "PointHeaderViewModel.h"
#import "PhotoViewModel.h"


@implementation PhotoTypeDataSource

- (instancetype)initWithPoints:(NSArray <ANIPoint *> *)points photoType:(PhotoType *)photoType
{
    self = [super init];
    if (self) {
        [self initializeWithPoints:points photoType:photoType];
    }
    return self;
}

- (void)initializeWithPoints:(NSArray <ANIPoint *> *)points photoType:(PhotoType *)photoType
{
    GroupObject *group0 = [[GroupObject alloc] init];
    group0.headerObject = [[PhotoTypeHeaderViewModel alloc] initWithPhotoType:photoType];
    [self.groups addObject:group0];

    for (ANIPoint *point in points) {
        for (PhotoType *type in point.photoTypes) {
            if ([type.name isEqualToString:photoType.name]) {
                GroupObject *group = [[GroupObject alloc] initWithObjects:[type.photos map:^id(Photo *obj) {
                    return [[PhotoViewModel alloc] initWithPhoto:obj];
                }]];
                group.headerObject = [[PointHeaderViewModel alloc] initWithPoint:point];
                [self.groups addObject:group];
            }
        }
    }
}

@end
