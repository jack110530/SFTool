//
//  SFPhotoPickerDemo.m
//  SFTool_Example
//
//  Created by 黄山锋 on 2021/1/11.
//  Copyright © 2021 jack110530. All rights reserved.
//

#import "SFPhotoPickerDemo.h"
#import <SFTool/SFTool.h>

@interface SFPhotoPickerDemo ()

@end

@implementation SFPhotoPickerDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"SFPhotoPickerDemo";
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.backgroundColor = [UIColor orangeColor];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnClick {
    [SFPhotoPicker showIn:self title:@"小星星" msg:@"你就是我的小星星"];
}


@end
