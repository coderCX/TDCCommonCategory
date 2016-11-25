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

- (void)setLineText:(NSString *)text lineSpace:(NSInteger)lineSpace fontSize:(NSInteger)fontSize
           fontName:(NSString *)fontName{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];//调整行间距
    [self setFont:[UIFont fontWithName:fontName size:fontSize]];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    self.attributedText = attributedString;
    self.lineBreakMode = NSLineBreakByWordWrapping|NSLineBreakByTruncatingTail;
}

@end
