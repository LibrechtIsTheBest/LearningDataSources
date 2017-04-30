#import <Foundation/Foundation.h>
#import "NVPhotosInteractorInput.h"
#import "NVPhotosInteractorOutput.h"


@class NVPointHeaderViewModel, NVPhotoTypeHeaderViewModel, NVPhotoViewModel;

@interface NVPhotosInteractor : NSObject <NVPhotosInteractorInput>

@property (nonatomic, copy) NSString *photoTypeName;

@property (nonatomic, weak) id<NVPhotosInteractorOutput> output;

@end
