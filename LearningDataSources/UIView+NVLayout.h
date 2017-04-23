#import <UIKit/UIKit.h>

@interface UIView (NVLayout)

- (void)stretchView:(UIView *)view;
- (void)stretchView:(UIView *)view withEdgeInsets:(UIEdgeInsets)insets;
- (CGSize)sizeToFitWidth:(CGFloat)width;

@end
