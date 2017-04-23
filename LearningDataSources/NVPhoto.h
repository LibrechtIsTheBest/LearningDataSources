#import <Foundation/Foundation.h>

@class NVPhotoType, NVPoint;

@interface NVPhoto : NSObject

+ (instancetype)photoWithImageName:(NSString *)imageName
    comment:(NSString *)comment;

- (instancetype)initWithImageName:(NSString *)imageName
    comment:(NSString *)comment;

@property (copy, nonatomic, readonly) NSString *imageName;
@property (copy, nonatomic, readonly) NSString *comment;
@property (weak, nonatomic) NVPhotoType *type;
@property (weak, nonatomic) NVPoint *point;

@end
