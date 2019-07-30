//
//  ViewController.m
//  InputChecker
//
//  Created by 杨志豪 on 2017/8/8.
//  Copyright © 2017年 yangzhihao. All rights reserved.
//

#import "ViewController.h"
#import "InputChecker.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *checkLabel = [UILabel new];
    checkLabel.text = @"13875148888";
    
    
    //检查一个字符串和一个label是否是 非空、无空格、小于20字符
    InputChecker *checker = [InputChecker new];
    //添加label的检查
    checker.addCheckObj(checkLabel).addLimit([InputCheckerLimit MaxLength:20]).addLimit([InputCheckerLimit NotBlank]).addLimit([InputCheckerLimit Required]).addErrorMessage(@"自定义错误信息:label检查不同过");
    //添加字符串的检查
    checker.addCheckObj(@"1234567890").addLimit([InputCheckerLimit MaxLength:20]).addLimit([InputCheckerLimit NotBlank]).addLimit([InputCheckerLimit Required]).addErrorMessage(@"自定义错误信息:字符串检查不同过");
    
    
    //打印两项任务的检查结果
    NSLog(@"result:%d   error:%@",[checker beganChaeck],checker.errorMessage);
}

@end
