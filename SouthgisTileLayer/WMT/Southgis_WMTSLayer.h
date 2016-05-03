//
//  Soutgis_WMTSLayer.h
//  RTLibrary-ios
//
//  Created by Jeremy on 16/3/15.
//  Copyright © 2016年 zlycare. All rights reserved.
//

#import <ArcGIS/ArcGIS.h>
#import "Southgis_WMTSLayerInfo.h"
#import "SouthgisBaseTiledServiceLayer.h"
/**
 服务图层类型
 */
typedef enum {
    WMTS_VECTOR_MERCATOR = 0,	/*!< WMTS矢量墨卡托投影地图服务 */
    WMTS_VECTOR_ANNOTATION_CHINESE_MERCATOR=1,	/*!< WMTS矢量墨卡托中文标注 */
    WMTS_VECTOR_ANNOTATION_ENGLISH_MERCATOR=2,     /*!< WMTS矢量墨卡托英文标注 */
    WMTS_IMAGE_MERCATOR=3,     /*!< WMTS影像墨卡托投影地图服务 */
    WMTS_IMAGE_ANNOTATION_CHINESE_MERCATOR=4,     /*!< WMTS影像墨卡托投影中文标注 */
    WMTS_IMAGE_ANNOTATION_ENGLISH_MERCATOR=5,     /*!< WMTS影像墨卡托投影英文标注 */
    WMTS_TERRAIN_MERCATOR=6,     /*!< WMTS地形墨卡托投影地图服务 */
    WMTS_TERRAIN_ANNOTATION_CHINESE_MERCATOR=7,     /*!< WMTS地形墨卡托投影中文标注 */
    WMTS_VECTOR_2000 = 8,     /*!< WMTS矢量国家2000坐标系地图服务 */
    WMTS_VECTOR_ANNOTATION_CHINESE_2000=9,     /*!< WMTS矢量国家2000坐标系中文标注 */
    WMTS_VECTOR_ANNOTATION_ENGLISH_2000=10,     /*!< WMTS矢量国家2000坐标系英文标注 */
    WMTS_IMAGE_2000=11,     /*!< WMTS影像国家2000坐标系地图服务 */
    WMTS_IMAGE_ANNOTATION_CHINESE_2000=12,     /*!< WMTS影像国家2000坐标系中文标注 */
    WMTS_IMAGE_ANNOTATION_ENGLISH_2000=13,     /*!< WMTS影像国家2000坐标系中文标注 */
    WMTS_TERRAIN_2000=14,     /*!< WMTS地形国家2000坐标系地图服务 */
    WMTS_TERRAIN_ANNOTATION_CHINESE_2000=15,     /*!< WMTS地形国家2000坐标系中文标注 */
} WMTSLayerTypes;

/**
 * @author Jeremy, 16-03-17 14:03:04
 *
 * WMTS服务图层
 */
@interface Southgis_WMTSLayer : SouthgisBaseTiledServiceLayer
{
@protected
    //图层信息
    Southgis_WMTSLayerInfo* _layerInfo;
   
}

/**
 * @author Jeremy, 16-03-17 14:03:16
 *
 * 初始化方法
 *
 * @param wmtsLayerType 图层类型
 * @param url           图层地址
 * @param outError      错误指针
 *
 * @return WMTS图层对象
 */
- (instancetype)initWithLayerType:(WMTSLayerTypes) wmtsLayerType layerURL:(NSString *)url error:(NSError**) outError;
/**
 * @author Jeremy, 16-03-29 17:03:29
 *
 * 子类继承父类后，调用此初始化方法
 *
 * @param cachePath 缓存本地地址，为空则不缓存
 *
 * @return WMTS图层对象
 */
- (instancetype)initWithCachePath:(NSString *)cachePath;
@end