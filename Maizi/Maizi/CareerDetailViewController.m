//
//  CareerDetailViewController.m
//  Maizi
//
//  Created by liyufeng on 15/4/27.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "CareerDetailViewController.h"
#import "CAIClient.h"
#import "UIImageView+WebCache.h"
#import "TableViewCellStyleValue2.h"

@interface CareerDetailViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic)CAICareerDetail *careerDetail;

@end

@implementation CareerDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[TableViewCellStyleValue2 class] forCellReuseIdentifier:@"TableViewCellStyleValue2"];
    [[CAIClient shareClient]getCareerDetailWithCareerId:self.careerId finish:^(CAICareerDetailResult *result, NSError *error) {
        self.careerDetail = result.data;
        [self.tableView reloadData];
    }];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.careerDetail) {
        return self.careerDetail.stage.count;
    }else{
        return 0;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    CAIStage * stage = self.careerDetail.stage[section];
    return stage.stageDescription;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    CAIStage * stage = self.careerDetail.stage[section];
    return stage.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell  =[tableView dequeueReusableCellWithIdentifier:@"TableViewCellStyleValue2" forIndexPath:indexPath];
    if (cell) {
        CAIStage * stage = self.careerDetail.stage[indexPath.section];
        CAICareerCourse * course = stage.list[indexPath.row];
        cell.textLabel.text = course.courceName;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%ld",course.update];
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:course.imageUrlString]];
    }
    return cell;
}

@end
