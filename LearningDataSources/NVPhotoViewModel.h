#import <UIKit/UIColor.h>

@class NVPhoto;

@interface NVPhotoViewModel : NSObject

- (instancetype)initWithPhoto:(NVPhoto *)photo;

@property (copy, nonatomic, readonly) NSString *imageName;
@property (copy, nonatomic, readonly) NSString *comment;
@property (nonatomic, readonly) UIColor *backgroundColor;

@end
