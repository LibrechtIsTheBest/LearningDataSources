#import <UIKit/UIKit.h>

@interface UIView (NVReusable)

+ (UINib *)nib;
+ (NSString *)reuseIdentifier;
+ (instancetype)view;

@end
