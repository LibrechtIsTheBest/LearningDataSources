#import <Foundation/Foundation.h>
#import "NVElement.h"


@interface NVGroup<
    __covariant CellViewModelType,
    __covariant HeaderViewModelType,
    __covariant FooterViewModelType> : NSObject

- (instancetype)init;
- (instancetype)initWithElements:(NSArray<NVElement<CellViewModelType> *> *)elements;

@property (nonatomic) NVElement<HeaderViewModelType> *header;
@property (nonatomic) NVElement<FooterViewModelType> *footer;
@property (nonatomic, readonly) NSInteger numberOfObjects;

//@property (nonatomic, copy) BOOL(^objectsEqualityTest)
//    (NVElement<CellViewModelType> *object1, NVElement<CellViewModelType> *object2);

- (NVElement<CellViewModelType> *)elementAtIndex:(NSInteger)index;
- (void)addElement:(NVElement<CellViewModelType> *)element;
- (void)insertElement:(NVElement<CellViewModelType> *)element atIndex:(NSInteger)index;
- (void)removeElementAtIndex:(NSInteger)index;
- (void)replaceElementAtIndex:(NSInteger)index withElement:(NVElement<CellViewModelType> *)element;

@end
