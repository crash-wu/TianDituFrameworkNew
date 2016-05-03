//
//  BdPOIResult.h
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/31.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BDLocation : NSObject

@property(nonatomic,assign) float lat;//纬度值
@property(nonatomic,assign) float lng;//经度值

@end

/**
 *  @author crash         crash_wu@163.com   , 16-03-31 14:03:37
 *
 *  @brief  百度地图POI搜索数据结果实体类
 */
@interface BdPOIResult : NSObject

@property(nonatomic,strong) NSString *name;//poi名称
@property(nonatomic,strong) NSString *address;//poi地址信息
@property(nonatomic,strong) NSString *telephone;//poi联系方式

@property(nonatomic,strong)BDLocation *location;//poi纬度坐标


@end
