#import "NSArray+NVHelper.h"


@implementation NSArray (NVHelper)

- (NSArray *)map:(id (^)(id))transform
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];
    for (id obj in self) {
        [array addObject:transform(obj)];
    }
    return [array copy];
}

- (NSArray *)flatMap:(NSArray *(^)(id))transform
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];
    for (id obj in self) {
        NSArray *subarray = transform(obj);
        for (id subobj in subarray) {
            [array addObject:subobj];
        }
    }
    return [array copy];
}

@end
