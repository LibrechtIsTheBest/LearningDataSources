#import "NVPointHeaderViewModel.h"
#import "NVPoint.h"

@interface NVPointHeaderViewModel ()

@end

@implementation NVPointHeaderViewModel

- (instancetype)initWithPoint:(NVPoint *)point
{
    self = [super init];
    if (self) {
        _name = point.name;
        _address = point.address;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@: name: %@ address: %@", super.description, self.name, self.address];
}

@end
