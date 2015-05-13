//
//  tableViewController.m
//  textIphone
//
//  Created by liyufeng on 15/5/6.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "tableViewController.h"
#import "xibTableViewCell.h"

@interface tableViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation tableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"xibTableViewCell" bundle:nil] forCellReuseIdentifier:@"xibTableViewCell"];
    [UIDevice currentDevice].batteryMonitoringEnabled = YES;
    self.slider.value = [UIDevice currentDevice].batteryLevel;
    [self.slider addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    // Do any additional setup after loading the view.
}

- (void)change:(UISlider *)slider{
    [UIScreen mainScreen].brightness = slider.value;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"xibTableViewCell" forIndexPath:indexPath];
    return cell;
}

@end
