#import <UIKit/UIColor.h>

@class PhotoType;

@interface PhotoTypeHeaderViewModel : NSObject

- (instancetype)initWithPhotoType:(PhotoType *)photoType;

@property (copy, nonatomic, readonly) NSString *title;
@property (copy, nonatomic, readonly) NSString *subtitle;
@property (nonatomic, readonly) UIColor *backgroundColor;

@end
