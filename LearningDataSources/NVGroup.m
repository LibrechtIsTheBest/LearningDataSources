#import "NVGroup.h"


@interface NVGroup ()

@property (nonatomic) NSMutableArray<NVElement *> *elements;

@end

@implementation NVGroup

#pragma mark - Initialization

- (instancetype)init
{
    return [self initWithElements:@[]];
}

- (instancetype)initWithElements:(NSArray<NVElement *> *)elements
{
    self = [super init];
    if (self) {
        _elements = elements.mutableCopy;
    }
    return self;
}

#pragma mark - Public

- (NSInteger)numberOfObjects
{
    return self.elements.count;
}

- (NVElement *)elementAtIndex:(NSInteger)index
{
    return self.elements[index];
}

- (void)addElement:(NVElement *)element
{
    [self.elements addObject:element];
}

- (void)insertElement:(NVElement *)element atIndex:(NSInteger)index
{
    [self.elements insertObject:element atIndex:index];
}

- (void)removeElementAtIndex:(NSInteger)index
{
    [self.elements removeObjectAtIndex:index];
}

- (void)replaceElementAtIndex:(NSInteger)index withElement:(NVElement *)element
{
    [self.elements replaceObjectAtIndex:index withObject:element];
}

//- (NSInteger)indexOfObject:(id)object
//{
//    if (self.objectsEqualityTest) {
//        return [self.elements indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
//            return self.objectsEqualityTest(object, obj);
//        }];
//    }
//    return [self.elements indexOfObject:object];
//}

@end
