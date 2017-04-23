#import "NVDataSource.h"

@class NVPoint, NVPhotoType;

@interface NVPhotoTypeDataSourceFactory : NSObject

- (NVDataSource *)dataSourceWithPoints:(NSArray <NVPoint *> *)points
    photoType:(NVPhotoType *)photoType;

@end
