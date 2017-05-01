#import <UIKit/UIKit.h>


@class NVDataSource;

@interface NVCollectionViewDataSourceAdapter : NSObject <UICollectionViewDataSource>

@property (nonatomic) NVDataSource *adaptee;

@end
