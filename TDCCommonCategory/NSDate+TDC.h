//
//  NSDate+TDC.h
//  CityLove
//
//  Created by chengxi on 2016/12/7.
//  Copyright © 2016年 chengxi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    kdateTypeToday,  // 今天
    kdateTypeTorrmow,  // 明天
    kdateTypeAfterTorrmow, // 后天
} dateType; // 三类

typedef enum : NSUInteger {
    kformatterTypeLineYear,  // 返回分割线的日期格式 2016-12-07 08:08:08
    kformatterTypeChineseYear,  // 返回文字的日期格式 2016年12月07日 08:08:08
    kformatterTypeLine, // 不带年份的分割线分割 12-07 08:08:08
    kformatterTypeChinese, // 不带年份的中文分割  12月07日 08:08:08
    kformatterTypeChineseNoSec, // 不带年份和秒数的中文分割  12月07日 08:08
    kformatterTypeLineNoSec, // 不带年份和秒数的分割线分割  12-07 08:08
    kformatterTypeLineNoSecAndMin, // 不带秒数、分钟的分割线分割  2016-12-07
    kformatterTypeChineseNoSecAndMin, // 不带秒数。分钟的中文分割  2016年12月07日
} formatterType; // 格式化日期

@interface NSDate (TDC)


/**
 根据 今天、明天、后天 得出 具体日期

 @return 返回日期的毫秒值
 */
+ (long long) getNowDate:(dateType)dtype;



/**
 根据毫秒值返回指定格式日期

 @param intverDate 毫秒值
 @param formattertype 日期格式
 @return 指定格式日期
 */
+ (NSString *) getFormatterDate:(long long)intverDate
                  formatterType:(formatterType)formattertype;


/**
 根据格式化的时间字符串返回 毫秒值

 @param formatterStr 具体时间字符串
 @param formatterType 格式化规则  @"yyyy-mm-ss"
 @return 毫秒值
 */
+ (long long) getMsecWithFormatter:(NSString *)formatterStr formatterType:(NSString *)formatterType;

@end
