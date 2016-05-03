//
//  SouthgisAGSQuerty.h
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/21.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ArcGIS/ArcGIS.h>

/**
 *  @author crash         crash_wu@163.com   , 16-03-21 17:03:07
 *
 *  @brief  属性查询代理
 */
@protocol SouthgisAGSQuertyDelegate <NSObject>


/**
 *  @author crash         crash_wu@163.com   , 16-03-21 17:03:52
 *
 *  @brief  属性查询成功
 *
 *  @param featureSet 查询结果
 */
-(void)quertyWithFeatureSetResult:(AGSFeatureSet*)featureSet;



/**
 *  @author crash         crash_wu@163.com   , 16-03-21 17:03:57
 *
 *  @brief  属性查询失败
 *
 *  @param error 失败原因
 */
-(void)quertyDidFailWithError:(NSError *)error;

@end




/**
 *  @author crash         crash_wu@163.com   , 16-03-21 17:03:30
 *
 *  @brief  属性查询
 */
@interface SouthgisAGSQuerty : NSObject


@property(nonatomic,assign) id<SouthgisAGSQuertyDelegate>southgisAGSQuertyDelegate;

@property(nonatomic,strong) AGSQueryTask *queryTask;


/**
 *  @author crash         crash_wu@163.com   , 16-03-22 10:03:40
 *
 *  @brief  初始化查询对象
 *
 *  @param URL   查询的URL
 *  @param query AGSQueryTask 操作参数
 *
 *  @return 查询对象
 */
-(instancetype)initWithURL:(NSString *)URL andQuery:(AGSQuery *)query;



@end
