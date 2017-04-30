#import <UIKit/UIKit.h>


@class NVDataSource;

@interface NVPhotoTypeDataSourceAdapter : NSObject <UICollectionViewDataSource>

@property (nonatomic) NVDataSource *adaptee;

@end
