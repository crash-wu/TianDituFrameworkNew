//
//  BaiduWebServiceBUSResult.h
//  TianDituFramework
//
//  Created by Lee on 16/4/25.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaiduWebServiceBUSResultType <NSObject>
@end

/**
 *  @author crash         crash_wu@163.com   , 16-04-26 10:04:09
 *
 *  @brief  百度地图路线搜索结果类型(模糊查询，精准查询)
 */
typedef NS_ENUM(NSInteger,BdLineResultType){
    /**
     *  @author crash         crash_wu@163.com   , 16-04-26 10:04:09
     *
     *  @brief  模糊结果
     */
    FUZZY_TYPE =1,
    /**
     *  @author crash         crash_wu@163.com   , 16-04-26 10:04:09
     *
     *  @brief  精准结果
     */
    ACCUTATE_TYPE =2
};

/**
 *  @author crash         crash_wu@163.com   , 16-04-26 10:04:45
 *
 *  @brief  百度地图路线搜索结果
 */
@interface BaiduWebServiceBUSResult : NSObject
@property (nonatomic, assign) BdLineResultType type;//返回数据类型,1：起终点是模糊的，此时给出的是选择页面；2：起终点都是明确的，直跳
@property (nonatomic, strong) id<BaiduWebServiceBUSResultType> result;//返回的结果
@end
