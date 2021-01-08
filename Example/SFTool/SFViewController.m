//
//  SFViewController.m
//  SFTool
//
//  Created by jack110530 on 01/07/2021.
//  Copyright (c) 2021 jack110530. All rights reserved.
//

#import "SFViewController.h"

#import <SFTool/SFTool.h>

@interface SFViewController ()

@end

@implementation SFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeClose];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    SFCountdownLabel *label = [[SFCountdownLabel alloc]initWithFrame:CGRectMake(100, 300, 200, 40)];
    label.backgroundColor = [UIColor cyanColor];
    label.font = [UIFont systemFontOfSize:15];
    label.textAlignment = NSTextAlignmentCenter;
    label.deadline = [[NSDate date] timeIntervalSince1970] + (5*24*3600) + 5;
    label.countdownDidFinishedBlock = ^{
        NSLog(@"倒计时完成");
    };
    [self.view addSubview:label];
    
}

- (void)btnClick {
    [SFPhotoPicker showIn:self title:@"小星星" msg:@"你就是我的小星星"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
