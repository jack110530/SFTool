//
//  SFCountdownLabelDemo.m
//  SFTool_Example
//
//  Created by 黄山锋 on 2021/1/11.
//  Copyright © 2021 jack110530. All rights reserved.
//

#import "SFCountdownLabelDemo.h"
#import <SFTool/SFTool.h>

@interface SFCountdownLabelDemo ()

@end

@implementation SFCountdownLabelDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"SFCountdownLabelDemo";
    
    SFCountdownLabel *label = [[SFCountdownLabel alloc]initWithFrame:CGRectMake(50, 300, 300, 40)];
    label.deadline = [[NSDate date] timeIntervalSince1970] + (3*24*3600) + 3;
    label.countdownDidFinishedBlock = ^{
        NSLog(@"倒计时完成");
    };
    
    // 自定义配置(可选)
    label.backgroundColor = [UIColor cyanColor];
    label.font = [UIFont systemFontOfSize:15];
    label.textAlignment = NSTextAlignmentCenter;
    label.fmt_deadline = @"活动截止到yyyy-MM-dd HH:mm:ss";
    label.fmt_day = @"天";
    label.fmt_hour = @":";
    label.fmt_minute = @":";
    label.fmt_seconds = @"";
    label.fmt_exceeded = @"秒杀活动已结束";
    label.unitColor = [UIColor blackColor];
    label.valueColor = [UIColor whiteColor];
    label.dayColor = [UIColor redColor];
    label.deadlineColor = [UIColor blueColor];
    label.exceededColor = [UIColor redColor];
    
    [self.view addSubview:label];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
