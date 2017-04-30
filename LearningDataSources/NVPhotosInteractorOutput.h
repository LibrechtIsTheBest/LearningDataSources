#pragma once


@class NVPhotoViewModel, NVPhotoTypeViewModel, NVPointViewModel;

@protocol NVPhotosInteractorOutput <NSObject>

- (void)interactorDidRecievePhotoType:(NVPhotoTypeViewModel *)viewModel;

- (void)interactorDidRecievePoints:(NSArray<NVPointViewModel *> *)viewModels;

- (void)interactorDidCreateRandomPhoto:(NVPhotoViewModel *)photoViewModel;

- (void)interactorDidEndRequesting;

@end
