#import <Foundation/Foundation.h>

@class Photo;

@interface PhotoType : NSObject

- (instancetype)initWithName:(NSString *)name
    requiredQuantity:(NSUInteger)requiredQuantity
    photos:(NSArray<Photo *> *)photos;

@property (copy, nonatomic) NSString *name;
@property (nonatomic) NSUInteger requiredQuantity;
@property (nonatomic) NSArray <Photo *> *photos;

@end
