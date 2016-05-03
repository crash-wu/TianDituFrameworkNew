//
//  BaiduDrivingSearchResult.h
//  TianDituFramework
//
//  Created by Lee on 16/4/26.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  百度驾车方案结果类
 */
@protocol BaiduDrivingSearchResultType <NSObject>
@end


@interface BaiduDrivingSearchResult : NSObject
/**
 *  状态码：
 *    0：成功
 *    2：参数错误
 *    5：权限或配额校验失败
 */
@property (nonatomic, strong) NSNumber *status;

/**
 *  返回数据类型：
 *    1：起/终点是模糊的，需要转为'BaiduDrivingUniqueTypeResult'类
 *    2：起/终点都是明确的，需要转为''
 */
@property (nonatomic, strong) NSNumber *type;

/**
 *  驾车方案结果，根据type确定具体的类型
 */
@property (nonatomic, strong) id<BaiduDrivingSearchResultType> result;
@end
