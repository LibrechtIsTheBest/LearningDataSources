#import "BaseDataSource.h"

@class ANIPoint, PhotoType, PhotoTypeHeaderViewModel, PhotoViewModel;

@interface PhotoTypeDataSource : BaseDataSource

- (instancetype)initWithPoints:(NSArray <ANIPoint *> *)points photoType:(PhotoType *)photoType;

@end
