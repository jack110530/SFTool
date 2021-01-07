//
//  SFPhotoPicker.m
//  DingDongApp
//
//  Created by 黄山锋 on 2020/12/4.
//

#import "SFPhotoPicker.h"
#import <SFMacro/SFFunc.h>
#import <YYCategories/YYCategories.h>

@interface SFPhotoPicker ()
<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (nonatomic, strong) UIImagePickerController *picker;
@end

@implementation SFPhotoPicker
- (void)dealloc {
    NSLog(@"%s", __func__);
}
#pragma mark - 单例
SFSingleton_m(Picker)


#pragma mark - show
+ (void)showIn:(nonnull UIViewController *)vc title:(nullable NSString *)title msg:(nullable NSString *)msg {
    [[SFPhotoPicker sharedPicker] showIn:vc title:title msg:msg];
}
- (void)showIn:(nonnull UIViewController *)vc title:(nullable NSString *)title msg:(nullable NSString *)msg {
    SFWeak(vc)
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *album = [UIAlertAction actionWithTitle:SFLocalizedString(@"相册") style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        SFStrong(vc)
        self.picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        [vc presentViewController:self.picker animated:YES completion:nil];
    }];
    UIAlertAction *camera = [UIAlertAction actionWithTitle:SFLocalizedString(@"相机") style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        SFStrong(vc)
        self.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [vc presentViewController:self.picker animated:YES completion:nil];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:SFLocalizedString(@"取消") style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertC addAction:album];
    [alertC addAction:camera];
    [alertC addAction:cancel];
    [vc presentViewController:alertC animated:YES completion:nil];
}

#pragma mark - delegate
// MARK: UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    UIImage *image = info[UIImagePickerControllerEditedImage];
    if (self.clickSureBlock) {
        self.clickSureBlock(image);
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    if (self.clickCancelBlock) {
        self.clickCancelBlock();
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - getter
SFLazyLoad(UIImagePickerController, picker, {
    _picker = [[UIImagePickerController alloc]init];
    _picker.delegate = self;
    _picker.allowsEditing = YES;
})
@end
