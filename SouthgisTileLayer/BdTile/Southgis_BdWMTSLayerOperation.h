//
//  Southgis_BdWMTSLayerOperation.h
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/31.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Southgis_WMTSLayerInfo.h"
#import <ArcGIS/ArcGIS.h>


/**
 *  @author crash         crash_wu@163.com   , 16-03-31 10:03:08
 *
 *  @brief  WMTS切片请求操作
 */
@interface Southgis_BdWMTSLayerOperation : NSOperation

@property (nonatomic,strong) AGSTileKey* tileKey;
@property (nonatomic,strong) id target;
@property (nonatomic,assign) SEL action;
@property (nonatomic,strong) NSData* imageData;
@property (nonatomic,strong) Southgis_WMTSLayerInfo* layerInfo;

- (instancetype)initWithTileKey:(AGSTileKey *)tileKey TiledLayerInfo:(Southgis_WMTSLayerInfo *)layerInfo target:(id)target action:(SEL)action;

@end
