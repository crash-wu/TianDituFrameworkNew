//
//  BaiduBUSUniqueTypeLine.h
//  TianDituFramework
//
//  Created by Lee on 16/4/25.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaiduBUSUniqueTypeNode.h"

@class BaiduMapPoint;

/**
 *  百度公交路线查询 —— 起/终点唯一检索路线类
 *  当搜索结果中 type == 2 时
 */
@interface BaiduBUSUniqueTypeLine : NSObject

// 方案距离（单位：米）
@property (nonatomic, strong) NSNumber *distance;

// 线路耗时（单位：秒）
@property (nonatomic, strong) NSNumber *duration;

// 路线总票价（单位：分）
@property (nonatomic, strong) NSNumber *price;

// 具体票价 {"line_type":0, "line_price": 200} type：0表示公交票价，1表示地铁票价
@property (nonatomic, strong) NSDictionary *line_price;

// 站点信息
@property (nonatomic, strong) NSArray<BaiduBUSUniqueTypeNode *> *steps;

// 方案类型
// 0（无方案），1（时间短），2（少换乘），3（少步行），4（上车站离起点近）
// 5（上车站离终点近），6（直达），7（无堵车风险），8（堵车风险小）
@property (nonatomic, strong) NSNumber *tip_label_type;

// 路况信息
// 0（无路况信息），1~10（正常），11~20（缓行），21~30（拥堵）
@property (nonatomic, strong) NSNumber *traffic_type;

// 起点经纬度坐标
@property (nonatomic, strong) BaiduMapPoint *originLocation;

// 终点经纬度坐标
@property (nonatomic, strong) BaiduMapPoint *destinationLocation;
@end
