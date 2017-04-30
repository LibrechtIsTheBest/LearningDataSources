#import <Foundation/Foundation.h>
#import <CoreGraphics/CGGeometry.h>


@class NVElement;

@interface NVElementAttributes : NSObject

@property (nonatomic, getter=isSelected) BOOL selected;
@property (nonatomic, copy) CGSize(^elementSize)(NVElement *element);
@property (nonatomic, copy) void(^onDidSelect)(NSIndexPath *indexPath);

@end
