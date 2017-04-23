#import "NVPhotosInteractor.h"
#import "NVPoint.h"
#import "NVPhotoType.h"
#import "NVPhoto.h"

@implementation NVPhotosInteractor

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
    
    completion(@[point], type, nil);
}

@end
