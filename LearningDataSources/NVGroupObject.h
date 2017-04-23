#import <Foundation/Foundation.h>
#import "NVElementObject.h"

@interface NVGroupObject<
    __covariant CellViewModelType,
    __covariant HeaderViewModelType,
    __covariant FooterViewModeltype> : NSObject

- (instancetype)init;
- (instancetype)initWithElementObjects:(NSArray<NVElementObject<CellViewModelType> *> *)elementObjects;

@property (nonatomic) NVElementObject<HeaderViewModelType> *headerObject;
@property (nonatomic) NVElementObject<FooterViewModeltype> *footerObject;
@property (nonatomic, readonly) NSInteger numberOfObjects;

@property (copy, nonatomic) BOOL(^objectsEqualityTest)
    (NVElementObject<CellViewModelType> *object1, NVElementObject<CellViewModelType> *object2);

- (NVElementObject<CellViewModelType> *)elementAtIndex:(NSInteger)index;
- (void)addElement:(NVElementObject<CellViewModelType> *)element;
- (void)insertElement:(NVElementObject<CellViewModelType> *)element atIndex:(NSInteger)index;
- (void)removeElementAtIndex:(NSInteger)index;
- (void)replaceElementAtIndex:(NSInteger)index withElement:(NVElementObject<CellViewModelType> *)element;

@end
