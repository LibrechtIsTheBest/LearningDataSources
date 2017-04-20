#import <Foundation/Foundation.h>

@interface BaseDataSource <__covariant ObjType> : NSObject

- (NSUInteger)numberOfGroups;
- (NSUInteger)numberOfObjectsInGroup:(NSUInteger)groupIndex;
- (ObjType)objectAtIndex:(NSUInteger)index inGroup:(NSUInteger)groupIndex;
- (id)headerObjectOfGroup:(NSUInteger)groupIndex;
- (id)footerObjectOfGroup:(NSUInteger)groupIndex;

//Delete

//Insert

//Update

@end
