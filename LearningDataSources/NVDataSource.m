#import "NVDataSource.h"


@interface NVDataSource ()

@property (nonatomic) NSMutableArray <NVGroup *> *groups;

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
    return [self groupAtIndex:groupIndex].numberOfObjects;
}

- (NVElement *)elementAtIndex:(NSInteger)index inGroup:(NSInteger)groupIndex
{
    return [[self groupAtIndex:groupIndex] elementAtIndex:index];
}

- (NVElement *)headerOfGroup:(NSInteger)groupIndex
{
    return [self groupAtIndex:groupIndex].header;
}

- (NVElement *)footerOfGroup:(NSInteger)groupIndex
{
    return [self groupAtIndex:groupIndex].footer;
}

- (void)insertElement:(NVElement *)element atIndex:(NSInteger)cellIndex inGroup:(NSInteger)groupIndex
{
    NVGroup *group = [self groupAtIndex:groupIndex];
    [group insertElement:element atIndex:cellIndex];
}

- (void)addHeader:(NVElement *)header inGroup:(NSInteger)groupIndex
{
    [self groupAtIndex:groupIndex].header = header;
}

- (void)addFooter:(NVElement *)footer inGroup:(NSInteger)groupIndex
{
    [self groupAtIndex:groupIndex].footer = footer;
}

- (void)addGroup:(NVGroup *)group
{
    NSUInteger index = [self numberOfGroups];
    [self insertGroup:group atIndex:index];
}

- (void)insertGroup:(NVGroup *)group atIndex:(NSInteger)groupIndex
{
    self.groups[groupIndex] = group;
}

- (void)deleteElementAtIndex:(NSInteger)cellIndex inGroup:(NSInteger)groupIndex
{
    NVGroup *group = [self groupAtIndex:groupIndex];
    [group removeElementAtIndex:cellIndex];
}

- (void)deleteAllGroups
{
    [self.groups removeAllObjects];
}

- (void)replaceElementAtIndex:(NSInteger)cellIndex inGroup:(NSInteger)groupIndex withElement:(NVElement *)element
{
    NVGroup *group = [self groupAtIndex:groupIndex];
    [group replaceElementAtIndex:cellIndex withElement:element];
}

#pragma mark - Private

- (NVGroup *)groupAtIndex:(NSUInteger)groupIndex
{
    return self.groups[groupIndex];
}

@end
