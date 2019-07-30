//
//  InputCheckerLimit.m
//  InputChecker
//
//  Created by 杨志豪 on 2017/8/8.
//  Copyright © 2017年 yangzhihao. All rights reserved.
//

#import "InputCheckerLimit.h"


@interface InputCheckerLimit()

typedef NS_ENUM(NSInteger, InputCheckerDateType) {
    InputCheckerDateFuture = 0,          //在
    InputCheckerDatePast = 1,          //非空模式
    InputCheckerDateSame = 2,            //数字模式
};

@end

@implementation InputCheckerLimit

- (id)initWithLimitType:(InputLimitType)limitType{
    if(self = [super init]){
        self.limitType = limitType;
    }
    return self;
}
#pragma mark - 固定模式限制
/**必填模式*/
+ (InputCheckerLimit*)Required{
    InputCheckerLimit *limit = [[InputCheckerLimit alloc]initWithLimitType:RequiredLimitType];
    return limit;
}
/**非空模式*/
+ (InputCheckerLimit*)NotBlank{
    InputCheckerLimit *limit = [[InputCheckerLimit alloc]initWithLimitType:NotBlankLimitType];
    return limit;
}
/**数字模式*/
+ (InputCheckerLimit*)Digits{
    InputCheckerLimit *limit = [[InputCheckerLimit alloc]initWithLimitType:DigitsLimitType];
    return limit;
}
/**邮件地址模式*/
+ (InputCheckerLimit*)Email{
    InputCheckerLimit *limit = [[InputCheckerLimit alloc]initWithLimitType:EmailLimitType];
    return limit;
}
/**IP地址模式*/
+ (InputCheckerLimit*)IPv4{
    InputCheckerLimit *limit = [[InputCheckerLimit alloc]initWithLimitType:IPv4LimitType];
    return limit;
}
/**域名模式*/
+ (InputCheckerLimit*)Host{
    InputCheckerLimit *limit = [[InputCheckerLimit alloc]initWithLimitType:HostLimitType];
    return limit;
}
/**URL地址模式*/
+ (InputCheckerLimit*)URL{
    InputCheckerLimit *limit = [[InputCheckerLimit alloc]initWithLimitType:URLLimitType];
    return limit;
}
/**数值模式*/
+ (InputCheckerLimit*)Numeric{
    InputCheckerLimit *limit = [[InputCheckerLimit alloc]initWithLimitType:NumericLimitType];
    return limit;
}
/**银行卡/信用卡号码模式*/
+ (InputCheckerLimit*)BankCard{
    InputCheckerLimit *limit = [[InputCheckerLimit alloc]initWithLimitType:BankCardLimitType];
    return limit;
}
/**身份证号码模式*/
+ (InputCheckerLimit*)ChineseIDCard{
    InputCheckerLimit *limit = [[InputCheckerLimit alloc]initWithLimitType:ChineseIDCardLimitType];
    return limit;
}
/**手机号码模式（国内）*/
+ (InputCheckerLimit*)ChineseMobile{
    InputCheckerLimit *limit = [[InputCheckerLimit alloc]initWithLimitType:ChineseMobileLimitType];
    return limit;
}
/**固定电话号码模式（国内）*/
+ (InputCheckerLimit*)ChineseTelephone{
    InputCheckerLimit *limit = [[InputCheckerLimit alloc]initWithLimitType:ChineseTelephoneLimitType];
    return limit;
}
/**设备物理地址（MAC Address）模式*/
+ (InputCheckerLimit*)MACred{
    InputCheckerLimit *limit = [[InputCheckerLimit alloc]initWithLimitType:MACLimitType];
    return limit;
}

