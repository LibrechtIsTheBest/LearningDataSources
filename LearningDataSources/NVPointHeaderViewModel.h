#import <Foundation/Foundation.h>

@class NVPoint;

@interface NVPointHeaderViewModel : NSObject

- (instancetype)initWithPoint:(NVPoint *)point;

@property (copy, nonatomic, readonly) NSString *name;
@property (copy, nonatomic, readonly) NSString *address;

@end