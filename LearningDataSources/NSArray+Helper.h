#import <Foundation/Foundation.h>

@interface NSArray <__covariant ObjectType> (Helper)

- (instancetype)map:(ObjectType(^)(ObjectType *obj))transform;

@end