//
//  SouthgisTianDiTuWMTSLayer.m
//  RTLibrary-ios
//
//  Created by Jeremy on 16/3/29.
//  Copyright © 2016年 zlycare. All rights reserved.
//

#import "SouthgisTianDiTuWMTSLayer.h"
#import "SouthgisTianDiTuWMTSLayerInfoDelegate.h"

@interface SouthgisTianDiTuWMTSLayer()
{
    WMTSLayerTypes _layerType;
}

@end

@implementation SouthgisTianDiTuWMTSLayer

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
- (instancetype)initWithLayerType:(WMTSLayerTypes) wmtsLayerType  error:(NSError**) outError{
    
    _layerType = wmtsLayerType;
    
    if (self = [super initWithCachePath:[self retFilePath]]) {

        /*get the currect layer info
         */
        _layerInfo = [[SouthgisTianDiTuWMTSLayerInfoDelegate alloc]getLayerInfo:wmtsLayerType];
        
        
//        if ([url isEqual:[NSNull null]]) {
//            _layerInfo.url = url;
//        }
        AGSSpatialReference* sr = [AGSSpatialReference spatialReferenceWithWKID:_layerInfo.srid];
        _fullEnvelope = [[AGSEnvelope alloc] initWithXmin:_layerInfo.xMin
                                                     ymin:_layerInfo.yMin
                                                     xmax:_layerInfo.xMax
                                                     ymax:_layerInfo.yMax
                                         spatialReference:sr];
        
        _tileInfo = [[AGSTileInfo alloc]
                     initWithDpi:_layerInfo.dpi
                     format :@"PNG"
                     lods:_layerInfo.lods
                     origin:_layerInfo.origin
                     spatialReference :self.spatialReference
                     tileSize:CGSizeMake(_layerInfo.tileWidth,_layerInfo.tileHeight)
                     ];
        [_tileInfo computeTileBounds:self.fullEnvelope];
     
        [super layerDidLoad];
 
    }
    
    return self;
}

- (NSString *)retFilePath{
    
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,  NSUserDomainMask,YES);
    
    NSString *docPath = [documentPaths objectAtIndex:0];
    
    //通过图层类型创建文件夹保存切片
    NSString *createPath = [NSString stringWithFormat:@"%@/tdt/%d", docPath,_layerType];
    
    
    return createPath;
}

@end
