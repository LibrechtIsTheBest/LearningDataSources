#import <Foundation/Foundation.h>


@interface NSArray <__covariant ObjectType> (NVHelper)

- (NSArray *)map:(id(^)(ObjectType obj))transform;
- (NSArray *)flatMap:(NSArray *(^)(ObjectType obj))transform;

@end
