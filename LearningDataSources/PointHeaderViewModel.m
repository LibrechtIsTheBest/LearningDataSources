#import "PointHeaderViewModel.h"
#import "ANIPoint.h"

@interface PointHeaderViewModel ()

//@property

@end

@implementation PointHeaderViewModel

- (instancetype)initWithPoint:(ANIPoint *)point
{
    self = [super init];
    if (self) {
        _name = point.name;
        _address = point.address;
    }
    return self;
}

@end