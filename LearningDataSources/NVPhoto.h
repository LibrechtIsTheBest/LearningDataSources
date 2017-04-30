#import <Foundation/Foundation.h>

@class NVPhotoType, NVPoint;

@interface NVPhoto : NSObject

+ (instancetype)photoWithImageName:(NSString *)imageName
    comment:(NSString *)comment;

- (instancetype)initWithImageName:(NSString *)imageName
    comment:(NSString *)comment;

@property (nonatomic, copy, readonly) NSString *imageName;
@property (nonatomic, copy, readonly) NSString *comment;
@property (nonatomic, weak) NVPhotoType *type;
@property (nonatomic, weak) NVPoint *point;

@end
