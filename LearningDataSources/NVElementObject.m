#import "NVElementObject.h"

@implementation NVElementObject

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier viewModel:(id)viewModel
{
    self = [super init];
    if (self) {
        _reuseIdentifier = reuseIdentifier.copy;
        _viewModel = viewModel;
    }

    return self;
}

+ (instancetype)elementObjectWithReuseIdentifier:(NSString *)reuseIdentifier viewModel:(id)viewModel
{
    return [[self alloc] initWithReuseIdentifier:reuseIdentifier viewModel:viewModel];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@: reuseID: %@ viewModel: %@",
            super.description, self.reuseIdentifier, self.viewModel];
}

@end
