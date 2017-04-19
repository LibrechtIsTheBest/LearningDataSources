#import <Foundation/Foundation.h>

@class PhotoType, ANIPoint;

@interface Photo : NSObject

+ (instancetype)photoWithImageName:(NSString *)imageName
    comment:(NSString *)comment
    type:(PhotoType *)type
    point:(ANIPoint *)point;

- (instancetype)initWithImageName:(NSString *)imageName
    comment:(NSString *)comment
    type:(PhotoType *)type
    point:(ANIPoint *)point;

@property (copy, nonatomic, readonly) NSString *imageName;
@property (copy, nonatomic, readonly) NSString *comment;
@property (weak, nonatomic, readonly) PhotoType *type;
@property (nonatomic, readonly) ANIPoint *point;

@end
