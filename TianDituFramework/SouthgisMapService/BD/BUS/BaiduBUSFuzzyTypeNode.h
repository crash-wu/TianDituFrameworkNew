//
//  BaiduBUSFuzzyTypeNode.h
//  TianDituFramework
//
//  Created by Lee on 16/4/25.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BaiduMapPoint;

/**
 *  百度公交路线查询 —— 起/终点模糊检索站点结果类
 *  当搜索结果中 type == 1 时
 */
@interface BaiduBUSFuzzyTypeNode : NSObject
// 站点名称
@property (nonatomic, copy) NSString *name;

// 站点地址
@property (nonatomic, copy) NSString *address;

// 站点id
@property (nonatomic, copy) NSString *uid;

// 站点经纬度
@property (nonatomic, strong) BaiduMapPoint *location;
@end
