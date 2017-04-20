#import <Foundation/Foundation.h>

@interface NSArray <__covariant ObjectType> (Helper)

- (instancetype)map:(id(^)(ObjectType obj))transform;

@end
