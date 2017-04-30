#import <Foundation/Foundation.h>


@class NVPoint;
@class NVPhotoViewModel;

@interface NVPointViewModel : NSObject

- (instancetype)initWithPoint:(NVPoint *)point;

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *address;
@property (nonatomic, copy, readonly) NSArray <NVPhotoViewModel *> *photoViewModels;

@end
