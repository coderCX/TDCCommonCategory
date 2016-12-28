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

+(void)moveAlertWithContent:(NSString *)content
                   backView:(UIView *)backView
                   isHidden:(BOOL)isHidden
                 isShowHorn:(BOOL)isShowHorn
   animateWithDurationBegin:(NSInteger)animateWithDurationBegin
     animateWithDurationEnd:(NSInteger)animateWithDurationEnd
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = TDCNavgationColor;
    [backView addSubview:view];
    
    UILabel *label = [UILabel setLabelWithTextColor:[UIColor whiteColor]
                                           fontSize:13 text:content
                                       textAligment:NSTextAlignmentLeft
                                             isBold:NO];
    UIImageView *hornView;
    // 如果需要显示 小喇叭
    if (isShowHorn){
        hornView = [[UIImageView alloc] initWithImage:[UIImage resizeImage:@"ic_laba"]]; // 54*52
        hornView.frame = CGRectMake(kMargin,2,26,27);
        [view addSubview:hornView];
    }
    if (isShowHorn) {
        label.tdc_w = TDC_SCREEN_WIDTH - 2*kMargin - 26;
        label.tdc_x = 2*kMargin + 26;
    }else{
        label.tdc_w = TDC_SCREEN_WIDTH - 2*kMargin;
        label.tdc_x = kMargin;
    }
    label.numberOfLines = 0;
    label.backgroundColor = TDCNavgationColor;
    CGSize tempSize = [label sizeThatFits:CGSizeMake(label.tdc_w,80)];
    label.tdc_y = 0;
    if (isShowHorn){
        if (tempSize.height>=29) {
            label.tdc_h = tempSize.height;
        }else{
            label.tdc_h = 29;
        }
    }else{
        label.tdc_h = tempSize.height;
    }
    view.frame = CGRectMake(0,-label.tdc_h,TDC_SCREEN_WIDTH,label.tdc_h);
    [view addSubview:label];
    [UIView animateWithDuration:animateWithDurationBegin animations:^{
        // 往下移动一个label的高度
        view.transform = CGAffineTransformMakeTranslation(0,label.tdc_h);
    } completion:^(BOOL finished) { // 向下移动完毕
        if (isHidden) {
            [UIView animateWithDuration:animateWithDurationBegin delay:animateWithDurationEnd options:UIViewAnimationOptionCurveEaseInOut animations:^{
                // 恢复到原来的位置
                view.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                // 删除控件
                [view removeFromSuperview];
            }];
        }
    }];
}

@end
