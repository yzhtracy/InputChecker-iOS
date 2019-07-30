//
//  InputCheckerLimitTask.h
//  InputChecker
//
//  Created by 杨志豪 on 2017/8/9.
//  Copyright © 2017年 yangzhihao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "InputCheckerLimit.h"

@interface InputCheckerLimitTask : NSObject

@property(nonatomic,strong) NSMutableArray <InputCheckerLimit*>*limits;

@property(nonatomic,strong) InputCheckerLimit *limit;

@property(nonatomic,strong) UIView *limitView;

@property(nonatomic,copy) NSString *limitString;

@property(nonatomic,copy) NSString *errorMessage;

@property(nonatomic,assign) BOOL donotModify;

- (BOOL)check;


@end
