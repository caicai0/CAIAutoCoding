//
//  ViewController.m
//  textIphone
//
//  Created by liyufeng on 15/4/28.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "ViewController.h"
#import "CAITxtChapter.h"
#import "CAITextView.h"
#import "NSData+CCCryptUtil.h"
#import "RNDecryptor.h"
#import "RNEncryptor.h"

@interface ViewController ()

@property (nonatomic, strong)NSMutableArray *chapters;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.chapters = [NSMutableArray array];
    
    NSString *path = @"/Users/liyufeng/Desktop/逆天仙尊2.txt";
    NSString *path2 = @"/Users/liyufeng/Desktop/逆天仙尊3.txt";
    NSString *path3 = @"/Users/liyufeng/Desktop/逆天仙尊4.txt";
    
    NSLog(@"reading....");
    NSString *string = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    
    
    NSError * error = nil;
    
    NSString *regTags = @"[\\f\\n\\r]第[0123456789一二三四五六七八九十零百千万亿]*章";       // 设计好的正则表达式，最好先在小工具里试验好
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regTags options:NSRegularExpressionCaseInsensitive error:&error];
    
    // 执行匹配的过程
    NSLog(@"looking.....");
    NSArray *matches = [regex matchesInString:string options:NSMatchingReportProgress range:NSMakeRange(0, [string length])];
    
    
    // 用下面的办法来遍历每一条匹配记录
    NSInteger index =0;
    
    NSLog(@"start");
    for (NSTextCheckingResult *match in matches) {
        
        NSRange matchRange = [match range];
        
        NSString *subString = [string substringWithRange:NSMakeRange(index, matchRange.location-index)];
        index = matchRange.location;
        
        subString = [self deleteFirstEmptyChar:subString];
        
        CAITxtChapter * chapter = [[CAITxtChapter alloc]init];
        NSInteger Eindex = [self emptyCharInString:subString];
        chapter.title = [self titleInChapterString:subString emptyCharIndex:Eindex];
        chapter.content = [self contentInChapterString:subString emptyCharIndex:Eindex];
        
        [self.chapters addObject:chapter];
        NSLog(@"%@",chapter.title);
    }
    
    NSData * data = [NSData dataWithContentsOfFile:path];
    NSData * aesdata = [RNEncryptor encryptData:data withSettings:kRNCryptorAES256Settings password:@"abc" error:nil];
    [aesdata writeToFile:path3 atomically:YES];
    
    aesdata = [NSData dataWithContentsOfFile:path3];
    
    NSData * desdata = [RNDecryptor decryptData:aesdata withSettings:kRNCryptorAES256Settings password:@"abc" error:nil];
    [desdata writeToFile:path2 atomically:YES];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    CAITextView * view = [[CAITextView alloc]init];
    view.chapter = self.chapters[0];
    view.frame = self.view.bounds;
    [self.view addSubview:view];
    [view setNeedsDisplay];
    
    NSData * data = [NSData data];
}

- (NSString *)deleteFirstEmptyChar:(NSString *)str{
    NSMutableString *ms = [NSMutableString stringWithString:str];
    if (ms.length>=1) {
        char firstChar = [ms characterAtIndex:0];
        while (firstChar == '\f'||firstChar == '\r'||firstChar == '\n') {
            [ms deleteCharactersInRange:NSMakeRange(0, 1)];
            if (ms.length>=1) {
                firstChar = [ms characterAtIndex:0];
            }else{
                break;
            }
        }
    }
    return [NSString stringWithString:ms];
}

- (NSInteger)emptyCharInString:(NSString *)string{
    NSError * error = nil;
    
    NSString *regTags = @"[\\f\\n\\r]";       // 设计好的正则表达式，最好先在小工具里试验好
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regTags options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSArray *matches = [regex matchesInString:string options:NSMatchingReportProgress range:NSMakeRange(0, [string length])];
    
    if (matches.count) { 
        NSTextCheckingResult *match = matches[0];
        NSRange matchRange = [match range];
        return matchRange.location;
    }
    else{
        return -1;
    }
}

- (NSString *)titleInChapterString:(NSString *)string emptyCharIndex:(NSInteger)index{
    if (index>0 && index < string.length) {
        return [string substringToIndex:index];
    }else{
        return string;
    }
}
- (NSString *)contentInChapterString:(NSString *)string emptyCharIndex:(NSInteger)index{
    if (index>0 && index < string.length) {
        return [string substringFromIndex:index];
    }else{
        return @"";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
