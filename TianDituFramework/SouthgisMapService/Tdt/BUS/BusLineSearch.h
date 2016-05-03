//
//  BusLineSearch.h
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/17.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  @author crash         crash_wu@163.com   , 16-03-17 13:03:04
 *
 *  @brief  获取线路规划类型
 */
typedef NS_ENUM(NSInteger ,BusLineType){
    
    SpeedyType=0,//较快捷
    LessChangeType,//少换剩
    LessWalkType,//少步行
    NoMetroType//不坐地铁
    
};




/**
 *  @author crash         crash_wu@163.com   , 16-03-17 13:03:02
 *
 *  @brief  公交路线请求参数实体
 */
@interface BusLineSearch : NSObject


@property(nonatomic,strong) NSString *startposition;//出发点坐标 “经度,纬度”
@property(nonatomic,strong) NSString *endposition;//终点坐标 “经度,纬度”
@property(nonatomic,assign) BusLineType lineType;//获取线路规划类型

@end
