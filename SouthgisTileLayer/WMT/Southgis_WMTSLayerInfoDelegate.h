//
//  Southgis_WMTSLayerInfoDelegate.h
//  RTLibrary-ios
//
//  Created by Jeremy on 16/3/17.
//  Copyright © 2016年 zlycare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Southgis_WMTSLayerInfo.h"
#import "Southgis_WMTSLayer.h"

/**
 * @author Jeremy, 16-03-17 14:03:11
 *
 * WMTS图层信息
 */
@interface Southgis_WMTSLayerInfoDelegate : NSObject

/**
 * @author Jeremy, 16-03-17 14:03:24
 *
 * 获取图层信息
 *
 * @param wmtsLayerType WMTS图层类型
 *
 * @return 返回图层信息对象
 */
- (Southgis_WMTSLayerInfo *)getLayerInfo:(WMTSLayerTypes)wmtsLayerType;

@end
