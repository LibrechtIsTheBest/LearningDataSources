#import <Foundation/Foundation.h>
#import "NVPhotoCollectionViewModelInput.h"
#import "NVPhotoCollectionViewModelOutput.h"
#import <CoreGraphics/CGGeometry.h>
#import "NVPhotoTypeViewModel.h"
#import "NVPointViewModel.h"


@protocol NVPhotoCollectionViewModelDelegate <NSObject>

- (NSString *)photoTypeHeaderReuseID;
- (NSString *)pointHeaderReuseID;
- (NSString *)photoCellReuseID;

- (CGSize)photoTypeHeaderSizeForViewModel:(NVPhotoTypeViewModel *)viewModel;
- (CGSize)pointHeaderSizeForViewModel:(NVPointViewModel *)viewModel;

@end


@class NVDataSource;

@interface NVPhotoCollectionViewModel : NSObject <NVPhotoCollectionViewModelInput>

@property (nonatomic, weak) id<NVPhotoCollectionViewModelOutput> output;
@property (nonatomic, weak) id<NVPhotoCollectionViewModelDelegate> delegate;

@property (nonatomic, readonly) NVDataSource *dataSource;

- (CGSize)sizeForHeaderInSection:(NSInteger)section; // WTF??? :)

@end
