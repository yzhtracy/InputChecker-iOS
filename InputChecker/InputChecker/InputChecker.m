//
//  InputChecker.m
//  InputChecker
//
//  Created by 杨志豪 on 2017/8/8.
//  Copyright © 2017年 yangzhihao. All rights reserved.
//

#import "InputChecker.h"
#import "InputCheckerLimitTask.h"

@interface InputChecker()

@property(nonatomic,strong)NSMutableArray<InputCheckerLimitTask *> *taskList;

@property(nonatomic,copy) NSString* nowString;

@property(nonatomic,copy) NSString* nowErrorMessage;

@end

@implementation InputChecker


- (InputChecker * _Nullable (^_Nullable)(id _Nullable ))addCheckObj{
    return ^id(id strObj) {
        //当有新的检查对象时对之前所有的检查任务做标记，禁止其补充错误信息
        [self getStringWithStringObj:strObj];
        self.nowErrorMessage = nil;
        for (InputCheckerLimitTask *task in self.taskList) {
            task.donotModify = YES;
        }
        return self;
    };
}

- (InputChecker * _Nullable (^_Nullable)(InputCheckerLimit *_Nullable))addLimit{
    return ^id ( InputCheckerLimit * _Nonnull  limit) {
        InputCheckerLimitTask *limitTast = [InputCheckerLimitTask new];
        limitTast.limit = limit;
        limitTast.limitString = self.nowString;
        limitTast.errorMessage = self.nowErrorMessage;
        [self.taskList addObject:limitTast];
        return self;
    };
}

- (InputChecker * _Nullable (^_Nullable)(NSString *_Nullable))addErrorMessage{
    return ^id ( NSString * _Nonnull  string) {
        //若之前有未做标记的任务，则自动将其补充错误信息
        self.nowErrorMessage = string;
        for (InputCheckerLimitTask *task in self.taskList) {
            if(!task.donotModify){
                task.errorMessage = string;
            }
        }
        return self;
    };
}

- (BOOL)beganChaeck{
    for (InputCheckerLimitTask *limitTask in self.taskList) {
        if(![limitTask check]){
            self.errorMessage = limitTask.errorMessage;
            return NO;
        }
    }
    return YES;
}

/**
 添加需要判断的字符串及相关限制，限制要以nill结尾
 */
- (void)addCheckWithString:(NSString * _Nullable )string limits:(nullable InputCheckerLimit *)otherLimits, ...NS_REQUIRES_NIL_TERMINATION{
    
}

/**
 添加需要判断的字符串及相关限制，限制要以nill结尾，传入该次判断的tag和错误的信息，如该次判断不通过会将tag和错误信息返回
 */
- (void)addCheckWithString:(NSString * _Nullable )string tag:(NSInteger)tag ErrorMessage:(NSString * _Nullable)message limits:(nullable InputCheckerLimit *)otherLimits, ...NS_REQUIRES_NIL_TERMINATION{


}

/**
 添加需要判断的UI控件及相关限制，限制要以nill结尾。支持UILabel、UITextField、UITextView、UIButton、UISearchBar。
 */
- (void)addCheckWithView:(UIView *)view limits:(InputCheckerLimit *)otherLimits, ...{

}

/**
 添加需要判断的UI控件及相关限制，限制要以nill结尾，传入该次判断的tag和错误的信息，如该次判断不通过则会将tag和错误信息返回。支持UILabel、UITextField、UITextView、UIButton、UISearchBar。
 */
- (void)addCheckWithView:(UIView *)view tag:(NSInteger)tag ErrorMessage:(NSString *)message limits:(InputCheckerLimit *)otherLimits, ...{

}

- (void)getStringWithStringObj:(id)strObj{
    if([strObj isKindOfClass:[NSString class]]){
        self.nowString = strObj;
    }else if ([strObj isKindOfClass:[UITextField class]]){
        self.nowString = [(UITextField*)strObj text];
    }else if ([strObj isKindOfClass:[UILabel class]]){
        self.nowString = [(UILabel*)strObj text];
    }else if ([strObj isKindOfClass:[UITextView class]]){
        self.nowString = [(UITextView*)strObj text];
    }else if ([strObj isKindOfClass:[UISearchBar class]]){
        self.nowString = [(UISearchBar*)strObj text];
    }else if ([strObj isKindOfClass:[UIButton class]]){
        self.nowString = [(UIButton*)strObj titleLabel].text;
    }
}

- (NSMutableArray<InputCheckerLimitTask *> *)taskList{
    if(!_taskList){
        _taskList = [NSMutableArray new];
    }
    return _taskList;
}
@end
