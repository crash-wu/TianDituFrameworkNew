//
//  BaiduDrivingFuzzyTypeResult.h
//  TianDituFramework
//
//  Created by Lee on 16/4/26.
//  Copyright © 2016年 crash. All rights reserved.
//

#import "BaiduDrivingSearchResult.h"
#import "BaiduDrivingFuzzyTypeNode.h"

/**
 *  百度驾车路线查询 —— 起/终点模糊检索结果类
 *  当搜索结果中 type == 1 时
 */
@interface BaiduDrivingFuzzyTypeResult : NSObject <BaiduDrivingSearchResultType>

/**
 *  起点信息
 *    { "area_id": 131,
 *      "wd": "人大",
 *      "uid": "" }
 */
@property (nonatomic, strong) NSDictionary *originInfo;

/**
 *  终点信息
 *    {"area_id": 131,
 *    "wd": "北京大学",
 *    "uid": ""}
 */
@property (nonatomic, strong) NSDictionary *destinationInfo;

/**
 *  模糊匹配的起点
 */
@property (nonatomic, strong) BaiduDrivingFuzzyTypeNode *origin;

/**
 *  模糊匹配的终点
 */
@property (nonatomic, strong) BaiduDrivingFuzzyTypeNode *destination;
@end
