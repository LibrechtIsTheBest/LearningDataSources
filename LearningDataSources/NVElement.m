#import "NVElement.h"
#import "NVElementAttributes.h"


@implementation NVElement

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier viewModel:(id)viewModel
{
    self = [super init];
    if (self) {
        _reuseIdentifier = reuseIdentifier.copy;
        _viewModel = viewModel;
        _attributes = [[NVElementAttributes alloc] init];
    }

    return self;
}

+ (instancetype)elementWithReuseIdentifier:(NSString *)reuseIdentifier viewModel:(id)viewModel
{
    return [[self alloc] initWithReuseIdentifier:reuseIdentifier viewModel:viewModel];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@: reuseID: %@ viewModel: %@",
            super.description, self.reuseIdentifier, self.viewModel];
}

@end
