#import "GroupObject.h"

@interface GroupObject ()

@property (nonatomic) NSMutableArray *objects;

@end

@implementation GroupObject

#pragma mark - Initialization

- (instancetype)init
{
    return [self initWithObjects:@[]];
}

- (instancetype)initWithObjects:(NSArray *)objects
{
    self = [super init];
    if (self) {
        _objects = objects.mutableCopy;
    }
    return self;
}

#pragma mark - Public

- (NSUInteger)numberOfObjects
{
    return self.objects.count;
}

- (id)objectAtIndex:(NSUInteger)index
{
    return self.objects[index];
}

- (void)addObject:(id)object
{
    [self.objects addObject:object];
}

- (void)insertObject:(id)object atIndex:(NSUInteger)index
{
    [self.objects insertObject:object atIndex:index];
}

- (void)removeObjectAtIndex:(NSUInteger)index
{
    [self.objects removeObjectAtIndex:index];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)object
{
    [self.objects replaceObjectAtIndex:index withObject:object];
}

- (NSUInteger)indexOfObject:(id)object
{
    if (self.objectEqualityTest) {
        return [self.objects indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
            return self.objectEqualityTest(object, obj);
        }];
    }
    return [self.objects indexOfObject:object];
}

@end
