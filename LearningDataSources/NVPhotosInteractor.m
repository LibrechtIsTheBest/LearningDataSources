#import "NVPhotosInteractor.h"
#import "NVPhotoViewModel.h"
#import "NVPointViewModel.h"
#import "NVPhotoTypeViewModel.h"
#import "NVPoint.h"
#import "NVPhotoType.h"
#import "NVPhoto.h"
#import "NSArray+NVHelper.h"


@implementation NVPhotosInteractor

#pragma mark - <NVPhotosInteractorInput>

- (void)requestPhotoData
{
    nv_define_weak_self(weakSelf);
    [self getPointsWithCompletion:^(
    NSArray<NVPoint *> *points,
    NVPhotoType *photoType,
    NSError *error) {
        NVPhotoTypeViewModel *viewModel =
            [[NVPhotoTypeViewModel alloc] initWithPhotoType:photoType];
        [weakSelf.output interactorDidRecievePhotoType:viewModel];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            sleep(1);
            dispatch_async(dispatch_get_main_queue(), ^{
                NSArray<NVPointViewModel *> *viewModels = [points map:^id(NVPoint *obj) {
                    return [[NVPointViewModel alloc] initWithPoint:obj];
                }];
                [weakSelf.output interactorDidRecievePoints:viewModels];
                [weakSelf.output interactorDidEndRequesting];
            });
        });
    }];
}

- (void)createRandomPhoto
{
    NVPhoto *photo = [[NVPhoto alloc] initWithImageName:@"photo" comment:@"comment"];
    NVPhotoViewModel *viewModel = [[NVPhotoViewModel alloc] initWithPhoto:photo];
    [self.output interactorDidCreateRandomPhoto:viewModel];
}

#pragma mark - Private

- (void)getPointsWithCompletion:(void(^)(NSArray<NVPoint *> *points, NVPhotoType *photoType, NSError *error))completion
{
    // Mock code
    NVPhoto *photo1 = [[NVPhoto alloc] initWithImageName:@"photo1" comment:@"comment1"];
    NVPhoto *photo2 = [[NVPhoto alloc] initWithImageName:@"photo2" comment:@"comment2"];
    NVPhoto *photo3 = [[NVPhoto alloc] initWithImageName:@"photo3" comment:@"comment3"];
    NVPhoto *photo4 = [[NVPhoto alloc] initWithImageName:@"photo4" comment:@"comment4"];
    NVPhoto *photo5 = [[NVPhoto alloc] initWithImageName:@"photo5" comment:@"comment5"];
    
    NVPhotoType *type1 = [[NVPhotoType alloc] initWithName:@"type1"
        requiredQuantity:5
        photos:@[photo1, photo2, photo3]];
    
    NVPhotoType *type2 = [[NVPhotoType alloc] initWithName:@"type2"
        requiredQuantity:3
        photos:@[photo4, photo5]];
    
    NVPoint *point;
    NVPhotoType *type = nil;
    if ([self.photoTypeName isEqualToString:type1.name]) {
        point = [[NVPoint alloc] initWithName:@"POINT 1"
            address:@"1234567890"
            photoTypes:@[type1]];
        type = type1;
    }
    else if ([self.photoTypeName isEqualToString:type2.name]) {
        point = [[NVPoint alloc] initWithName:@"POINT 1"
            address:@"1234567890"
            photoTypes:@[type2]];
        type = type2;
    }
    else {
        point = [[NVPoint alloc] initWithName:@"POINT 1"
            address:@"1234567890"
            photoTypes:@[type1, type2]];
    }
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1);
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(@[point], type, nil);
        });
    });
}

@end
