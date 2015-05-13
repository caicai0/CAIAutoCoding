//
//  sourceViewController.m
//  Maizi
//
//  Created by liyufeng on 15/5/13.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "courceViewController.h"
@interface courceViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSMutableArray * data;

@end

@implementation courceViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

@end
