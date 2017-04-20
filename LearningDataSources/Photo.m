#import "Photo.h"

@implementation Photo

+ (instancetype)photoWithImageName:(NSString *)imageName
    comment:(NSString *)comment
{
    return [[self alloc] initWithImageName:imageName comment:comment];
}

- (instancetype)initWithImageName:(NSString *)imageName
    comment:(NSString *)comment
{
    self = [super init];
    if (self) {
        _imageName = [imageName copy];
        _comment = [comment copy];
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@: image: %@ comment: %@", super.description, self.imageName, self.comment];
}

@end
