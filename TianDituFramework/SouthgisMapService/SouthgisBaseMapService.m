//
//  SouthgisBaseMapService.m
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/29.
//  Copyright © 2016年 crash. All rights reserved.
//

#import "SouthgisBaseMapService.h"


NSString *const SouthgisErrorDomain = @"com.Southgis.TianDituFramework.Error";

@implementation SouthgisBaseMapService


// 私有方法，转换非URL规范字符
/**
 *  @author crash         crash_wu@163.com   , 16-04-27 09:04:07
 *
 *  @brief 转换非URL规范字符
 *
 *  @param str 需要转化的字符串
 *
 *  @return 返回转化成功的字符串
 */
- (nonnull NSString *)p_stringByURLEncode:(nonnull NSString *)str {
    static NSString * const kAFCharactersGeneralDelimitersToEncode = @":#[]@?/";
    static NSString * const kAFCharactersSubDelimitersToEncode = @"!$&'()*+,;=";
    
    NSMutableCharacterSet * allowedCharacterSet = [[NSCharacterSet URLQueryAllowedCharacterSet] mutableCopy];
    [allowedCharacterSet removeCharactersInString:[kAFCharactersGeneralDelimitersToEncode stringByAppendingString:kAFCharactersSubDelimitersToEncode]];
    static NSUInteger const batchSize = 50;
    
    NSUInteger index = 0;
    NSMutableString *escaped = @"".mutableCopy;
    
    while (index < str.length) {
        NSUInteger length = MIN(str.length - index, batchSize);
        NSRange range = NSMakeRange(index, length);
        range = [str rangeOfComposedCharacterSequencesForRange:range];
        NSString *substring = [str substringWithRange:range];
        NSString *encoded = [substring stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacterSet];
        [escaped appendString:encoded];
        
        index += range.length;
    }
    return escaped;
}

@end
