//
//  UIBarButtonItem+TDC.m
//  CityLove
//
//  Created by chengxi on 2016/12/3.
//  Copyright © 2016年 chengxi. All rights reserved.
//

#import "UIBarButtonItem+TDC.h"
#import "UIView+TDC.h"

@implementation UIBarButtonItem (TDC)

+ (NSArray *) allocBarRightButtonItemWithTitle:(NSString *)title
                                          size:(CGSize)size
                                        margin:(CGFloat)margin
                                  targetAction:(SEL)targetAction
                                           sel:(id)sel
                                        color:(UIColor *)color
                                          font:(CGFloat)font{
    
    UIButton *backButton =  [[UIButton alloc] init];
    backButton.tdc_size = size;
    backButton.titleLabel.font = [UIFont systemFontOfSize:font];
    backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [backButton setTitle:title forState:UIControlStateNormal];
    [backButton setTitleColor:color forState:UIControlStateNormal];
    [backButton addTarget:sel action:targetAction forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = margin;//占位
    return @[negativeSpacer,[[UIBarButtonItem alloc] initWithCustomView:backButton]];
}

+ (NSArray *) allocBarLeftButtonItemWithTitle:(NSString *)title
                                         size:(CGSize)size
                                       margin:(CGFloat)margin
                                 targetAction:(SEL)targetAction
                                  sel:(id)sel
                                    color:(UIColor *)color
                                         font:(CGFloat)font{
    UIButton *backButton =  [[UIButton alloc] init];
    backButton.tdc_size = size;
    backButton.titleLabel.font = [UIFont systemFontOfSize:font];
    backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [backButton setTitle:title forState:UIControlStateNormal];
    [backButton setTitleColor:color forState:UIControlStateNormal];
    [backButton addTarget:sel action:targetAction forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = margin;//占位
    return @[negativeSpacer,[[UIBarButtonItem alloc] initWithCustomView:backButton]];
}

+ (NSArray *) allocBarButtonItemWithImage:(UIImage *)image
                                     size:(CGSize)size
                                   margin:(CGFloat)margin
                             targetAction:(SEL)targetAction
                              sel:(id)sel
                                     font:(CGFloat)font{
    UIButton *backButton =  [[UIButton alloc] init];
    backButton.tdc_size = size;
    [backButton setImage:image forState:UIControlStateNormal];
    [backButton addTarget:sel action:targetAction forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = margin;//占位
    return @[negativeSpacer,[[UIBarButtonItem alloc] initWithCustomView:backButton]];
}

@end
