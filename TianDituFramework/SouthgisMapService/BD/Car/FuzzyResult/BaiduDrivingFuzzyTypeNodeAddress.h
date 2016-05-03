//
//  BaiduDrivingFuzzyTypeNodeAddress.h
//  TianDituFramework
//
//  Created by Lee on 16/4/26.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BaiduMapPoint;

/**
 *  百度驾车路线查询 —— 起/终点模糊检索地点类
 *  当搜索结果中 type == 1 时
 */
@interface BaiduDrivingFuzzyTypeNodeAddress : NSObject

// 模糊匹配的地点名称
@property (nonatomic, copy) NSString *name;

// 模糊匹配的地点的地址
@property (nonatomic, copy) NSString *address;

// 模糊匹配的地点的id
@property (nonatomic, copy) NSString *uid;

// 模糊匹配的地点的电话
@property (nonatomic, copy) NSString *telephone;

// 模糊匹配的地点的经纬度坐标
@property (nonatomic, strong) BaiduMapPoint *location;
@end
