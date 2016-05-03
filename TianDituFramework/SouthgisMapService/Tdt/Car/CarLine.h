//
//  CarLineEntity.h
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/17.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CarLineNode.h"
#import "CarMapInfoNode.h"


/**
 *  @author crash         crash_wu@163.com   , 16-03-17 10:03:22
 *
 *  @brief  驾车路线实体
 */

@interface CarLine : NSObject

@property(nonatomic,strong)NSArray<CarLineNode*> *carRoutes;

@property(nonatomic,strong)CarMapInfoNode *mapInfo;//驾车查询时，导航路线地图的信息
@property(nonatomic,strong)NSString *distance;//距离

@property(nonatomic,strong)NSString *routelatlon;//线路经纬度字符串

@end
