//
//  AGSMapView+extTianDiTu.h
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/15.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <ArcGIS/ArcGIS.h>
#import "SouthgisArcGisExtenHeadFile.h"
#import "SouthgisBdWMTSLayer.h"
#import "SouthgisTianDiTuWMTSLayer.h"
#import "Southgis_WMTSLayer.h"

/**
 *  @author crash         crash_wu@163.com   , 16-03-15 16:03:11
 *
 *  @brief  地图显示范围(左上角坐标，右下角坐标)
 */
typedef struct {
    double minX;
    double minY;
    double maxX;
    double maxY;
} SouthgisEnvelope;

@interface AGSMapView (extTianDiTu)


/**
 *  @author crash         crash_wu@163.com   , 16-03-15 16:03:40
 *
 *  @brief 加载天地图图层服务
 *
 *  @param layerType           天地图图层服务类别
 *  @param envelope            需要显示的地图范围左上角坐标与右下角坐标范围，默认为中国视图
 */
-(void)loadBDLayer:(BDLayerTypes) layerType andEnvelope:(SouthgisEnvelope *)envelope;


-(void)loadTianDituLayer:(WMTSLayerTypes) layerType andEnvelope:(SouthgisEnvelope *)envelope;



/**
 *  @author crash         crash_wu@163.com   , 16-03-16 14:03:02
 *
 *  @brief  获取当前地图显示范围
 *
 *  @return 返回当前地图范围左上角坐标，右下角坐标
 */
-(AGSEnvelope *)getMapBound;



/**
 *  @author crash         crash_wu@163.com   , 16-03-16 13:03:11
 *
 *  @brief  获取当前地图显示范围
 *
 *  @return 返回地图范围坐标字符串(xmin,ymin,xmax,ymax)
 */
-(NSString *)getMapBoundToJSON;



/**
 *  @author crash         crash_wu@163.com   , 16-03-16 15:03:27
 *
 *  @brief   获取天地图当前地图级别
 *
 *  @return 当前地图级别
 */
-(NSInteger )getTianDituLevelForResolution;


/**
 *  @author crash         crash_wu@163.com   , 16-03-18 15:03:04
 *
 *  @brief  保存当前地图页面到本地相册
 */
-(void )saveMapViewToPhotoAlbum;


/**
 *  @author crash         crash_wu@163.com   , 16-03-21 10:03:38
 *
 *  @brief  移除天地图图层
 */
-(void)removeSouthgisTianDituLayer;


@end
