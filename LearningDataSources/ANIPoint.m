#import "ANIPoint.h"
#import "PhotoType.h"
#import "Photo.h"

@implementation ANIPoint

- (instancetype)initWithName:(NSString *)name
    address:(NSString *)address
    photoTypes:(NSArray<PhotoType *> *)photoTypes
{
    self = [super init];
    if (self) {
        _name = [name copy];
        _address = [address copy];
        _photoTypes = [photoTypes copy];
        for (PhotoType *photoType in photoTypes) {
            for (Photo *photo in photoType.photos) {
                photo.point = self;
            }
        }
    }

    return self;
}

+ (instancetype)pointWithName:(NSString *)name
    address:(NSString *)address
    photoTypes:(NSArray<PhotoType *> *)photoTypes
{
    return [[self alloc] initWithName:name address:nil photoTypes:photoTypes];
}

@end
