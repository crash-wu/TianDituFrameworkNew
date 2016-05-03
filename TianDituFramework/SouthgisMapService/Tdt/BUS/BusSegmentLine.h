//
//  BusSegmentLine.h
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/17.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  @author crash         crash_wu@163.com   , 16-03-17 13:03:59
 *
 *  @brief  公交线路段内容
 */

@interface BusSegmentLine : NSObject

@property(nonatomic,strong) NSString *segmentName;//此段线路的线路名

@property(nonatomic,strong) NSString *direction;//此段线路的完整线路名

@property(nonatomic,strong) NSString  *linePoint;//此段线路的坐标

@property(nonatomic,assign) NSInteger segmentDistance;//一条线路中每小段距离,如果此段是步行 且距离小于 20 米,不返回此线段

@property(nonatomic,assign) NSInteger segmentStationCount;//此段线路需要经过的站点数

@property(nonatomic,assign) NSInteger segmentTime;//此段线路需要的时间

@end
