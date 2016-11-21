

#import "UIImage+Fit.h"
#import "UIImage+ImageEffects.h"

@implementation UIImage (Fit)



#pragma mark 返回拉伸好的图片
+ (UIImage *)resizeImage:(NSString *)imgName {
    return [[UIImage imageNamed:imgName] resizeImage];
}

- (UIImage *)resizeImage
{
    CGFloat leftCap = self.size.width * 0.5f;
    CGFloat topCap = self.size.height * 0.5f;
    return [self stretchableImageWithLeftCapWidth:leftCap topCapHeight:topCap];
}

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)cutCircleImage {
    
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    // 获取上下文
    CGContextRef ctr = UIGraphicsGetCurrentContext();
    // 设置圆形
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctr, rect);
    // 裁剪
    CGContextClip(ctr);
    // 将图片画上去
    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
    
}

- (UIImage *)blurImage:(CGRect)rect
{
    CGImageRef rectImageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    UIImage *rectImage = [UIImage imageWithCGImage:rectImageRef];
    UIImage *blurImage = [rectImage applyBlurWithRadius:10 tintColor:nil saturationDeltaFactor:1.8 maskImage:nil];
    
    UIGraphicsBeginImageContext(self.size);
    [self drawAtPoint:CGPointMake(0, 0) blendMode:kCGBlendModeNormal alpha:1.0];
    [blurImage drawAtPoint:rect.origin blendMode:kCGBlendModeNormal alpha:1.0];
    
    //画灰色背景
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor colorWithHexValue:0x000000 alpha:0.6].CGColor);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
