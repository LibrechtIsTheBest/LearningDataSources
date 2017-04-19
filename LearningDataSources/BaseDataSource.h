#import <Foundation/Foundation.h>

@interface BaseDataSource : NSObject

- (NSUInteger)numberOfGroups;
- (NSUInteger)numberOfObjectsInGroup:(NSUInteger)groupIndex;
- (id)objectAtIndex:(NSUInteger)index inGroup:(NSUInteger)groupIndex;
- (id)headerObjectOfGroup:(NSUInteger)groupIndex;
- (id)footerObjectOfGroup:(NSUInteger)groupIndex;

//Delete

//Insert

//Update

@end
