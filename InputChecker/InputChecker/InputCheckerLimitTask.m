//
//  InputCheckerLimitTask.m
//  InputChecker
//
//  Created by 杨志豪 on 2017/8/9.
//  Copyright © 2017年 yangzhihao. All rights reserved.
//

#import "InputCheckerLimitTask.h"

@implementation InputCheckerLimitTask

- (BOOL)check{
    return [self.limit checkWithString:self.limitString];
}

@end
