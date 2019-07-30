

# 使用示例

```Objective-C
采用流式API，单句中只能添加一个校验对象及单个错误信息可以添加多种校验类型，需将校验对象写在句首。
// 一、NSString类型校验
inputs  // 必选，手机号
        InputChecker *checker = [InputChecker new];
        checker.addCheckObj(@"13875148888").addLimit([InputCheckerLimit Required]).addLimit([InputCheckerLimit ChineseMobile]);
        NSLog(@"%d",[checker beganChaeck]);
// 二、UIKit类型校验（支持UITextField、UILabel、UITextView、UISearchBar、UIButton）
        UILabel *checkLabel = [UILabel new];
        checkLabel.text = @"13875148888";
        InputChecker *checker = [InputChecker new];
        checker.addCheckObj(checkLabel).addLimit([InputCheckerLimit Required]).addLimit([InputCheckerLimit ChineseMobile]);
        NSLog(@"%d",[checker beganChaeck]);
// 必选，数字，最大20字符
checker.addCheckObj(checkLabel).addLimit([InputCheckerLimit Required]).addLimit([InputCheckerLimit MaxLength:20]).addLimit([InputCheckerLimit Numeric]);
// 必选，邮件
checker.addCheckObj(checkLabel).addLimit([InputCheckerLimit Required]).addLimit([InputCheckerLimit Email]);
// Host
checker.addCheckObj(checkLabel).addLimit([InputCheckerLimit Host]);
// URL
checker.addCheckObj(checkLabel).addLimit([InputCheckerLimit URL]);
// MaxLength
checker.addCheckObj(checkLabel).addLimit([InputCheckerLimit MaxLength:30]);
// MinLength
checker.addCheckObj(checkLabel).addLimit([InputCheckerLimit MinLength:30);
// RangeLength
checker.addCheckObj(checkLabel).addLimit([InputCheckerLimit RangeLengthWithMin:5 max:30]);
// Not Blank
checker.addCheckObj(checkLabel).addLimit([InputCheckerLimit NotBlank]);
// Numeric
checker.addCheckObj(checkLabel).addLimit([InputCheckerLimit Numeric]);
// MaxValue
checker.addCheckObj(checkLabel).addLimit([InputCheckerLimit MaxValue:23.4]);
// MinValue
checker.addCheckObj(checkLabel).addLimit([InputCheckerLimit MinValue:23.4]);
// RangeValue
checker.addCheckObj(checkLabel).addLimit([InputCheckerLimit RangeValueWihthMin:1 max:100]);

//

# 多个校验对象的使用
//在使用InputChecker时可以将多个校验对象及规则依次添加进去，在最后校验时只有在所有校验都ok时返回YES
UILabel *checkLabel = [UILabel new];
checkLabel.text = @"13875148888";
InputChecker *checker = [InputChecker new];
checker.addCheckObj(checkLabel).addLimit([InputCheckerLimit MaxLength:20]);
checker.addCheckObj(@"123").addLimit([InputCheckerLimit MaxLength:2]);

# 添加自定义错误信息

//添加时错误信息就对当前句中的校验对象及校验类型有效，错误信息有自动补充当句所有校验任务功能，addErrorMessage可以写在校验对象后的任意位置
checker.addCheckObj(checkLabel).addLimit([InputCheckerLimit MaxLength:20]).addErrorMessage(@"label验证出错啦");
checker.addCheckObj(@"123").addLimit([InputCheckerLimit MaxLength:2]).addErrorMessage(@"字符串验证出错啦");
NSLog(@"result:%d   error:%@",[checker beganChaeck],checker.errorMessage);

```


