//
//  BdBusLineSearchKeyword.h
//  TianDituFramework
//
//  Created by 吴小星 on 16/4/26.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BdBusLineSearchKeyword : NSObject

@property (nullable, nonatomic, copy) NSString *ak;
@property (nullable, nonatomic, copy) NSString *sk;
@property (nullable, nonatomic, copy) NSString *mcode;
@property (nullable, nonatomic, copy) NSString *output;

/**
 *  起点内容
 *
 *  可以使用多种格式，如：
 *      1.使用名称：百度大厦
 *      2.使用坐标：40.056878,116.30815
 *      3.使用名称+坐标：百度大厦|40.056878,116.30815
 *  当同时提供名称和经纬度，此时经纬度优先级高
 */
@property (nonnull, nonatomic, copy) NSString *origin;


/**
 *  终点内容
 *  格式同起点'origin'
 */
@property (nonnull, nonatomic, copy) NSString *destination;


/**
 *  导航模式（如果该属性为空，默认为驾车模式driving）
 *    1.驾车：driving
 *    2.步行：walking
 *    3.公交：transit
 *    4.骑行：riding
 */
@property (nullable, nonatomic, copy) NSString *mode;


/**
 *  地带，公交、步行导航时必填，如：北京
 */
@property (nonnull, nonatomic, copy) NSString *region;


/**
 *  驾车起点，如：北京
 */
//@property (nonnull, nonatomic, copy) NSString *origin_region;

/**
 *  驾车终点，如：北京
 */
//@property (nonnull, nonatomic, copy) NSString *destination_region;


/**
 *  坐标类型（如果该属性为空，默认为bd09ll）
 *    1.百度经纬度坐标：bd09ll
 *    2.百度墨卡托坐标：bd09mc
 *    3.国测局加密坐标：gcj02（google，soso均采用该坐标）
 *    4.gps设备获取的坐标：wgs84
 */
@property (nullable, nonatomic, copy) NSString *coord_type;

/**
 *  途经点集合，如：西单
 *  包括一个或多个用竖线字符"|"分隔的地址名称或经纬度。支持驾车、公交方案，最多支持5个途经点
 */
@property (nullable, nonatomic, copy) NSString *waypoints;


/**
 *  导航策略（如果该属性为空，默认为12）
 *    1.不走高速：10
 *    2.最少时间：11
 *    3.最短路径：12
 */
@property (nullable, nonatomic, strong) NSNumber *tactics;



/**
 *  时间戳，与sn配合使用，有sn时必填
 */
@property (nullable, nonatomic, copy) NSString *timestamp;


/**
 *  @author crash         crash_wu@163.com   , 16-04-26 11:04:49
 *
 *  @brief  初始化
 *
 *  @return 返回对象
 */
-(nullable instancetype)initKeyWord;


@end
