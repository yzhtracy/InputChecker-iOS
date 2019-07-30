//
//  InputCheckerLimit.h
//  InputChecker
//
//  Created by 杨志豪 on 2017/8/8.
//  Copyright © 2017年 yangzhihao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, InputLimitType) {
    RequiredLimitType = 0,          //必填模式
    NotBlankLimitType = 1,          //非空模式
    DigitsLimitType = 2,            //数字模式
    EmailLimitType = 3,             //邮件地址模式
    IPv4LimitType = 4,              //IP地址模式
    HostLimitType = 5,              //域名模式
    URLLimitType = 6,               //URL地址模式
    NumericLimitType = 7,           //数值模式
    BankCardLimitType = 8,          //银行卡/信用卡号码模式
    ChineseIDCardLimitType = 9,     //身份证号码模式
    ChineseMobileLimitType = 10,    //手机号码模式（国内）
    ChineseTelephoneLimitType = 11, //固定电话号码模式（国内）
    MACLimitType = 12,              //设备物理地址（MAC Address）模式
    MinLengthLimitType = 13,        //最小内容长度
    MaxLengthLimitType = 14,        //最多内容长度
    RangeLengthLimitType = 15,      //内容长度在指定范围内
    FixedLengthLimitType = 16,      //内容长度在固定值
    MinValueLimitType = 17,         //最小值
    MaxValueLimitType = 18,         //最大值
    RangeValueLimitType = 19,       //数值范围
    EqualsLimitType = 20,           //与指定内容相同
    NotEqualsLimitType = 21,        //与指定内容不相同
    DateBeforeLimitType = 22,       //在指定日期之前
    DateAfterLimitType = 23,        //在指定日期之后
    RangeDateLimitType = 24,        //在指定日期内
    DateTimeBeforeLimitType = 25,   //在指定日期时间之前
    DateTimeAfterLimitType = 26,    //在指定日期时间之后
    RangeDateTimeLimitType = 27,    //在指定日期时间之内
    TimeBeforeLimitType = 28,       //在指定时间之前
    TimeAfterLimitType = 29,        //在指定时间之后
    RangeTimeLimitType = 30,        //在指定时间内
};


@interface InputCheckerLimit : NSObject

@property(nonatomic,assign) InputLimitType limitType;
@property(nonatomic,copy) NSString *string;
@property(nonatomic,assign) float value;
@property(nonatomic,assign) NSInteger length;
@property(nonatomic,assign) float min;
@property(nonatomic,assign) float max;
@property(nonatomic,copy) id date;
@property(nonatomic,copy) id minDate;
@property(nonatomic,copy) id maxDate;

#pragma mark - 固定模式
/**必填模式*/
+ (InputCheckerLimit*)Required;
/**非空模式(除换行符及空格外有其他内容)*/
+ (InputCheckerLimit*)NotBlank;
/**数字模式*/
+ (InputCheckerLimit*)Digits;
/**邮件地址模式*/
+ (InputCheckerLimit*)Email;
/**IP地址模式*/
+ (InputCheckerLimit*)IPv4;
/**域名模式*/
+ (InputCheckerLimit*)Host;
/**URL地址模式*/
+ (InputCheckerLimit*)URL;
/**数值模式(可以带小数点)*/
+ (InputCheckerLimit*)Numeric;
/**银行卡/信用卡号码模式*/
+ (InputCheckerLimit*)BankCard;
/**身份证号码模式*/
+ (InputCheckerLimit*)ChineseIDCard;
/**手机号码模式（国内）*/
+ (InputCheckerLimit*)ChineseMobile;
/**固定电话号码模式（国内）*/
+ (InputCheckerLimit*)ChineseTelephone;
/**设备物理地址（MAC Address）模式*/
+ (InputCheckerLimit*)MACred;

#pragma mark - 自定义限制
/**最小内容长度*/
+ (InputCheckerLimit*)MinLength:(NSInteger)length;
/**最多内容长度*/
+ (InputCheckerLimit*)MaxLength:(NSInteger)length;
/**内容长度在指定范围内*/
+ (InputCheckerLimit*)RangeLengthWithMin:(float)min max:(float)max;
/**内容长度在固定值*/
+ (InputCheckerLimit*)FixedLength:(NSInteger)length;
/**最小值*/
+ (InputCheckerLimit*)MinValue:(float)min;
/**最大值*/
+ (InputCheckerLimit*)MaxValue:(float)max;
/**数值范围*/
+ (InputCheckerLimit*)RangeValueWihthMin:(float)min max:(float)max;
/**与指定内容相同*/
+ (InputCheckerLimit*)Equals:(NSString *)string;
/**与指定内容不相同*/
+ (InputCheckerLimit*)NotEquals:(NSString *)NotEquals;
/**在指定日期之前——符合yyyy-MM-dd格式，指定日期同上，也可以传入Date对象*/
+ (InputCheckerLimit*)DateBefore:(id)date;
/**在指定日期之后——符合yyyy-MM-dd格式，指定日期同上，也可以传入Date对象*/
+ (InputCheckerLimit*)DateAfter:(id)date;
/**在指定日期内——符合yyyy-MM-dd格式，指定日期同上，也可以传入Date对象*/
+ (InputCheckerLimit*)RangeDateWithMinDate:(id)minDate MaxDate:(id)maxDate;
/**在指定日期时间之前——符合yyyy-MM-dd HH:mm:ss格式，指定日期时间同上，也可以传入Date对象*/
+ (InputCheckerLimit*)DateTimeBefore:(id)date;
/**在指定日期时间之后——符合yyyy-MM-dd HH:mm:ss格式，指定日期时间同上，也可以传入Date对象*/
+ (InputCheckerLimit*)DateTimeAfter:(id)date;
/**在指定日期时间内——符合yyyy-MM-dd HH:mm:ss格式，指定日期时间同上，也可以传入Date对象*/
+ (InputCheckerLimit*)RangeDateTimeWithMinDate:(id)minDate MaxDate:(id)maxDate;
/**在指定时间之前——符合HH:mm:ss格式，指定日期时间同上，也可以传入Date对象*/
+ (InputCheckerLimit*)TimeBefore:(id)time;
/**在指定时间之后——符合HH:mm:ss格式，指定日期时间同上，也可以传入Date对象*/
+ (InputCheckerLimit*)TimeAfter:(id)time;
/**在指定时间内——符合HH:mm:ss格式，指定日期时间同上，也可以传入Date对象*/
+ (InputCheckerLimit*)RangeTimeWithMinDate:(id)minDate MaxDate:(id)maxDate;

- (BOOL)checkWithString:(NSString *)string;

@end
