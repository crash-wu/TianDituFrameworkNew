//
//  BaiduDrivingUniqueTypeScheme.h
//  TianDituFramework
//
//  Created by Lee on 16/4/26.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaiduDrivingUniqueTypeStep.h"

@class BaiduMapPoint;

/**
 *  百度驾车路线方案 —— 起/终点唯一检索路线方案类
 *  当搜索结果中 type == 2 时
 */
@interface BaiduDrivingUniqueTypeScheme : NSObject

// 路线
@property (nonatomic, strong) NSArray<BaiduDrivingUniqueTypeStep *> *steps;

// 方案距离（单位：米）
@property (nonatomic, strong) NSNumber *distance;

// 方案耗时（单位：秒）
@property (nonatomic, strong) NSNumber *duration;

// 过路费
@property (nonatomic, strong) NSNumber *toll;

// 起点经纬度坐标
@property (nonatomic, strong) BaiduMapPoint *originLocation;

// 目标点经纬度坐标
@property (nonatomic, strong) BaiduMapPoint *destinationLocation;

@end
