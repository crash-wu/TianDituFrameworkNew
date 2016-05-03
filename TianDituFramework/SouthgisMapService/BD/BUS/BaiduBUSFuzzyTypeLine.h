//
//  BaiduBUSFuzzyTypeLine.h
//  TianDituFramework
//
//  Created by Lee on 16/4/25.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaiduWebServiceBUSResult.h"
#import "BaiduBUSFuzzyTypeNode.h"

@class BaiduBUSFuzzyTypeNode;

/**
 *  百度公交路线查询 —— 起/终点模糊检索结果类
 *  当搜索结果中 type == 1 时
 */
@interface BaiduBUSFuzzyTypeLine : NSObject <BaiduWebServiceBUSResultType>

// 起点信息 { "wd": "人大", "city": {"cname": "北京市", "code": 131} }
@property (nonatomic, strong) NSDictionary *originInfo;

// 终点信息 { "wd": "人大", "city": {"cname": "北京市", "code": 131} }
@property (nonatomic, strong) NSDictionary *destinationInfo;

// 模糊匹配起点路径站点
@property (nonatomic, strong) NSArray<BaiduBUSFuzzyTypeNode *> *origin;

// 模糊匹配终点路径站点
@property (nonatomic, strong) NSArray<BaiduBUSFuzzyTypeNode *> *destination;
@end
