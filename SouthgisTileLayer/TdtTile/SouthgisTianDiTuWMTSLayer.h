//
//  SouthgisTianDiTuWMTSLayer.h
//  RTLibrary-ios
//
//  Created by Jeremy on 16/3/29.
//  Copyright © 2016年 zlycare. All rights reserved.
//

#import "Southgis_WMTSLayer.h"

@interface SouthgisTianDiTuWMTSLayer : Southgis_WMTSLayer


/**
 *  @author crash         crash_wu@163.com   , 16-05-03 08:05:04
 *
 *  @brief  初始化天地图图层
 *
 *  @param wmtsLayerType 天地图图层类型
 *  @param outError      图层加载错误信息
 *
 *  @return 天地图图层
 */
- (instancetype)initWithLayerType:(WMTSLayerTypes) wmtsLayerType  error:(NSError**) outError;

@end
