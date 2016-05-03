//
//  Southgis_WMTSLayerOperation.h
//  RTLibrary-ios
//
//  Created by Jeremy on 16/3/15.
//  Copyright © 2016年 zlycare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Southgis_WMTSLayerInfo.h" 
#import <ArcGIS/ArcGIS.h>

/**
 * @author Jeremy, 16-03-17 14:03:45
 *
 * WMTS图层请求切片操作
 */
@interface Southgis_WMTSLayerOperation : NSOperation

@property (nonatomic,strong) AGSTileKey* tileKey;
@property (nonatomic,strong) id target;
@property (nonatomic,assign) SEL action;
@property (nonatomic,strong) NSData* imageData;
@property (nonatomic,strong) Southgis_WMTSLayerInfo* layerInfo;

- (instancetype)initWithTileKey:(AGSTileKey *)tileKey TiledLayerInfo:(Southgis_WMTSLayerInfo *)layerInfo target:(id)target action:(SEL)action;

@end
