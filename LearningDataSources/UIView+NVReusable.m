#import "UIView+NVReusable.h"

@implementation UIView (NVReusable)

+ (UINib *)nib
{
    return [UINib nibWithNibName:[self reuseIdentifier] bundle:nil];
}

+ (NSString *)reuseIdentifier
{
    return NSStringFromClass(self);
}

+ (instancetype)view
{
    return [[self nib] instantiateWithOwner:nil options:nil].firstObject;
}

@end
