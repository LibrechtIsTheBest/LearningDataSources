#import <Foundation/Foundation.h>

@class PhotoType, ANIPoint;

@interface Photo : NSObject

+ (instancetype)photoWithImageName:(NSString *)imageName
    comment:(NSString *)comment;

- (instancetype)initWithImageName:(NSString *)imageName
    comment:(NSString *)comment;

@property (copy, nonatomic, readonly) NSString *imageName;
@property (copy, nonatomic, readonly) NSString *comment;
@property (weak, nonatomic) PhotoType *type;
@property (weak, nonatomic) ANIPoint *point;

@end
