//
//  SouthgisBaseMapService.h
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/29.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "SouthgisArcGisExtenHeadFile.h"
#import "SouthgisBaseRequest.h"
#import "YYModel.h"

#pragma mark - Define

#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define DLog(...)
#endif



/**
 *  自定义 Error 标识符
 */
extern NSString * _Nonnull const SouthgisErrorDomain;

/**
 *  自定义 Error Code
 */
typedef NS_ENUM(NSInteger, SouthgisErrorCode) {
    BaiduWebServerErrorInvalidServiceType   = -8001,  // 无效的服务类型
    BaiduWebServerErrorNullResponse         = -8002,  // 空响应报文
    BaiduWebServerErrorInvalidResponseData  = -8003,  // 无效的响应数据
};

/**
 *  @author crash         crash_wu@163.com   , 16-03-31 14:03:10
 *
 *  @brief  地图业务搜索类(POI ,公交，路线搜索等等)
 */
@interface SouthgisBaseMapService : SouthgisBaseRequest


/**
 *  @author crash         crash_wu@163.com   , 16-04-27 09:04:07
 *
 *  @brief 转换非URL规范字符
 *
 *  @param str 需要转化的字符串
 *
 *  @return 返回转化成功的字符串
 */
- (nonnull NSString *)p_stringByURLEncode:(nonnull NSString *)str;

@end
