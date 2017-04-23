#import <Foundation/Foundation.h>

@class NVPoint, NVPhotoType;

@interface NVPhotosInteractor : NSObject <NSObject>

@property (copy, nonatomic) NSString *photoTypeName;

- (void)getPointsWithCompletion:(void(^)(NSArray<NVPoint *> *points, NVPhotoType *photoType, NSError *error))completion;

@end
