//
//  CareerDetailViewController.h
//  Maizi
//
//  Created by liyufeng on 15/4/27.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CareerDetailViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)NSString * careerId;

@end
