//
//  UIView+TDC.h
//  1111
//
//  Created by chengxi on 16/11/20.
//  Copyright © 2016年 chengxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (TDC)
@property (assign, nonatomic) CGFloat tdc_x;
@property (assign, nonatomic) CGFloat tdc_y;
@property (assign, nonatomic) CGFloat tdc_w;
@property (assign, nonatomic) CGFloat tdc_h;
@property (assign, nonatomic) CGSize tdc_size;
@property (assign, nonatomic) CGPoint tdc_origin;
@property (nonatomic, assign) CGFloat tdc_centerX;
@property (nonatomic, assign) CGFloat tdc_centerY;

@end
