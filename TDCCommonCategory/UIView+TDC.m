//
//  UIView+TDC.m
//  1111
//
//  Created by chengxi on 16/11/20.
//  Copyright © 2016年 chengxi. All rights reserved.
//

#import "UIView+TDC.h"
#import "UILabel+TDC.h"

#define kMargin 10
@implementation UIView (TDC)

- (void)setTdc_x:(CGFloat)tdc_x
{
    CGRect frame = self.frame;
    frame.origin.x = tdc_x;
    self.frame = frame;
}

- (CGFloat)tdc_x
{
    return self.frame.origin.x;
}

- (void)setTdc_y:(CGFloat)tdc_y
{
    CGRect frame = self.frame;
    frame.origin.y = tdc_y;
    self.frame = frame;
}

- (CGFloat)tdc_y
{
    return self.frame.origin.y;
}

- (void)setTdc_w:(CGFloat)tdc_w
{
    CGRect frame = self.frame;
    frame.size.width = tdc_w;
    self.frame = frame;
}

- (CGFloat)tdc_w
{
    return self.frame.size.width;
}

- (void)setTdc_h:(CGFloat)tdc_h
{
    CGRect frame = self.frame;
    frame.size.height = tdc_h;
    self.frame = frame;
}

- (CGFloat)tdc_h
{
    return self.frame.size.height;
}

- (void)setTdc_size:(CGSize)tdc_size
{
    CGRect frame = self.frame;
    frame.size = tdc_size;
    self.frame = frame;
}

- (CGSize)tdc_size
{
    return self.frame.size;
}

- (void)setTdc_origin:(CGPoint)tdc_origin
{
    CGRect frame = self.frame;
    frame.origin = tdc_origin;
    self.frame = frame;
}

- (CGPoint)tdc_origin
{
    return self.frame.origin;
}

- (CGFloat)tdc_centerY{
    return self.center.y;
}

- (CGFloat)tdc_centerX{
    return self.center.y;
}

- (void)setTdc_centerX:(CGFloat)tdc_centerX{
    CGPoint tempF = self.center;
    tempF.x = tdc_centerX;
    self.center = tempF;
}

- (void)setTdc_centerY:(CGFloat)tdc_centerY{
    CGPoint tempF = self.center;
    tempF.y = tdc_centerY;
    self.center = tempF;
}


@end
