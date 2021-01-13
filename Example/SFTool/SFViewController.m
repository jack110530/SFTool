//
//  SFViewController.m
//  SFTool
//
//  Created by jack110530 on 01/07/2021.
//  Copyright (c) 2021 jack110530. All rights reserved.
//

#import "SFViewController.h"
// demo
#import "SFPhotoPickerDemo.h"


@interface SFViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,copy) NSArray *datas;
@end

@implementation SFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.datas = @[
        @"SFPhotoPickerDemo",
        @"SFCountdownLabelDemo",
        @"SFCountdownViewDemo",
        @"SFCountdownButtonDemo",
    ];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datas.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.datas[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *clsStr = cell.textLabel.text;
    Class cls = NSClassFromString(clsStr);
    [self.navigationController pushViewController:[[cls alloc]init] animated:YES];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
