//
//  BaiduDrivingUniqueTypeResult.h
//  TianDituFramework
//
//  Created by Lee on 16/4/26.
//  Copyright © 2016年 crash. All rights reserved.
//

#import "BaiduDrivingSearchResult.h"
#import "BaiduDrivingUniqueTypeScheme.h"

@class BaiduTaxiScheme;

/**
 *  百度驾车路线查询 —— 起/终点唯一检索路线类
 *  当搜索结果中 type == 2 时
 */
@interface BaiduDrivingUniqueTypeResult : NSObject <BaiduDrivingSearchResultType>

/**
 *  驾车路线方案
 */
@property (nonatomic, strong) NSArray<BaiduDrivingUniqueTypeScheme *> *routes;

/**
 *  起点信息
 *  { "area_id": 131,
 *    "bid":"10996880",
 *    "cname": "北京市",
 *    "uid": "7ad2b0a165df78a85b1093bc",
 *    "wd": "上地五街",
 *    "originPt": {"lng": 116.311, "lat": 40.045 }}
 */
@property (nonatomic, strong) NSDictionary *origin;

/**
 *  终点信息
 *  { "area_id": 131,
 *    "bid": "12111230816633752856",
 *    "cname": "北京市",
 *    "uid": "ddfd7c2d8db36cf39ee3219e",
 *    "wd": "北京大学",
 *    "destinationPt": {"lng": 116.310, "lat": 40.001 }}
 */
@property (nonatomic, strong) NSDictionary *destination;


/**
 *  出租车方案
 */
@property (nonatomic, strong) BaiduTaxiScheme *taxi;


/**
 *  路况评价
 *    0：无路况
 *    1：畅通
 *    2：缓行
 *    3：拥堵
 */
@property (nonatomic, strong) NSNumber *traffic_condition;
@end


#pragma mark - BaiduTaxiScheme
/**
 *  百度出租车方案
 */
@interface BaiduTaxiScheme : NSObject

/**
 *  方案详细价格
 *  每一项元素格式如下：
 *    { "desc": "白天（05:00-23:00）",
 *      "km_price": "2.3",
 *      "start_price": "13.0",
 *      "total_price": "21" }
 */
@property (nonatomic, strong) NSArray *detail;

/**
 *  方案距离（单位：米）
 */
@property (nonatomic, strong) NSNumber *distance;

/**
 *  线路耗时（单位：秒）
 */
@property (nonatomic, strong) NSNumber *duration;

/**
 *  详细信息
 */
@property (nonatomic, copy) NSString *remark;
@end
