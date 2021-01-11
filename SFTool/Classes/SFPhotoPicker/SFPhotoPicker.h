//
//  SFPhotoPicker.h
//  DingDongApp
//
//  Created by 黄山锋 on 2020/12/4.
//

#import <Foundation/Foundation.h>
#import <SFMacro/SFFunc.h>

NS_ASSUME_NONNULL_BEGIN

@interface SFPhotoPicker : NSObject

@property (nonatomic,strong,readonly) UIImagePickerController *picker;
@property (nonatomic,copy) void (^clickSureBlock)(UIImage *image);
@property (nonatomic,copy) void (^clickCancelBlock)(void);

#pragma mark - 单例
SFSingleton_h(Picker)

#pragma mark - show
+ (void)showIn:(nonnull UIViewController *)vc title:(nullable NSString *)title msg:(nullable NSString *)msg;
- (void)showIn:(nonnull UIViewController *)vc title:(nullable NSString *)title msg:(nullable NSString *)msg;

@end

NS_ASSUME_NONNULL_END
