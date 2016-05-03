//
//  BaiduBUSUniqueTypeResult.h
//  TianDituFramework
//
//  Created by Lee on 16/4/25.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaiduWebServiceBUSResult.h"
#import "BaiduBUSUniqueTypeLine.h"

@class BaiduMapPoint;

/**
 *  百度公交路线查询 —— 起/终点唯一检索结果类
 *  当搜索结果中 type == 2 时
 */
@interface BaiduBUSUniqueTypeResult : NSObject  <BaiduWebServiceBUSResultType>

// 起点城市信息
@property (nonatomic, strong) BaiduMapPoint *origin;

// 终点城市信息
@property (nonatomic, strong) BaiduMapPoint *destination;

// 途中站点
@property (nonatomic, strong) NSArray<BaiduBUSUniqueTypeLine *> *routes;
@end
