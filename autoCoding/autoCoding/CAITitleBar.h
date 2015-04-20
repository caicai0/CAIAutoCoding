//
//  CAITitleBar.h
//  autoCoding
//
//  Created by liyufeng on 15/4/20.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CAITitleBar : UIView

@property (nonatomic, strong)NSArray * titleArray;//要显示的标题
@property (nonatomic, strong)UIColor * selectedColor;//选中的颜色
@property (nonatomic, strong)UIColor * normalColor;//正常颜色
@property (nonatomic, assign)CGFloat selectedScale;//选中后的形变

@end
