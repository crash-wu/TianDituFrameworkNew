//
//  BaiduBUSUniqueTypeNode.h
//  TianDituFramework
//
//  Created by Lee on 16/4/25.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BaiduMapPoint;

@class BaiduBUSUniqueTypeStationInfo;

/**
 *  百度公交路线查询 —— 起/终点唯一检索站点类
 *  当搜索结果中 type == 2 时
 */
@interface BaiduBUSUniqueTypeNode : NSObject

// 路段距离（单位：米）
@property (nonatomic, strong) NSNumber      *distance;

// 路段耗时（单位：米）
@property (nonatomic, strong) NSNumber      *duration;

// 路段位置坐标描述
@property (nonatomic, copy  ) NSString      *path;

// 路段类型
// 1（火车），2（飞机），3（公交），4（驾车），5（步行），6（大巴）
@property (nonatomic, strong) NSNumber      *type;

// 起点经纬度
@property (nonatomic, strong) BaiduMapPoint *stepOriginLocation;

// 目标点经纬度
@property (nonatomic, strong) BaiduMapPoint *stepDestinationLocation;

// 路段描述
@property (nonatomic, copy  ) NSString      *stepInstruction;

// 途径兴趣点poi信息
@property (nonatomic, strong) NSArray  *pois;

// 公交站信息
@property (nonatomic, strong) BaiduBUSUniqueTypeStationInfo *vehicle;
@end




#pragma mark - BaiduBUSUniqueTypeStationInfo
/**
 *  公交站信息
 */
@interface BaiduBUSUniqueTypeStationInfo : NSObject

// 公交线路id
@property (nonatomic, copy) NSString *uid;

// 公交线路名称
@property (nonatomic, copy) NSString *name;

// 公交路线起点id
@property (nonatomic, copy) NSString *start_uid;

// 公交路线终点id
@property (nonatomic, copy) NSString *end_uid;

// 公交路线起点名称
@property (nonatomic, copy) NSString *start_name;

// 公交路线终点名称
@property (nonatomic, copy) NSString *end_name;

// 首班车时间
@property (nonatomic, copy) NSString *start_time;

// 末班车时间
@property (nonatomic, copy) NSString *end_time;

// 路段经过的站点数量
@property (nonatomic, strong) NSNumber *stop_num;

// 价格
@property (nonatomic, strong) NSNumber *total_price;

// 区间价
@property (nonatomic, strong) NSNumber *zone_price;

@property (nonatomic, strong) NSNumber *is_rtbus;

// 公交线路类型
// 0：普通日行公交车；1：地铁、轻轨；2：机场巴士（前往机场）；3：有轨电车；4：机场巴士（从机场返回）；
// 5：旅游线路车；6：夜班车；7：机场巴士（机场之间）；8：轮渡；9：其他；10：快车；
// 11：慢车；12：机场快轨（前往机场）；13：机场快轨（从机场返回）；14：机场轨道交通环路
@property (nonatomic, strong) NSNumber *type;











@end