#pragma once


@protocol NVPhotoCollectionViewModelInput <NSObject>

- (void)updateData;
- (void)addNewPhoto;
- (void)userDidSelectCellAtIndex:(NSInteger)index inSection:(NSInteger)section;

@end
