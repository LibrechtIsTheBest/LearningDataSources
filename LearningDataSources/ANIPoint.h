#import <Foundation/Foundation.h>

@class PhotoType;

@interface ANIPoint : NSObject

@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *address;
@property (copy, nonatomic) NSArray <PhotoType *> *photoTypes;

- (instancetype)initWithName:(NSString *)name
    address:(NSString *)address
    photoTypes:(NSArray<PhotoType *> *)photoTypes;

+ (instancetype)pointWithName:(NSString *)name
    address:(NSString *)address
    photoTypes:(NSArray<PhotoType *> *)photoTypes;


@end
