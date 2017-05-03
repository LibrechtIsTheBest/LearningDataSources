#import <Foundation/Foundation.h>
#import "NVGroup.h"


@interface NVDataSource<
    __covariant CellViewModelType,
    __covariant HeaderViewModelType,
    __covariant FooterViewModelType> : NSObject

- (NSInteger)numberOfGroups;
- (NSInteger)numberOfElementsInGroup:(NSInteger)groupIndex;
- (NVElement<CellViewModelType> *)elementAtIndex:(NSInteger)index inGroup:(NSInteger)groupIndex;
- (NVElement<HeaderViewModelType> *)headerOfGroup:(NSInteger)groupIndex;
- (NVElement<FooterViewModelType> *)footerOfGroup:(NSInteger)groupIndex;

//Insert
- (void)insertElement:(NVElement<CellViewModelType> *)element
    atIndex:(NSInteger)cellIndex inGroup:(NSInteger)groupIndex;

- (void)addHeader:(NVElement<HeaderViewModelType> *)header
    inGroup:(NSInteger)groupIndex;

- (void)addFooter:(NVElement<FooterViewModelType> *)footer
    inGroup:(NSInteger)groupIndex;

- (void)addGroup:(NVGroup<CellViewModelType, HeaderViewModelType, FooterViewModelType> *)group;

- (void)insertGroup:(NVGroup<CellViewModelType, HeaderViewModelType, FooterViewModelType> *)group atIndex:(NSInteger)groupIndex;

//Delete
- (void)deleteElementAtIndex:(NSInteger)cellIndex inGroup:(NSInteger)groupIndex;

- (void)deleteAllGroups;

//Update
- (void)replaceElementAtIndex:(NSInteger)cellIndex inGroup:(NSInteger)groupIndex
    withElement:(NVElement<CellViewModelType> *)element;

@end
