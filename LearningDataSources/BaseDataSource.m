#import "BaseDataSource.h"
#import "BaseDataSource+Protected.h"
#import "GroupObject.h"

@interface BaseDataSource ()

@property (nonatomic) NSMutableArray <GroupObject *> *groups;

@end

@implementation BaseDataSource

- (instancetype)init
{
    self = [super init];
    if (self) {
        _groups = [NSMutableArray array];
    }
    return self;
}

- (NSUInteger)numberOfGroups
{
    return self.groups.count;
}

- (NSUInteger)numberOfObjectsInGroup:(NSUInteger)groupIndex
{
    return self.groups[groupIndex].numberOfObjects;
}

- (id)headerObjectOfGroup:(NSUInteger)groupIndex
{
    return self.groups[groupIndex].headerObject;
}

- (id)objectAtIndex:(NSUInteger)index inGroup:(NSUInteger)groupIndex
{
    return [self.groups[groupIndex] objectAtIndex:index];
}

- (id)footerObjectOfGroup:(NSUInteger)groupIndex
{
    return self.groups[groupIndex].footerObject;
}

@end
