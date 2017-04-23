#import <Foundation/Foundation.h>

@interface NVElementObject<__covariant ViewModelType> : NSObject

@property (copy, nonatomic, readonly) NSString *reuseIdentifier;
@property (nonatomic, readonly) ViewModelType viewModel;
@property (nonatomic, getter=isSelected) BOOL selected;

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier viewModel:(ViewModelType)viewModel;

+ (instancetype)elementObjectWithReuseIdentifier:(NSString *)reuseIdentifier viewModel:(ViewModelType)viewModel;

@end
