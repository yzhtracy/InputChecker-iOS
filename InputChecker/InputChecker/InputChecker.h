//
//  InputChecker.h
//  InputChecker
//
//  Created by 杨志豪 on 2017/8/8.
//  Copyright © 2017年 yangzhihao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "InputCheckerLimit.h"



@interface InputChecker : NSObject

@property (nonatomic,copy) NSString * _Nullable errorMessage;

- (InputChecker * _Nullable (^_Nullable)(id _Nullable ))addCheckObj;

- (InputChecker * _Nullable (^_Nullable)(InputCheckerLimit *_Nullable))addLimit;

- (InputChecker * _Nullable (^_Nullable)(NSString *_Nullable))addErrorMessage;

- (BOOL)beganChaeck;


/**
添加需要判断的字符串及相关限制，限制要以nill结尾
*/
- (void)addCheckWithString:( NSString * _Nullable )string limits:(nullable InputCheckerLimit *)otherLimits, ...NS_REQUIRES_NIL_TERMINATION;

/**
 添加需要判断的字符串及相关限制，限制要以nill结尾，传入该次判断的tag和错误的信息，如该次判断不通过则会将tag和错误信息返回
 */
-(void)addCheckWithString:( NSString * _Nullable )string tag:(NSInteger)tag ErrorMessage:(NSString * _Nullable)message limits:(nullable InputCheckerLimit *)otherLimits, ...NS_REQUIRES_NIL_TERMINATION;


/**
 添加需要判断的UI控件及相关限制，限制要以nill结尾。支持UILabel、UITextField、UITextView、UIButton、UISearchBar。
 */
- (void)addCheckWithView:(UIView *_Nonnull)view limits:(nullable InputCheckerLimit *)otherLimits, ...NS_REQUIRES_NIL_TERMINATION;

/**
 添加需要判断的UI控件及相关限制，限制要以nill结尾，传入该次判断的tag和错误的信息，如该次判断不通过则会将tag和错误信息返回。支持UILabel、UITextField、UITextView、UIButton、UISearchBar。
 */
-(void)addCheckWithView:(UIView * _Nonnull  )view tag:(NSInteger)tag ErrorMessage:(NSString * _Nullable)message limits:(nullable InputCheckerLimit *)otherLimits, ...NS_REQUIRES_NIL_TERMINATION;

@end
