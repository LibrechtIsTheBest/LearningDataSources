#import "NSArray+NVHelper.h"

@implementation NSArray (NVHelper)

- (NSArray *)map:(id (^)(id))transform
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];
    for (id obj in self) {
        [array addObject:transform(obj)];
    }
    return array.copy;
}

@end
