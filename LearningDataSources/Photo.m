#import "Photo.h"

@implementation Photo

+ (instancetype)photoWithImageName:(NSString *)imageName
    comment:(NSString *)comment
    type:(PhotoType *)type
    point:(ANIPoint *)point
{
    return [[self alloc] initWithImageName:imageName comment:comment type:type point:point];
}

- (instancetype)initWithImageName:(NSString *)imageName
    comment:(NSString *)comment
    type:(PhotoType *)type
    point:(ANIPoint *)point
{
    self = [super init];
    if (self) {
        _imageName = [imageName copy];
        _comment = [comment copy];
        _type = type;
        _point = point;
    }
    return self;
}

@end
