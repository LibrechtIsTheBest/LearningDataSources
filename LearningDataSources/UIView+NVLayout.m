#import "UIView+NVLayout.h"

@implementation UIView (NVLayout)

- (void)stretchView:(UIView *)view withEdgeInsets:(UIEdgeInsets)insets
{
    NSString *horizontal =
        [NSString stringWithFormat:@"H:|-(%@)-[view]-(%@)-|", @(insets.left), @(insets.right)];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:horizontal
        options:0 metrics:nil views:@{@"view": view}]];
    NSString *vertical =
        [NSString stringWithFormat:@"V:|-(%@)-[view]-(%@)-|", @(insets.top), @(insets.bottom)];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vertical
        options:0 metrics:nil views:@{@"view": view}]];
}

- (void)stretchView:(UIView *)view
{
    [self stretchView:view withEdgeInsets:UIEdgeInsetsZero];
}

- (void)resizeSelfToFitWidth:(CGFloat)width
{
    CGPoint origin = self.frame.origin;
    CGSize size = [self sizeToFitWidth:width];
    self.frame = CGRectMake(origin.x, origin.y, size.width, size.height);
}

- (CGSize)sizeToFitWidth:(CGFloat)width
{
    return [self systemLayoutSizeFittingSize:CGSizeMake(width, 0)
        withHorizontalFittingPriority:UILayoutPriorityRequired
        verticalFittingPriority:UILayoutPriorityFittingSizeLevel];
}

@end
