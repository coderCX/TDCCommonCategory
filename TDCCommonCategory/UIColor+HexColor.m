//
//  UIColor+HexColor.m
//  JRCS
//
//  Created by liuyu on 15/5/12.
//  Copyright (c) 2015年 liuyu. All rights reserved.
//

#import "UIColor+HexColor.h"

@implementation UIColor (HexColor)

+ (UIColor *)colorWithHexValue:(NSInteger)hexValue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 green:((float)((hexValue & 0xFF00) >> 8))/255.0 blue:((float)(hexValue & 0xFF))/255.0 alpha:alpha];
}


@end
