//
//  NSString+Util.m
//  NetPhone
//
//  Created by baizhen on 12-8-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NSString+Util.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Util)

+ (BOOL)isEmpty:(NSString *)str{
    if (str==nil) {
        return YES;
    }
    if ([str isKindOfClass:[NSNull class]]) {
        return YES;
    }
    NSString *tmpStr = [NSString trim:str];
    if ([@"" isEqualToString:tmpStr]||[@"(null)" isEqualToString:tmpStr]) {
        return YES;
    }
    return NO;
}

+(NSString *)trim:(NSString *)dirtyString{
    if (dirtyString==nil) {
        return nil;
    }
    return [dirtyString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)md5String
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, strlen(cStr), result );
    return [[NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3], 
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]] lowercaseString];
}

+ (NSString *)html2Text:(NSString *)html
{
    static NSString *regEx_script = @"<[\\s]*?script[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?script[\\s]*?>";
    static NSString *regEx_style = @"<[\\s]*?style[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?style[\\s]*?>";
    static NSString *regEx_html = @"<[^>]+>";
    static NSString *regEx_html1 = @"<[^>]+";
    
    NSMutableString *mutableHtml = [NSMutableString stringWithString:html];
    [mutableHtml replaceOccurrencesOfString:@"&lt;" withString:@"<" options:NSLiteralSearch range:NSMakeRange(0, [mutableHtml length])];
    [mutableHtml replaceOccurrencesOfString:@"&gt;" withString:@">" options:NSLiteralSearch range:NSMakeRange(0, [mutableHtml length])];
    [mutableHtml replaceOccurrencesOfString:@"&nbsp;" withString:@" " options:NSLiteralSearch range:NSMakeRange(0, [mutableHtml length])];
    [mutableHtml replaceOccurrencesOfString:@"|" withString:@"" options:NSLiteralSearch range:NSMakeRange(0, [mutableHtml length])];
    
    NSRegularExpression *m_script = [NSRegularExpression regularExpressionWithPattern:regEx_script options:NSRegularExpressionCaseInsensitive|NSRegularExpressionDotMatchesLineSeparators error:nil];
    NSRegularExpression *m_style = [NSRegularExpression regularExpressionWithPattern:regEx_style options:NSRegularExpressionCaseInsensitive|NSRegularExpressionDotMatchesLineSeparators error:nil];
    NSRegularExpression *m_html = [NSRegularExpression regularExpressionWithPattern:regEx_html options:NSRegularExpressionCaseInsensitive|NSRegularExpressionDotMatchesLineSeparators error:nil];
    NSRegularExpression *m_html1 = [NSRegularExpression regularExpressionWithPattern:regEx_html1 options:NSRegularExpressionCaseInsensitive|NSRegularExpressionDotMatchesLineSeparators error:nil];
    
    [m_script replaceMatchesInString:mutableHtml options:NSMatchingReportCompletion range:NSMakeRange(0, [mutableHtml length]) withTemplate:@""];
    [m_style replaceMatchesInString:mutableHtml options:NSMatchingReportCompletion range:NSMakeRange(0, [mutableHtml length]) withTemplate:@""];
    [m_html replaceMatchesInString:mutableHtml options:NSMatchingReportCompletion range:NSMakeRange(0, [mutableHtml length]) withTemplate:@""];
    [m_html1 replaceMatchesInString:mutableHtml options:NSMatchingReportCompletion range:NSMakeRange(0, [mutableHtml length]) withTemplate:@""];
    
    return mutableHtml;
}

//生成DBID
+ (NSString *)createDbId
{
    // Create universally unique identifier (object)
    NSMutableArray *zh= [NSMutableArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z",nil] ;
    //        CGLog(@"LENGTH=%d",[zh count]);
    int i=0;
    NSMutableString *s=[[NSMutableString alloc]init] ;
    while (i<32) {
        [s appendString:[zh objectAtIndex:arc4random()%62]];
        i++;
        //CGLog(@"%d",arc4random()%36);
    }
    // CGLog(@"id==%@",s);
    return s;
}

/**
 * 获取文本绘制空间大小
 */
+(CGSize) contentSizeOfStr:(NSString *) str withFont:(UIFont*)font constrainedToSize:(CGSize) size {
    CGSize contentSize = CGSizeMake(0, 0);
    if (!str || str.length == 0) {
        return contentSize;
    }
    if (iOS7) {
        // 获取该段attributedString的属性字典
        NSDictionary *attribute = @{NSFontAttributeName:font};
        // 计算文本的大小
        contentSize = [str boundingRectWithSize:size
                                        options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    }else if(IOS6){
        NSDictionary *attrs = @{NSFontAttributeName: font};
        NSAttributedString *attribStr = [[NSAttributedString alloc] initWithString:str attributes:attrs];
        contentSize = [attribStr boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading context:nil].size;
    } else {
        contentSize = [str sizeWithFont:font constrainedToSize:size];
    }
    return contentSize;
}

- (NSString *)sha1
{
    // see http://www.makebetterthings.com/iphone/how-to-get-md5-and-sha1-in-objective-c-ios-sdk/
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, data.length, digest);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}

+ (NSString *)uuid
{
    CFUUIDRef puuid = CFUUIDCreate( nil );
    CFStringRef uuidString = CFUUIDCreateString( nil, puuid );
    NSString * result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));
    CFRelease(puuid);
    CFRelease(uuidString);
    return result;
}

@end
