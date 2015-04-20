//
//  CAITitleBar.m
//  autoCoding
//
//  Created by liyufeng on 15/4/20.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "CAITitleBar.h"

@interface CAITitleBar ()

@property (nonatomic, strong)UIScrollView * scrollView;
@property (nonatomic, strong)NSMutableArray *titleButtons;
@property (nonatomic, assign)UIEdgeInsets edgeInsets;//边距
@property (nonatomic, assign)CGFloat titleSpace;//间距

@end

@implementation CAITitleBar

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
        self.titleButtons = [NSMutableArray array];
        [self addSubview:self.scrollView];
        self.edgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
        self.titleSpace = 10;
        self.selectedColor = [UIColor redColor];
        self.normalColor = [UIColor lightGrayColor];
        self.selectedScale = 1.3;
    }
    return self;
}

- (void)setTitleArray:(NSArray *)titleArray{
    _titleArray = titleArray;
}

- (void)updateTitleViews{
    [self.titleButtons enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIButton * button = (UIButton *)obj;
        [button removeFromSuperview];
    }];
    [self.titleButtons removeAllObjects];
    
    CGFloat X = self.edgeInsets.left;
    for (NSInteger i=0; i<_titleArray.count; i++) {
        UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(X, self.edgeInsets.top, 0, 0)];
        NSString * title = _titleArray[i];
        [button setTitle:title forState:UIControlStateNormal];
        [button setTitle:title forState:UIControlStateSelected];
        [button setTitleColor:self.selectedColor forState:UIControlStateSelected];
        [button setTitleColor:self.normalColor forState:UIControlStateNormal];
        button.titleLabel 
    }
    
}

@end
