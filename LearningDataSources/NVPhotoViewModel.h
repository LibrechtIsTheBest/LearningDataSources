#import <UIKit/UIColor.h>


@class NVPhoto;

@interface NVPhotoViewModel : NSObject

- (instancetype)initWithPhoto:(NVPhoto *)photo;

@property (nonatomic, copy, readonly) NSString *imageName;
@property (nonatomic, copy, readonly) NSString *comment;
@property (nonatomic, readonly) UIColor *backgroundColor;

@end
