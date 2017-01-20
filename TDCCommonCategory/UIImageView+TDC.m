//
//  UIImageView+TDC.m
//  CityLove
//
//  Created by chengxi on 2016/12/20.
//  Copyright © 2016年 chengxi. All rights reserved.
//

#import "UIImageView+TDC.h"

@implementation UIImageView (TDC)

- (void)addBlurEffectWithRect:(CGRect)rect
{
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.frame = CGRectMake(rect.origin.x,rect.origin.y,rect.size.width, rect.size.height);
    effectView.alpha = .85f;
    [self addSubview:effectView];
}

@end
