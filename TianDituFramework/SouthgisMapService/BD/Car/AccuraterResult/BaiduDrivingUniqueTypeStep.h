//
//  BaiduDrivingUniqueTypeStep.h
//  TianDituFramework
//
//  Created by Lee on 16/4/26.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BaiduMapPoint;

/**
 *  百度驾车方案路段 —— 起/终点唯一检索方案路段类
 *  当搜索结果中 type == 2 时
 */
@interface BaiduDrivingUniqueTypeStep : NSObject
/**
 *  标示该路段是否在城市内部：
 *    0：不在城市内部
 *    1：在城市内部
 */
@property (nonatomic, strong) NSNumber *area;

/**
 *  进入道路的角度，返回值在0-11之间的一个值，共12个枚举值
 *  以30度递进，即每个值代表角度范围为30度；
 *  其中返回"0"代表345度到15度，以此类推，例如：
 *      0：[345°-15°]
 *      1：[15°-45°]
 *      ...
 *      11：[315°-345°]
 */
@property (nonatomic, strong) NSNumber *direction;

/**
 *  路段距离（单位：米）
 */
@property (nonatomic, strong) NSNumber *distance;

/**
 *  路段耗时（单位：秒）
 */
@property (nonatomic, strong) NSNumber *duration;

/**
 *  路段描述，如：继续沿上地西路行驶1.4公里,右转进入信息路
 */
@property (nonatomic, copy) NSString *instructions;

/**
 *  路段位置坐标描述，如：""116.31,40.04;116.31,40.04"
 */
@property (nonatomic, copy) NSString *path;

/**
 *  途径兴趣点poi信息
 */
@property (nonatomic, strong) NSArray  *pois;

/**
 *  机动转向点，包括基准八个方向、环岛、分歧等
 *  返回0-16之间的一个值，共17个枚举值：
 *      0-无效
 *      1-直行
 *      2-右前方转弯
 *      3-右转
 *      4-右后方转弯
 *      5-掉头
 *      6-左后方转弯
 *      7-左转
 *      8-左前方转弯
 *      9-左侧
 *      10-右侧
 *      11-分歧-左
 *      12-分歧中央
 *      13-分歧右
 *      14-环岛
 *      15-进渡口
 *      16-出渡口
 */
@property (nonatomic, strong) NSNumber *turn;

/**
 *  路段类型
 */
@property (nonatomic, strong) NSNumber *type;

/**
 *  路段起始点经纬度坐标
 */
@property (nonatomic, strong) BaiduMapPoint *stepOriginLocation;

/**
 *  路段目标点经纬度坐标
 */
@property (nonatomic, strong) BaiduMapPoint *stepDestinationLocation;

/**
 *  路段起始点描述
 */
@property (nonatomic, copy) NSString *stepOriginInstruction;

/**
 *  路段目标点描述，如：右转进入信息路 - 1.3公里
 */
@property (nonatomic, copy) NSString *stepDestinationInstruction;
@end
