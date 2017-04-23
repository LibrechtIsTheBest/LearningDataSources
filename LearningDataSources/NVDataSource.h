#import <Foundation/Foundation.h>
#import "NVGroupObject.h"

@interface NVDataSource<
    __covariant CellViewModelType,
    __covariant HeaderViewModelType,
    __covariant FooterViewModeltype> : NSObject

- (NSInteger)numberOfGroups;
- (NSInteger)numberOfElementsInGroup:(NSInteger)groupIndex;
- (NVElementObject<CellViewModelType> *)elementObjectAtIndex:(NSInteger)index inGroup:(NSInteger)groupIndex;
- (NVElementObject<HeaderViewModelType> *)headerObjectOfGroup:(NSInteger)groupIndex;
- (NVElementObject<FooterViewModeltype> *)footerObjectOfGroup:(NSInteger)groupIndex;

//Insert
- (void)insertElementObject:(NVElementObject<CellViewModelType> *)elementObject
    atIndex:(NSInteger)cellIndex inGroup:(NSInteger)groupIndex;

- (void)addHeaderObject:(NVElementObject<HeaderViewModelType> *)headerObject
    inGroup:(NSInteger)groupIndex;

- (void)addFooterObject:(NVElementObject<FooterViewModeltype> *)footerObject
    inGroup:(NSInteger)groupIndex;

- (void)addGroupObject:(NVGroupObject<CellViewModelType, HeaderViewModelType, FooterViewModeltype> *)groupObject;

- (void)insertGroupObject:(NVGroupObject<CellViewModelType, HeaderViewModelType, FooterViewModeltype> *)groupObject atIndex:(NSInteger)groupIndex;

//Delete
- (void)deleteElementObjectAtIndex:(NSInteger)cellIndex inGroup:(NSInteger)groupIndex;

//Update
- (void)replaceElementObjectAtIndex:(NSInteger)cellIndex inGroup:(NSInteger)groupIndex
    withElementObject:(NVElementObject<CellViewModelType> *)elementObject;

@end
