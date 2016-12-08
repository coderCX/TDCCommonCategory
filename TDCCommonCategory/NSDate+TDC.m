//
//  NSDate+TDC.m
//  CityLove
//
//  Created by chengxi on 2016/12/7.
//  Copyright © 2016年 chengxi. All rights reserved.
//

#import "NSDate+TDC.h"

@implementation NSDate (TDC)

+ (long long) getNowDate:(dateType)dtype
{
    // 获取当前时间 时间戳(毫秒值)
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval interVal = [date timeIntervalSince1970];
    
    if (dtype==kdateTypeToday) // 今天
    {
        return interVal;
        
    }else if (dtype==kdateTypeTorrmow) //明天
    {
        interVal = interVal + 24 *3600;
        return interVal;
        
    }else if (dtype==kdateTypeAfterTorrmow) // 后天
    {
        interVal = interVal + 48 *3600;
        return interVal;
    }
    
    return 0;
}

+ (NSString *) getFormatterDate:(long long)intverDate
                  formatterType:(formatterType)formattertype
{

    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    if(formattertype==kformatterTypeLineYear) // 返回分割线的日期格式
    {
      [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        
    }else if (formattertype==kformatterTypeChineseYear)// 返回文字的日期格式
    {
      [formatter setDateFormat:@"yyyy年MM月dd日 HH:mm:ss"];
        
    }else if (formattertype==kformatterTypeLine)// 不带年份的分割线分割
    {
      [formatter setDateFormat:@"MM-dd HH:mm:ss"];
        
    }else if (formattertype==kformatterTypeChinese)// 不带年份的中文分割
    {
      [formatter setDateFormat:@"MM月dd日 HH:mm:ss"];
        
    }else if (formattertype==kformatterTypeChineseNoSec)// 不带年份和秒数的中文分割
    {
      [formatter setDateFormat:@"MM月dd日 HH:mm"];
        
    }else if (formattertype==kformatterTypeLineNoSec)// 不带年份和秒数的分割线分割
    {
      [formatter setDateFormat:@"MM-dd HH:mm"];
        
    }else if (formattertype==kformatterTypeLineNoSecAndMin)// 不带秒数/分钟的分割线分割
    {
        [formatter setDateFormat:@"yyyy-MM-dd"];
        
    }else if (formattertype==kformatterTypeChineseNoSecAndMin)// 不带秒数、分钟的中文
    {
        [formatter setDateFormat:@"yyyy年MM月dd日"];
        
    }
    
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:intverDate];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

+ (long long)getMsecWithFormatter:(NSString *)formatterStr formatterType:(NSString *)formatterType
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatterType];
    NSDate* date = [formatter dateFromString:formatterStr];
    return [date timeIntervalSince1970];
}

@end
