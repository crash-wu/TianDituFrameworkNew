//
//  BusSegment.h
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/17.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BusSegmentLine.h"


/**
 *  @author crash         crash_wu@163.com   , 16-03-17 14:03:06
 *
 *  @brief  线路类型
 */
typedef NS_ENUM(NSInteger ,RouteType){
    
    WallType=1,//步行
    BusType,//公交
    MetroType,//地铁
    ChangeInMetroType//地铁内换剩
};


/**
 *  @author crash         crash_wu@163.com   , 16-03-17 13:03:32
 *
 *  @brief  单条公交结果中的各段线路信息
 */
@interface BusSegment : NSObject

@property (nonatomic,assign) RouteType segmentType;//线路类型

@property(nonatomic,strong) NSString *stationStart;//起站点内容

@property(nonatomic,strong) NSString *stationEnd;//终站点内容


@property(nonatomic,strong) BusSegmentLine *segmentLine;//线路内容

@end
