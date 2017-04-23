#import "NVGroupObject.h"
#import "NVElementObject.h"

@interface NVGroupObject ()

@property (nonatomic) NSMutableArray<NVElementObject *> *elementObjects;

@end

@implementation NVGroupObject

#pragma mark - Initialization

- (instancetype)init
{
    return [self initWithElementObjects:@[]];
}

- (instancetype)initWithElementObjects:(NSArray<NVElementObject *> *)elementObjects
{
    self = [super init];
    if (self) {
        _elementObjects = elementObjects.mutableCopy;
    }
    return self;
}

#pragma mark - Public

- (NSInteger)numberOfObjects
{
    return self.elementObjects.count;
}

- (NVElementObject *)elementAtIndex:(NSInteger)index
{
    return self.elementObjects[index];
}

- (void)addElement:(NVElementObject *)element
{
    [self.elementObjects addObject:element];
}

- (void)insertElement:(NVElementObject *)element atIndex:(NSInteger)index
{
    [self.elementObjects insertObject:element atIndex:index];
}

- (void)removeElementAtIndex:(NSInteger)index
{
    [self.elementObjects removeObjectAtIndex:index];
}

- (void)replaceElementAtIndex:(NSInteger)index withElement:(NVElementObject *)element
{
    [self.elementObjects replaceObjectAtIndex:index withObject:element];
}

- (NSInteger)indexOfObject:(id)object
{
    if (self.objectsEqualityTest) {
        return [self.elementObjects indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
            return self.objectsEqualityTest(object, obj);
        }];
    }
    return [self.elementObjects indexOfObject:object];
}

@end
