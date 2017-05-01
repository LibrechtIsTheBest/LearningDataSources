#pragma once


@protocol NVPhotoCollectionViewModelOutput <NSObject>

- (void)viewModelDidDidStartUpdatingDataSource;
- (void)viewModelDidUpdateDataSource;
- (void)viewModelDidDidEndUpdatingDataSource;

- (void)viewModelDidAddPhotoAtIndex:(NSInteger)index inSection:(NSInteger)section;
- (void)viewModelDidDeletePhotoAtIndex:(NSInteger)index inSection:(NSInteger)section;

@end
