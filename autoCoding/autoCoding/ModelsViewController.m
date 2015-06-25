//
//  ModelsViewController.m
//  autoCoding
//
//  Created by 李玉峰 on 15/6/25.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "ModelsViewController.h"

@interface ModelsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)NSString * modelPath;
@property (nonatomic, strong)NSMutableDictionary *modelDic;
@property (nonatomic, strong)NSArray *modelNames;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ModelsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    self.modelPath = [docPath stringByAppendingPathComponent:@"model.xml"];
    NSLog(@"modelPath:%@",self.modelPath);
    if ([[NSFileManager defaultManager]fileExistsAtPath:self.modelPath]) {
        self.modelDic = [NSMutableDictionary dictionaryWithDictionary:[NSDictionary dictionaryWithContentsOfFile:self.modelPath]];
    }else{
        self.modelDic = [NSMutableDictionary dictionary];
    }
    self.modelNames = self.modelDic.allKeys;
    [self.tableView reloadData];
    // Do any additional setup after loading the view.
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (![self.navigationController.viewControllers containsObject:self]) {
        [self.modelDic writeToFile:self.modelPath atomically:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDelegate,UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modelNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = self.modelNames[indexPath.row];
    return cell;
}

@end
