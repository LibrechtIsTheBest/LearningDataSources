#import "NVDataSource.h"

@interface NVDataSource ()

@property (nonatomic) NSMutableArray <NVGroupObject *> *groups;

@end

@implementation NVDataSource

- (instancetype)init
{
    self = [super init];
    if (self) {
        _groups = [NSMutableArray array];
    }

    return self;
}

#pragma mark - Public

- (NSInteger)numberOfGroups
{
    return self.groups.count;
}

- (NSInteger)numberOfElementsInGroup:(NSInteger)groupIndex
{
    return [self groupObjectAtIndex:groupIndex].numberOfObjects;
}

- (NVElementObject *)elementObjectAtIndex:(NSInteger)index inGroup:(NSInteger)groupIndex
{
    return [[self groupObjectAtIndex:groupIndex] elementAtIndex:index];
}

- (NVElementObject *)headerObjectOfGroup:(NSInteger)groupIndex
{
    return [self groupObjectAtIndex:groupIndex].headerObject;
}

- (NVElementObject *)footerObjectOfGroup:(NSInteger)groupIndex
{
    return [self groupObjectAtIndex:groupIndex].footerObject;
}

- (void)insertElementObject:(NVElementObject *)elementObject atIndex:(NSInteger)cellIndex inGroup:(NSInteger)groupIndex
{
    NVGroupObject *group = [self groupObjectAtIndex:groupIndex];
    [group insertElement:elementObject atIndex:cellIndex];
}

- (void)addHeaderObject:(NVElementObject *)headerObject inGroup:(NSInteger)groupIndex
{
    [self groupObjectAtIndex:groupIndex].headerObject = headerObject;
}

- (void)addFooterObject:(NVElementObject *)footerObject inGroup:(NSInteger)groupIndex
{
    [self groupObjectAtIndex:groupIndex].footerObject = footerObject;
}

- (void)addGroupObject:(NVGroupObject *)groupObject
{
    NSUInteger index = [self numberOfGroups];
    [self insertGroupObject:groupObject atIndex:index];
}

- (void)insertGroupObject:(NVGroupObject *)groupObject atIndex:(NSInteger)groupIndex
{
    self.groups[groupIndex] = groupObject;
}

- (void)deleteElementObjectAtIndex:(NSInteger)cellIndex inGroup:(NSInteger)groupIndex
{
    NVGroupObject *group = [self groupObjectAtIndex:groupIndex];
    [group removeElementAtIndex:cellIndex];
}

- (void)replaceElementObjectAtIndex:(NSInteger)cellIndex inGroup:(NSInteger)groupIndex withElementObject:(NVElementObject *)elementObject
{
    NVGroupObject *group = [self groupObjectAtIndex:groupIndex];
    [group replaceElementAtIndex:cellIndex withElement:elementObject];
}

#pragma mark - Private

- (NVGroupObject *)groupObjectAtIndex:(NSUInteger)groupIndex
{
    return self.groups[groupIndex];
}

@end
