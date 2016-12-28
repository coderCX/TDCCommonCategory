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

/**
 从导航栏下面掉出来一个提示框 （无小喇叭）
 @param content 内容
 @param backView 当前出现的VIew上面
 @param isHidden 是否自动隐藏
 @param isShowHorn 是否显示小喇叭
 @param animateWithDurationBegin 往下掉的时间
 @param animateWithDurationEnd 多长时间后自动回收
 */
+(void)moveAlertWithContent:(NSString *)content
                   backView:(UIView *)backView
                   isHidden:(BOOL)isHidden
                 isShowHorn:(BOOL)isShowHorn
   animateWithDurationBegin:(NSInteger)animateWithDurationBegin
     animateWithDurationEnd:(NSInteger)animateWithDurationEnd;
@end
