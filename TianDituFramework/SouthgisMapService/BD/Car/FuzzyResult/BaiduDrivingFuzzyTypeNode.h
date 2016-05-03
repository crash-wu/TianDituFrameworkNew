//
//  BaiduDrivingFuzzyTypeNode.h
//  TianDituFramework
//
//  Created by Lee on 16/4/26.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaiduDrivingFuzzyTypeNodeAddress.h"

/**
 *  百度驾车路线查询 —— 起/终点模糊检索地点匹配类
 *  当搜索结果中 type == 1 时
 */
@interface BaiduDrivingFuzzyTypeNode : NSObject

// 模糊匹配的城市名称
@property (nonatomic, copy) NSString *cityName;

// 模糊匹配的地点
@property (nonatomic, strong) NSArray<BaiduDrivingFuzzyTypeNodeAddress *> *content;
@end
