//
//  UILabel+TDC.h
//  CityLove
//
//  Created by chengxi on 2016/11/22.
//  Copyright © 2016年 chengxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (TDC)


/**
 未传入frame 如果需要设置可以单独在代码中设置
 
 @param textColor    文字颜色
 @param fontSize     字体大小
 @param text         初始化文字
 @param textAligment 对齐方式
 @param isBold       是否加粗    0:不加粗    1：加粗
 @return  快速创建一个UILabel
 */
+ (UILabel *)setLabelWithTextColor:(UIColor *)textColor
                            fontSize:(NSInteger)fontSize
                            text:(NSString *)text
                            textAligment:(NSTextAlignment)textAligment
                            isBold:(BOOL)isBold;




@end
