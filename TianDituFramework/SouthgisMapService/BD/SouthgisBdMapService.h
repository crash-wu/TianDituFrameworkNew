//
//  SouthgisBdMapService.h
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/31.
//  Copyright © 2016年 crash. All rights reserved.
//

#import "SouthgisBaseMapService.h"
#import "BdBusLineSearchKeyword.h"
#import "BdPOISearchKeyWord.h"
#import "BdPOIResult.h"
#import "BdCarLineSearchKeyword.h"



/**
 *  百度 Web 服务类型
 */
typedef NS_ENUM(NSUInteger, BaiduWebServerType) {
    BaiduWebServerPOI           = 1,  // POI检索服务
    BaiduWebServerDirection     = 2,  // 驾车、骑行、步行检索服务
    BdCarLineDirection =3//公交
};



/**
 *  @author crash         crash_wu@163.com   , 16-03-31 14:03:40
 *
 *  @brief  百度（瓦片）地图POI搜索，公交，驾车搜索
 */
@interface SouthgisBdMapService : SouthgisBaseMapService



/**
 *  @author crash         crash_wu@163.com   , 16-03-16 10:03:32
 *
 *  @brief  百度地图POI搜索
 *
 *  @param keyWord 搜索类型实体
 *  @param success       搜索成功返回Block
 
 *  @discussion success block 中的 object 类型是一个
            NSArray<BdPOIResult*> 的数组
 
 *      Example:
        success=^(id objcet){
            NSArray<BdPOIResult*> *array=(NSArray*)object;
 
        }
 
 *  @param failed        失败block
 */
-(void)poiSearch:(nonnull BdPOISearchKeyWord *)keyWordEntity success:(nullable SuccessBlock)success failed:(nullable FailedBlock)failed;



/**
 *  @author crash         crash_wu@163.com   , 16-04-26 10:04:25
 *
 *  @brief  百度地图公交路线搜索
 *
 *  @param entity  公交路线搜索实体
 *  @param success 搜索成功返回block
 *  @discussion success block 中的 object 类型是一个
        BaiduWebServiceBUSResultType类型实体
 
 *      Example:
        success=^(id objcet){
            BaiduWebServiceBUSResultType *result=(BaiduWebServiceBUSResultType*)objcet ;
            if(result.type== ACCUTATE_TYPE ){
                //如果是精准查询
                 BaiduBUSUniqueTypeResult *subR=(BaiduBUSUniqueTypeResult *)result.result;
            }else{
 
                //如何是模糊查询
                BaiduBUSFuzzyTypeLine *subR=(BaiduBUSFuzzyTypeLine*)result.result;
            }
        }
 *  @param failed  失败搜索返回
 */
-(void)busLineSearch:(nonnull BdBusLineSearchKeyword *)entity success:(nullable SuccessBlock)success failed:(nullable FailedBlock)failed;



/**
 *  @author crash         crash_wu@163.com   , 16-04-26 16:04:19
 *
 *  @brief  百度地图驾车路线查询
 *
 *  @param driverEntity 驾车路线查询实体
 *  @param success      返回成功Block
 
 *  @discussion success block 中的 object 类型是一个
        BaiduDrivingSearchResult类型实体
 
 *      Example:
            success=^(id objcet){
                BaiduDrivingUniqueTypeResult *result=(BaiduDrivingUniqueTypeResult*)objcet ;
                if(result.type== ACCUTATE_TYPE ){
                    //如果是精准查询
                    BaiduBUSUniqueTypeResult *subR=(BaiduBUSUniqueTypeResult *)result.result;
                    }else{
 
                        //如何是模糊查询
                        BaiduDrivingFuzzyTypeResult *subR=(BaiduDrivingFuzzyTypeResult*)result.result;
                    }
        }
 *  @param fail         失败
 */
-(void)carLineSearch:(nonnull BdCarLineSearchKeyword *)driverEntity success:(nonnull SuccessBlock)success andFail:(nonnull FailedBlock)fail;

@end
