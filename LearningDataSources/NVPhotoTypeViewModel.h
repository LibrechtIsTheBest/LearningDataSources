#import <UIKit/UIColor.h>


@class NVPhotoType;

@interface NVPhotoTypeViewModel : NSObject

- (instancetype)initWithPhotoType:(NVPhotoType *)photoType;

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *subtitle;
@property (nonatomic, readonly) UIColor *backgroundColor;

@end
