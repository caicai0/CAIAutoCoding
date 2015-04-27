//
//  CareerCourseViewController.m
//  Maizi
//
//  Created by liyufeng on 15/4/27.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "CareerCourseViewController.h"
#import "TableViewCellStyleValue2.h"
#import "UIImageView+WebCache.h"
#import "CAIClient.h"
#import "CareerDetailViewController.h"

@interface CareerCourseViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong ,nonatomic)NSMutableArray * list;

@end

@implementation CareerCourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.list = [NSMutableArray array];
    
    [self.tableView registerClass:[TableViewCellStyleValue2 class] forCellReuseIdentifier:@"TableViewCellStyleValue2"];
    
    [[CAIClient shareClient] getCarerrCourseFinish:^(CAICareerCourseResult *result, NSError *error) {
        [self.list removeAllObjects];
        [self.list addObjectsFromArray:result.list];
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
    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell  =[tableView dequeueReusableCellWithIdentifier:@"TableViewCellStyleValue2" forIndexPath:indexPath];
    if (cell) {
        CAICareer * course = self.list[indexPath.row];
        cell.textLabel.text = course.name;
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:course.imageUrlString]];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CAICareer * course = self.list[indexPath.row];
    [self performSegueWithIdentifier:@"CareerDetailViewController" sender:course.careerId];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    [super prepareForSegue:segue sender:sender];
    CareerDetailViewController * detailViewController = (CareerDetailViewController *)segue.destinationViewController;
    detailViewController.careerId = sender;
}

@end
