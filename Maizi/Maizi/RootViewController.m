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
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [[CAIClient shareClient]getExcellentCourseFinish:^(CAIExcellentCourseResult * result, NSError *error) {
        NSLog(@"%@",result);
        self.sections = [NSMutableArray arrayWithObjects:result.list, nil];
        [self.tableView reloadData];
    }];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource,UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray * arr = self.sections[section];
    if (arr && arr.count) {
        return arr.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell  =[tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    if (cell) {
        NSArray * arr = self.sections[indexPath.section];
        CAICourse * course = arr[indexPath.row];
        cell.textLabel.text = course.courceName;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld",course.studentCount];
    }
    return cell;
}

@end
