#import <Foundation/Foundation.h>
#import "NVElementAttributes.h"


@interface NVElement<__covariant ViewModelType> : NSObject

@property (nonatomic, copy, readonly) NSString *reuseIdentifier;
@property (nonatomic, readonly) ViewModelType viewModel;
@property (nonatomic, readonly) NVElementAttributes *attributes;

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier viewModel:(ViewModelType)viewModel;

+ (instancetype)elementWithReuseIdentifier:(NSString *)reuseIdentifier viewModel:(ViewModelType)viewModel;

@end
