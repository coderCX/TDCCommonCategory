//
//  UILabel+TDC.m
//  CityLove
//
//  Created by chengxi on 2016/11/22.
//  Copyright © 2016年 chengxi. All rights reserved.
//

#import "UILabel+TDC.h"

@implementation UILabel (TDC)

+ (UILabel *)setLabelWithTextColor:(UIColor *)textColor
                          fontSize:(NSInteger)fontSize
                              text:(NSString *)text
                        textAligment:(NSTextAlignment)textAligment
                            isBold:(BOOL)isBold{
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.textColor = textColor;
    if(isBold){
      titleLabel.font = [UIFont boldSystemFontOfSize:fontSize];
    }else{
      titleLabel.font = [UIFont systemFontOfSize:fontSize];
    }
    titleLabel.text = text;
    [titleLabel sizeToFit];
    titleLabel.textAlignment = textAligment;
    return titleLabel;
}

@end
