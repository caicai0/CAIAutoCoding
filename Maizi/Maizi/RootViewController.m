//
//  RootViewController.m
//  Maizi
//
//  Created by liyufeng on 15/4/21.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "RootViewController.h"
#import "CAIClient.h"
@interface RootViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic)NSMutableArray * sections;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[CAIClient shareClient]getExcellentCourseFinish:^(CAIExcellentCourseResult * result, NSError *error) {
        NSLog(@"%@",result);
        self.sections = [NSMutableArray arrayWithArray:result.list];
        [self.tableView reloadData];
    }];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource,UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.sections;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
}

@end
