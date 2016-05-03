//
//  SouthgisTdtMapService.h
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/29.
//  Copyright © 2016年 crash. All rights reserved.
//

#import "SouthgisBaseMapService.h"
#import "TdtPOIResult.h"
#import "CarLine.h"
#import "BusLine.h"
#import "BusLineSearch.h"
#import "CarLineSearch.h"
#import "TdtPOISearchKeyWord.h"


/**
 *  @author crash         crash_wu@163.com   , 16-03-31 14:03:36
 *
 *  @brief  天地图POI搜索，公交，驾车路线搜索类
 */
@interface SouthgisTdtMapService : SouthgisBaseMapService


/**
 *  @author crash         crash_wu@163.com   , 16-03-16 10:03:32
 *
 *  @brief  天地图POI搜索
 *
 *  @param keyWordEntity 搜索类型实体
 *  @param success       搜索成功返回Block
 
 *  @discussion success block 中的 object 类型是一个NSArray<TdtPOIResult*> 的数组
 
 *      Example:
        success=^(id objcet){
            //如果是天地图
            NSArray<TdtPOIResult*> *array=(NSArray*)object;
        }
 
 *  @param failed        失败block
 */
-(void)poiSearch:( TdtPOISearchKeyWord *)keyWordEntity success:(SuccessBlock)success failed:(FailedBlock)failed;


/**
 *  @author crash         crash_wu@163.com   , 16-03-17 11:03:18
 *
 *  @brief  驾车路线规划
 *  @discussion success block 中的 object 类型是一个CarLine类型
 
 *      Example:
 success=^(id objcet){
 
 CarLine *line=(CarLine*)object;
 }
 *  @param driverEntity 驾车路线请求参数实体
 *  @param success      路线请求成功bolck
 *  @param fail         路线请求失败bolck
 */
-(void)carLineSearch :(CarLineSearch *)driverEntity success:(SuccessBlock)success andFail:(FailedBlock)fail;

/**
 *  @author crash         crash_wu@163.com   , 16-03-17 13:03:18
 *
 *  @brief  天地图公交路线查询
 *  @discussion success block 中的 object 类型是一个BusLine类型的数组
 
 *      Example:
 success=^(id objcet){
 
 NSArray<BusLine *> array=(NSArray*)object
 }
 *  @param entity  公交路线请求参数实体
 *  @param success 路线请求成功bolck
 *  @param failed  路线请求失败bolck
 */
-(void)busLineSearch:(BusLineSearch *)entity success:(SuccessBlock)success failed:(FailedBlock)failed;

@end
