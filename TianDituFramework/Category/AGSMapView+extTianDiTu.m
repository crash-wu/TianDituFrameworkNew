//
//  AGSMapView+extTianDiTu.m
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/15.
//  Copyright © 2016年 crash. All rights reserved.
//

#import "AGSMapView+extTianDiTu.h"
#import <objc/runtime.h>



//const char *ProfessionType = "TianDiTuWMTSLayer * ";

#define ProfessionType @"TianDiTuWMTSLayer *"

@implementation AGSMapView (extTianDiTu)



/**
 *  @author crash         crash_wu@163.com   , 16-03-15 16:03:40
 *
 *  @brief 加载天地图图层服务
 *
 *  @param layerType           天地图图层服务类别
 *  @param envelope            需要显示的地图范围左上角坐标与右下角坐标范围，默认为中国视图
 */
-(void)loadBDLayer:(BDLayerTypes) layerType andEnvelope:(SouthgisEnvelope *)envelope{
    
    NSError *err=nil;

    SouthgisBdWMTSLayer *layer=[[SouthgisBdWMTSLayer alloc]initWithLayerType:BDVecLayerType error:&err];
    
   // BDLayer=
    //往类别中添加实例变量
    objc_setAssociatedObject(self, ProfessionType, layer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    

    
        [self addMapLayer:layer withName:@"TianDiTu Layer"];

    
    
    AGSEnvelope *chinaEnv;
    [self zoomToScale:147914381.897889 animated:YES];
    [self enableWrapAround];
}


-(void)loadTianDituLayer:(WMTSLayerTypes) layerType andEnvelope:(SouthgisEnvelope *)envelope{
    
    NSError *err=nil;
    
    SouthgisTianDiTuWMTSLayer *layer=[[SouthgisTianDiTuWMTSLayer alloc]initWithLayerType:layerType layerURL:nil error:&err];
    
    // BDLayer=
    //往类别中添加实例变量
    objc_setAssociatedObject(self, ProfessionType, layer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
        //图层标注
        WMTSLayerTypes annotation;
    
        switch (layerType) {
            case WMTS_VECTOR_MERCATOR://天地图矢量墨卡托投影地图服务
                annotation=WMTS_VECTOR_ANNOTATION_CHINESE_MERCATOR;/*!< 天地图矢量墨卡托中文标注 */
                break;
                
            case WMTS_IMAGE_MERCATOR://天地图影像墨卡托投影地图服务
                annotation=WMTS_IMAGE_ANNOTATION_CHINESE_MERCATOR;/*!< 天地图影像墨卡托投影中文标注 */
                break;
    
            case WMTS_TERRAIN_MERCATOR://天地图地形墨卡托投影地图服务
                annotation=WMTS_TERRAIN_ANNOTATION_CHINESE_MERCATOR;/*!< 天地图地形墨卡托投影中文标注 */
                break;
    
            case WMTS_VECTOR_2000://天地图矢量国家2000坐标系地图服务
    
                annotation=WMTS_VECTOR_ANNOTATION_CHINESE_2000;/*!< 天地图矢量国家2000坐标系中文标注 */
                break;
    
            case WMTS_IMAGE_2000://天地图影像国家2000坐标系地图服务
    
                annotation=WMTS_IMAGE_ANNOTATION_CHINESE_2000;/*!< 天地图影像国家2000坐标系中文标注 */
                break;
    
            case WMTS_TERRAIN_2000:
                annotation=WMTS_TERRAIN_ANNOTATION_CHINESE_2000;/*!< 天地图地形国家2000坐标系中文标注 */
                break;
            default:
                break;
        }

    

    SouthgisTianDiTuWMTSLayer *tianDiTuLyr_Anno=[[SouthgisTianDiTuWMTSLayer alloc]initWithLayerType:annotation layerURL:nil error:&err];
    
        if(layer!=nil && tianDiTuLyr_Anno !=nil){
    
        [self addMapLayer:layer withName:@"TianDiTu Layer"];
    
         [self addMapLayer:tianDiTuLyr_Anno withName:@"TianDiTu Annotation Layer"];
    
        }else{
            //layer encountered an error
            NSLog(@"Error encountered: %@", err);
        }
    

//    AGSEnvelope *chinaEnv;
//
//     //判断该范围是否为空，如果为空，地图视图范围为中国视图，否则为指定的范围
//     if (envelope==nil) {
//     //将视图范围设置为中国,
//     chinaEnv = [AGSEnvelope envelopeWithXmin:49.69412631015632
//     ymin:9.17909389914061
//     xmax:162.19412631015632
//     ymax:65.25331264914061
//     spatialReference:self.spatialReference];
//     }
//     else{
//     chinaEnv = [AGSEnvelope envelopeWithXmin:envelope->minX
//     ymin:envelope->minY
//     xmax:envelope->maxX
//     ymax:envelope->maxY
//     spatialReference:self.spatialReference];
//     }
//    
//    [self zoomToEnvelope:chinaEnv animated:YES];
    [self enableWrapAround];
}


/**
 *  @author crash         crash_wu@163.com   , 16-03-16 13:03:11
 *
 *  @brief  获取当前地图显示范围
 *
 *  @return 返回地图范围坐标字符串(xmin,ymin,xmax,ymax)
 */
-(NSString *)getMapBoundToJSON{
    
    //获取地图四个角的范围
    AGSEnvelope *mapBound=self.visibleAreaEnvelope;

    NSString *mapboundJSON=[NSString stringWithFormat:@"%lf,%lf,%lf,%lf",mapBound.xmin,mapBound.ymin,mapBound.xmax,mapBound.ymax];
    
    return mapboundJSON;
}




/**
 *  @author crash         crash_wu@163.com   , 16-03-16 14:03:02
 *
 *  @brief  获取当前地图显示范围
 *
 *  @return 返回当前地图范围左上角坐标，右下角坐标
 */
-(AGSEnvelope *)getMapBound{
    
    //获取地图左上角，右下角坐标
    AGSEnvelope *mapBound=self.visibleAreaEnvelope;
    
    return mapBound;
}


/**
 *  @author crash         crash_wu@163.com   , 16-03-16 15:03:27
 *
 *  @brief   获取当前地图级别
 *
 *  @return 当前地图级别
 */
-(NSInteger )getTianDituLevelForResolution{
    
    NSArray *tileArry=[[NSArray alloc]init];
    //获取类别中的实例变量
    SouthgisTianDiTuWMTSLayer *  tianDiTuLyr=objc_getAssociatedObject(self, ProfessionType);
    
    
    tileArry=tianDiTuLyr.tileInfo.lods;
    double currentResolution=self.resolution;
    
    NSInteger level=1;
    
    for (int i=0; i<tileArry.count-1;i++) {
        
        AGSLOD *tileAGS=tileArry[i];
        AGSLOD *tileAGS1=tileArry[i+1];
        
        if ((currentResolution<tileAGS.resolution)&&(currentResolution>tileAGS1.resolution)) {
            
            level+=i;
        }
        
    }
    
    //适配最高地图级别，16级别到分别
    AGSLOD *lastAGS=tileArry[tileArry.count-1];
    if (currentResolution<lastAGS.resolution) {

        level=tileArry.count;
    }
       
    return level;
}

/**
 *  @author crash         crash_wu@163.com   , 16-03-21 10:03:38
 *
 *  @brief  移除天地图图层
 */
//-(void)removeSouthgisTianDituLayer{
//    
//    //获取类别中的实例变量
//    TianDiTuWMTSLayer *  tianDiTuLyr=objc_getAssociatedObject(self, ProfessionType);
//    //self.spatialReference=nil;
//    [self removeMapLayer:tianDiTuLyr];
//    
//}


/**
 *  @author crash         crash_wu@163.com   , 16-03-18 15:03:04
 *
 *  @brief  保存当前地图页面到本地相册
 */
-(void )saveMapViewToPhotoAlbum{

    GLint width;
    
    GLint height;
    
    glGetRenderbufferParameteriv(GL_RENDERBUFFER, GL_RENDERBUFFER_WIDTH, &width);
    
    glGetRenderbufferParameteriv(GL_RENDERBUFFER, GL_RENDERBUFFER_HEIGHT, &height);
    
    NSInteger myDataLength = width * height * 4;
    
    // allocate array and read pixels into it.
    GLubyte *buffer = (GLubyte *) malloc(myDataLength);
    glReadPixels(0, 0, width, height, GL_RGBA, GL_UNSIGNED_BYTE, buffer);
    
    
    // gl renders "upside down" so swap top to bottom into new array.
    // there's gotta be a better way, but this works.
    GLubyte *buffer2 = (GLubyte *) malloc(myDataLength);
    for(int y = 0; y < height; y++)
    {
        for(int x = 0; x < width * 4; x++)
        {
            buffer2[((height - 1) - y) * width * 4 + x] = buffer[y * 4 * width + x];
        }
    }
    
    // make data provider with data.
    CGDataProviderRef provider = CGDataProviderCreateWithData(NULL, buffer2, myDataLength, NULL);
    
    // prep the ingredients
    int bitsPerComponent = 8;
    int bitsPerPixel = 32;
    int bytesPerRow = 4 * width;
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGBitmapInfo bitmapInfo = kCGBitmapByteOrderDefault;
    CGColorRenderingIntent renderingIntent = kCGRenderingIntentDefault;
    
    // make the cgimage
    CGImageRef imageRef = CGImageCreate(width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, colorSpaceRef, bitmapInfo, provider, NULL, NO, renderingIntent);
    
    // then make the uiimage from that
    UIImage *image = [[UIImage alloc] initWithCGImage:imageRef];
    CGImageRelease(imageRef);
    CGDataProviderRelease(provider);
    CGColorSpaceRelease(colorSpaceRef);
    
    
    
    [SVProgressHUD showWithStatus:@"正在保存...."];
    UIImageWriteToSavedPhotosAlbum(image, self,
                                   @selector(image:didFinishSavingWithError:contextInfo:), nil);

}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {

    if (!error) {
        [SVProgressHUD showSuccessWithStatus:@"保存成功!"];
    }
    else{
        
        [SVProgressHUD showSuccessWithStatus:@"保存失败!"];
    }
    
}


@end
