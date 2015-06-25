//
//  RootViewController.m
//  autoCoding
//
//  Created by 李玉峰 on 15/6/25.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "RootViewController.h"
#import "ModelsViewController.h"

typedef NS_ENUM(NSUInteger, CellTag) {
    kCellTagModels,
    kCellTagInterface,
    kCellTagFile,
    kCellTagSetting
};

@interface RootViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)NSMutableArray * datas;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.datas = [NSMutableArray array];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    self.tableView.tableFooterView = [[UIView alloc]init];
    
    [self.datas addObject:@{@"title":@"models",
                            @"tag":@(kCellTagModels)}];
    [self.datas addObject:@{@"title":@"interface",
                            @"tag":@(kCellTagInterface)}];
    [self.datas addObject:@{@"title":@"file",
                            @"tag":@(kCellTagFile)}];
    [self.datas addObject:@{@"title":@"setting",
                            @"tag":@(kCellTagSetting)}];
    
    [self.tableView reloadData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource,UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    NSDictionary *dic = self.datas[indexPath.row];
    cell.textLabel.text = dic[@"title"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dic = self.datas[indexPath.row];
    NSNumber *tagNumber = dic[@"tag"];
    switch (tagNumber.integerValue) {
        case kCellTagModels:{
            [self performSegueWithIdentifier:@"ModelsViewController" sender:nil];
        }break;
        case kCellTagInterface:{
            
        }break;
        case kCellTagFile:{
            
        }break;
        case kCellTagSetting:{
            
        }break;
        default:{
            
        }
            break;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
