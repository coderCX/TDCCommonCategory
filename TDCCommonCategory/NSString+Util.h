//
//  NSString+Util.h
//  NetPhone
//  字符串处理帮助类
//  Created by common on 13-3-8.
//  Copyright (c) 2013年 Youzx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Util)

/**
 *  str串是否是空串
 */
+ (BOOL)isEmpty:(NSString *)str;

/**
 *  返回过滤了空格换行的新串:(首尾的空格)
 */
+ (NSString *)trim:(NSString *)dirtyString;

/**
 *  返回经过MD5加密串
 */
- (NSString *)md5String;

/**
 *  过滤html标签
 */
+ (NSString *)html2Text:(NSString *)html;

/**
 *  生成DBID
 */
+ (NSString *)createDbId;

/**
 * 获取文本绘制空间大小
 */
+(CGSize) contentSizeOfStr:(NSString *) str withFont:(UIFont*)font constrainedToSize:(CGSize) size;

/**
 * 获取UUID
 */

+ (NSString *)uuid;

@end
