//
//  CAITxtChapter.h
//  textIphone
//
//  Created by liyufeng on 15/4/28.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreText/CoreText.h>

@interface CAITxtChapter : NSObject

@property (nonatomic, strong)NSString * title;
@property (nonatomic, assign)NSInteger chapterIndex;
@property (nonatomic, strong)NSString * content;

@property (nonatomic)CTFrameRef frame;

- (CTFrameRef)frameInRect:(CGRect)rect;

@end
