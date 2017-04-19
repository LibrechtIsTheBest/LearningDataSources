#import <Foundation/Foundation.h>

@interface GroupObject : NSObject

- (instancetype)init;
- (instancetype)initWithObjects:(NSArray *)objects;

@property (nonatomic) id headerObject;
@property (nonatomic) id footerObject;
@property (nonatomic, readonly) NSUInteger numberOfObjects;

@property (copy, nonatomic) BOOL(^objectEqualityTest)(id object1, id object2);

- (id)objectAtIndex:(NSUInteger)index;

- (void)addObject:(id)object;
- (void)insertObject:(id)object atIndex:(NSUInteger)index;

- (void)removeObjectAtIndex:(NSUInteger)index;

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)object;

@end
