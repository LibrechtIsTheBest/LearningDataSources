#import <UIKit/UIColor.h>

@class NVPhotoType;

@interface NVPhotoTypeHeaderViewModel : NSObject

- (instancetype)initWithPhotoType:(NVPhotoType *)photoType;

@property (copy, nonatomic, readonly) NSString *title;
@property (copy, nonatomic, readonly) NSString *subtitle;
@property (nonatomic, readonly) UIColor *backgroundColor;

@end
