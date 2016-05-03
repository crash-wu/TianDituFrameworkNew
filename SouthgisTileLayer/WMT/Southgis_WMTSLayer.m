//
//  Soutgis_WMTSLayer.m
//  RTLibrary-ios
//
//  Created by Jeremy on 16/3/15.
//  Copyright © 2016年 zlycare. All rights reserved.
//

#import "Southgis_WMTSLayer.h"
#import "Southgis_WMTSLayerOperation.h"
#import "Southgis_WMTSLayerInfoDelegate.h"

@interface Southgis_WMTSLayer()

@property(nonatomic,strong)Southgis_WMTSLayerOperation *layerOperation;


@end

@implementation Southgis_WMTSLayer


- (instancetype)initWithCachePath:(NSString *)cachePath{

    if (self = [super initWithCachePath:cachePath]) {
        
    }
    return self;
}

- (instancetype)initWithLayerType:(WMTSLayerTypes) wmtsLayerType layerURL:(NSString *)url error:(NSError**) outError{
    
    if (self = [super initWithCachePath:[self retFilePath]]) {
        
        /*get the currect layer info
         */
        _layerInfo = [[Southgis_WMTSLayerInfoDelegate alloc]getLayerInfo:wmtsLayerType];
        
        if (![url isEqual:[NSNull null]]) {
            _layerInfo.url = url;
        }
        
        AGSSpatialReference* sr = [AGSSpatialReference spatialReferenceWithWKID:_layerInfo.srid];
        
        _fullEnvelope = [[AGSEnvelope alloc] initWithXmin:_layerInfo.xMin
                                                     ymin:_layerInfo.yMin
                                                     xmax:_layerInfo.xMax
                                                     ymax:_layerInfo.yMax
                                         spatialReference:sr];
        
        _tileInfo = [[AGSTileInfo alloc]initWithDpi:_layerInfo.dpi
                                             format:@"PNG" lods:_layerInfo.lods origin:_layerInfo.origin spatialReference:self.spatialReference tileSize:CGSizeMake(_layerInfo.tileWidth,_layerInfo.tileHeight)];
        
        [_tileInfo computeTileBounds:self.fullEnvelope];
        
        [super layerDidLoad];
    }
    
    return self;
    
}



- (void)requestTileForKey:(AGSTileKey *)key{
    
    
    __weak typeof(self) weakSelf = self;
    
    [self loadTileDataFromCacheWithTileKey:key loadCompleteBlock:^(NSData *data) {
       
        if (data) {
            
            [weakSelf setTileData:data forKey:key];
        
        }
        else{
            Southgis_WMTSLayerOperation *operation = [[Southgis_WMTSLayerOperation alloc]initWithTileKey:key TiledLayerInfo:_layerInfo target:weakSelf action:@selector(didFinishOperation:)];
            
            [_requestQueue addOperation:operation];
        }
    }];
    
   
    
}

- (void)cancelRequestForKey:(AGSTileKey *)key{
    //Find the Southigs_TiledServiceLayerOperation object for this key and cancel it
    for(NSOperation* op in [AGSRequestOperation sharedOperationQueue].operations){
        if( [op isKindOfClass:[Southgis_WMTSLayerOperation class]]){
            Southgis_WMTSLayerOperation* offOp = (Southgis_WMTSLayerOperation*)op;
            if([offOp.tileKey isEqualToTileKey:key]){
                [offOp cancel];
            }
        }
    }
}

- (void) didFinishOperation:(Southgis_WMTSLayerOperation*)op{
    
    [super setTileData:op.imageData forKey:op.tileKey];
 
    
}



/**
 * @author Jeremy, 16-03-10 11:03:44
 *
 * 返回缓存路径
 *
 * @param tileKey
 *
 * @return 路径
 */
- (NSString *)retFilePath{
    
    NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,  NSUserDomainMask,YES);
    
    NSString *docPath = [documentPaths objectAtIndex:0];
    
    NSString *createPath = [NSString stringWithFormat:@"%@/wmts_tiles", docPath];
    
    
    return createPath;
}


@end
