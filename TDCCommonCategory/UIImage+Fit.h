
#import <UIKit/UIKit.h>

@interface UIImage (Fit)


/**
 返回拉伸好的图片（中心点填充、不会变形）
 @param imgName 图片名称
 */
+ (UIImage *)resizeImage:(NSString *)imgName;
- (UIImage *)resizeImage;


/**
 传入UIColor设置图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 设置圆角图像（比setlayer效率高）
 在设置完图片frame之后调用，否则可能无效
 */
- (UIImage *)cutCircleImage;


/**
 返回gifimage

 @param theData 本地图片资源
 @return
 */
+ (UIImage *)animatedImageWithAnimatedGIFData:(NSData *)theData;

/**
 返回gifimage
 
 @param theData 网络图片资源
 @return
 */
+ (UIImage *)animatedImageWithAnimatedGIFURL:(NSURL *)theURL;

@end
