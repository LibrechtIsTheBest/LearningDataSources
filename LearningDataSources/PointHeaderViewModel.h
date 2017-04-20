#import <Foundation/Foundation.h>

@class ANIPoint;

@interface PointHeaderViewModel : NSObject

- (instancetype)initWithPoint:(ANIPoint *)point;

@property (copy, nonatomic, readonly) NSString *name;
@property (copy, nonatomic, readonly) NSString *address;

@end