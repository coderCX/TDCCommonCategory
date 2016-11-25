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




/**
 设置Label的富文本属性  可以设置label的行间距、字体等

 @param text      文本内容
 @param lineSpace 行间距
 @param fontSize  字体大小
 @param fontName  字体名称
 */
- (void)setLineText:(NSString *)text lineSpace:(NSInteger)lineSpace fontSize:(NSInteger)fontSize
           fontName:(NSString *)fontName;
@end