#pragma mark - 自定义限制
/**最小内容长度*/
+ (InputCheckerLimit*)MinLength:(NSInteger)length{
    InputCheckerLimit *limit = [[InputCheckerLimit alloc]initWithLimitType:MinLengthLimitType];
    limit.length = length;
    return limit;
}
/**最多内容长度*/
+ (InputCheckerLimit*)MaxLength:(NSInteger)length{
    InputCheckerLimit *limit = [[InputCheckerLimit alloc]initWithLimitType:MaxLengthLimitType];
    limit.length = length;
    return limit;
}
/**内容长度在指定范围内*/
+ (InputCheckerLimit*)RangeLengthWithMin:(float)min max:(float)max{
    InputCheckerLimit *limit = [[InputCheckerLimit alloc]initWithLimitType:RangeLengthLimitType];
    limit.min = min;
    limit.max = max;
    return limit;
}
/**内容长度在固定值*/
+ (InputCheckerLimit*)FixedLength:(NSInteger)length{
    InputCheckerLimit *limit = [[InputCheckerLimit alloc]initWithLimitType:FixedLengthLimitType];
    limit.length = length;
    return limit;
}
/**最小值*/
+ (InputCheckerLimit*)MinValue:(float)min{
    InputCheckerLimit *limit = [[InputCheckerLimit alloc]initWithLimitType:MinValueLimitType];
    limit.min = min;
    return limit;
}
/**最大值*/
+ (InputCheckerLimit*)MaxValue:(float)max{
    InputCheckerLimit *limit = [[InputCheckerLimit alloc]initWithLimitType:MaxValueLimitType];
    limit.max = max;
    return limit;
}
/**数值范围*/
+ (InputCheckerLimit*)RangeValueWihthMin:(float)min max:(float)max{
    InputCheckerLimit *limit = [[InputCheckerLimit alloc]initWithLimitType:RangeValueLimitType];
    limit.min = min;
    limit.max = max;
    return limit;
}
/**与指定内容相同*/
+ (InputCheckerLimit*)Equals:(NSString *)string{
    InputCheckerLimit *limit = [[InputCheckerLimit alloc]initWithLimitType:EqualsLimitType];
    limit.string = string;
    return limit;
}
/**与指定内容不相同*/
+ (InputCheckerLimit*)NotEquals:(NSString *)NotEquals{
    InputCheckerLimit *limit = [[InputCheckerLimit alloc]initWithLimitType:NotEqualsLimitType];
    limit.string =NotEquals;
    return limit;
}
/**在指定日期之前——符合yyyy-MM-dd格式，指定日期同上，也可以传入Date对象*/
+ (InputCheckerLimit*)DateBefore:(id)date{
    InputCheckerLimit *limit = [[InputCheckerLimit alloc]initWithLimitType:DateBeforeLimitType];
    limit.date = date;
    return limit;
}
/**在指定日期之后——符合yyyy-MM-dd格式，指定日期同上，也可以传入Date对象*/
+ (InputCheckerLimit*)DateAfter:(id)date{
    InputCheckerLimit *limit = [[InputCheckerLimit alloc]initWithLimitType:DateAfterLimitType];
    limit.date = date;
    return limit;
}
/**在指定日期内——符合yyyy-MM-dd格式，指定日期同上，也可以传入Date对象*/
+ (InputCheckerLimit*)RangeDateWithMinDate:(id)minDate MaxDate:(id)maxDate{
    InputCheckerLimit *limit = [[InputCheckerLimit alloc]initWithLimitType:RangeDateLimitType];
    limit.minDate = minDate;
    limit.maxDate = maxDate;
    return limit;
}
/**在指定日期时间之前——符合yyyy-MM-dd HH:mm:ss格式，指定日期时间同上，也可以传入Date对象*/
+ (InputCheckerLimit*)DateTimeBefore:(id)date{
    InputCheckerLimit *limit = [[InputCheckerLimit alloc]initWithLimitType:DateTimeBeforeLimitType];
    limit.date = date;
    return limit;
}
/**在指定日期时间之后——符合yyyy-MM-dd HH:mm:ss格式，指定日期时间同上，也可以传入Date对象*/
+ (InputCheckerLimit*)DateTimeAfter:(id)date{
    InputCheckerLimit *limit = [[InputCheckerLimit alloc]initWithLimitType:DateTimeAfterLimitType];
    limit.date = date;
    return limit;
}
/**在指定日期时间内——符合yyyy-MM-dd HH:mm:ss格式，指定日期时间同上，也可以传入Date对象*/
+ (InputCheckerLimit*)RangeDateTimeWithMinDate:(id)minDate MaxDate:(id)maxDate{
    InputCheckerLimit *limit = [[InputCheckerLimit alloc]initWithLimitType:RangeDateTimeLimitType];
    limit.minDate = minDate;
    limit.maxDate = maxDate;
    return limit;
}
/**在指定时间之前——符合HH:mm:ss格式，指定日期时间同上，也可以传入Date对象*/
+ (InputCheckerLimit*)TimeBefore:(id)time{
    InputCheckerLimit *limit = [[InputCheckerLimit alloc]initWithLimitType:TimeBeforeLimitType];
    limit.date = time;
    return limit;
}
/**在指定时间之后——符合HH:mm:ss格式，指定日期时间同上，也可以传入Date对象*/
+ (InputCheckerLimit*)TimeAfter:(id)time{
    InputCheckerLimit *limit = [[InputCheckerLimit alloc]initWithLimitType:TimeAfterLimitType];
    limit.date = time;
    return limit;
}
/**在指定时间内——符合HH:mm:ss格式，指定日期时间同上，也可以传入Date对象*/
+ (InputCheckerLimit*)RangeTimeWithMinDate:(id)minDate MaxDate:(id)maxDate{
    InputCheckerLimit *limit = [[InputCheckerLimit alloc]initWithLimitType:RangeTimeLimitType];
    limit.minDate = minDate;
    limit.maxDate = maxDate;
    return limit;
}

