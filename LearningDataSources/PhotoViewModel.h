#import <Foundation/Foundation.h>

@class Photo;

@interface PhotoViewModel : NSObject

- (instancetype)initWithPhoto:(Photo *)photo;

@property (copy, nonatomic, readonly) NSString *imageName;
@property (copy, nonatomic, readonly) NSString *comment;

@end