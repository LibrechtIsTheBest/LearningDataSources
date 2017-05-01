#import <Foundation/Foundation.h>
#import <CoreGraphics/CGGeometry.h>


@class NVElement;

typedef CGSize(^NVElementAttributeSizeBlock)(NVElement *element);


@interface NVElementAttributes : NSObject

@property (nonatomic, getter=isSelected) BOOL selected;
@property (nonatomic, copy) NVElementAttributeSizeBlock elementSize;
@property (nonatomic, copy) void(^onDidSelect)(NSInteger index, NSInteger group);

@end