- (BOOL)checkWithString:(NSString *)string{
    //如没有值则直接验证失败
    if(!string || string.length == 0){
        return NO;
    }
    switch (self.limitType) {
        case NotBlankLimitType:{//非空模式
            //去掉所有换行及空格
            NSString *temp = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
            temp = [temp stringByReplacingOccurrencesOfString:@"\r" withString:@""];
            temp = [temp stringByReplacingOccurrencesOfString:@"\n" withString:@""];
            if(temp.length == 0){
                return NO;
            }
        }break;
        case DigitsLimitType:{//数字模式
            NSString *regex = @"[0-9]*";
            return [[self predicateWithString:regex] evaluateWithObject:string];
        }break;
        case EmailLimitType:{//邮件地址模式
            NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
            return [[self predicateWithString:emailRegex] evaluateWithObject:string];
        }break;
        case IPv4LimitType:{//IP地址模式
            NSString * regex = @"(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)";
            return [[self predicateWithString:regex] evaluateWithObject:string];
        }break;
        case HostLimitType:{//域名模式
            NSString * regex = @"^([a-z0-9]([a-z0-9\\-]{0,65}[a-z0-9])?\\.)+[a-z]{2,6}$";
            return [[self predicateWithString:regex] evaluateWithObject:string];
        }break;
        case URLLimitType:{//URL地址模式
            NSString * regex = @"^(https?:\\/\\/)?[\\w\\-_]+(\\.[\\w\\-_]+)+([\\w\\-\\.,@?^=%&amp;:/~\\+#]*[\\w\\-\\@?^=%&amp;/~\\+#])?$";
            return [[self predicateWithString:regex] evaluateWithObject:string];
        }break;
        case NumericLimitType:{//数值模式
            return [self isAllNumber:string];
        }break;
        case  BankCardLimitType:{//银行卡/信用卡号码模式
            NSString *regex = @"[0-9]*";
            if (string.length < 16||![[self predicateWithString:regex] evaluateWithObject:string]) {
                return NO;
            }
            NSInteger oddsum = 0;//奇数求和
            NSInteger evensum = 0;//偶数求和
            NSInteger allsum = 0;
            NSInteger cardNoLength = (NSInteger)[string length];
            // 取了最后一位数
            NSInteger lastNum = [[string substringFromIndex:cardNoLength-1] intValue];
            //测试的是除了最后一位数外的其他数字
            string = [string substringToIndex:cardNoLength - 1];
            for (NSInteger i = cardNoLength -1 ; i>=1;i--) {
                NSString *tmpString = [string substringWithRange:NSMakeRange(i-1, 1)];
                NSInteger tmpVal = [tmpString integerValue];
                if (cardNoLength % 2 ==1 ) {//卡号位数为奇数
                    if((i % 2) == 0){//偶数位置
                        tmpVal *= 2;
                        if(tmpVal>=10)
                            tmpVal -= 9;
                        evensum += tmpVal;
                    }else{//奇数位置
                        oddsum += tmpVal;
                    }
                }else{
                    if((i % 2) == 1){
                        tmpVal *= 2;
                        if(tmpVal>=10)
                            tmpVal -= 9;
                        evensum += tmpVal;
                    }else{
                        oddsum += tmpVal;
                    }
                }
            }
            allsum = oddsum + evensum;
            allsum += lastNum;
            if((allsum % 10) == 0)
                return YES;
            else
                return NO;
        }break;
        case ChineseIDCardLimitType:{//身份证号码模式
            NSString *regex = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
            return [[self predicateWithString:regex] evaluateWithObject:string];
        }break;
        case ChineseMobileLimitType:{//手机号码模式（国内）
            NSString *regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,18}";
            return [[self predicateWithString:regex] evaluateWithObject:string];
        }break;
        case ChineseTelephoneLimitType:{//固定电话号码模式（国内）
            NSString *regex = @"^((((010)|(0[2-9]\\d))[-|\\s]?)?[2-9]\\d{7})|((0[3-9]\\d{2}[-|\\s]?)?[2-9]\\d{6,7})$";
            return [[self predicateWithString:regex] evaluateWithObject:string];
        }break;
        case MACLimitType:{//设备物理地址（MAC Address）模式
            if(string.length != @"11:22:33:44:55:66".length) {
                return NO;
            }
            NSString *parts = [string stringByReplacingOccurrencesOfString:@":" withString:@"-"];
            NSString *regex = @"([A-Fa-f0-9]{2}-){5}[A-Fa-f0-9]{2}";
            return [[self predicateWithString:regex] evaluateWithObject:parts];
        }break;
        case MinLengthLimitType:{//最小内容长度
            if (string.length < self.length){
                return NO;
            }
        }break;
        case MaxLengthLimitType:{//最多内容长度
            if (string.length > self.length){
                return NO;
            }
        }break;
        case RangeLengthLimitType:{ //内容长度在指定范围内
            if(string.length < self.min ||string.length > self.max){
                return NO;
            }
        }break;
        case FixedLengthLimitType:{//内容长度在固定值
            if(string.length != self.length){
                return NO;
            }
        }break;
        case MinValueLimitType:{//最小值
            if(![self isAllNumber:string] || [string floatValue] < self.min){
                return NO;
            }
        }break;
        case MaxValueLimitType:{//最大值
            if(![self isAllNumber:string] || [string floatValue] > self.max){
                return NO;
            }
        }break;
        case RangeValueLimitType:{//数值范围
            if(![self isAllNumber:string] || [string floatValue] > self.max || [string floatValue] < self.min){
                return NO;
            }
        }break;
        case EqualsLimitType:{//与指定内容相同
            if(![string isEqualToString:self.string]){
                return NO;
            }
        }break;
        case NotEqualsLimitType:{//与指定内容不相同
            if([string isEqualToString:self.string]){
                return NO;
            }
        }break;
        case DateBeforeLimitType:{//在指定日期之前
            
        }break;
        case DateAfterLimitType:{//在指定日期之后
            
        }break;
        case RangeDateLimitType:{//在指定日期内
            
        }break;
        case DateTimeBeforeLimitType:{//在指定日期时间之前
            
        }break;
        case DateTimeAfterLimitType:{//在指定日期时间之后
            
        }break;
        case RangeDateTimeLimitType:{//在指定日期时间之内
            
        }break;
        case TimeBeforeLimitType:{//在指定时间之前
            
        }break;
        case TimeAfterLimitType:{ //在指定时间之后
            
        }break;
        case RangeTimeLimitType:{//在指定时间内
            
        }break;
        default:
            break;
    }
    return YES;
}

- (NSPredicate *)predicateWithString:(NSString *)str{
    return  [NSPredicate predicateWithFormat:@"SELF MATCHES %@",str];
}

- (BOOL)isAllNumber:(NSString *)string{
    NSString *regex = @"-?[0-9]*.?[0-9]*";
    return [[self predicateWithString:regex] evaluateWithObject:string];
}

- (NSDate *)getTureDate:(id)date Formatter:(NSString *)formatter{
    if ([date isKindOfClass:[NSDate class]]){
        return date;
    } else {
        return [self getDateWithFormatter:formatter String:date];
    }
}

- (NSDate *)getDateWithFormatter:(NSString *)formatter String:(NSString *)string{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    return [dateFormatter dateFromString:string];
}

- (NSInteger)date1:(NSDate *)date1 BeforeDate2:(NSDate *)date2{
    NSComparisonResult result = [date1 compare:date2];
    if (result == NSOrderedDescending) {
        return InputCheckerDateFuture;
    }
    else if (result == NSOrderedAscending){
        //NSLog(@"Date1 is in the past");
        return InputCheckerDatePast;
    }
    //NSLog(@"Both dates are the same");
    return InputCheckerDateSame;
}
@end
