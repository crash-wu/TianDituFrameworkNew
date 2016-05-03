//
//  AGSMapView+extSketch.h
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/21.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <ArcGIS/ArcGIS.h>


/**
 *  @author crash         crash_wu@163.com   , 16-03-21 15:03:06
 *
 *  @brief  图形类型（点,线,面）
 */
typedef NS_ENUM(NSInteger,SouthgisGeometryType){

    MutablePointType=0,//多点
    MutablePolylineType,//直线
    MutablePolygonType//多面
};

/**
 *  @author crash         crash_wu@163.com   , 16-03-21 15:03:40
 *
 *  @brief  地图标绘扩展
 */
@interface AGSMapView (extSketch)



/**
 *  @author crash         crash_wu@163.com   , 16-03-21 15:03:26
 *
 *  @brief  绘制图形
 *
 *  @param geometry 图形类别(点，线，面)
 */
-(void)drawSketchLayer:(SouthgisGeometryType) geometry;

@end
