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
    InputChecker *checker = [InputChecker new];
    checker.addCheckObj(checkLabel).addLimit([InputCheckerLimit MaxLength:20]);
    checker.addCheckObj(@"123").addLimit([InputCheckerLimit MaxLength:2]);
    NSLog(@"result:%d   error:%@",[checker beganChaeck],checker.errorMessage);
}

@end
