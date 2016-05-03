//
//  AGSMapView+extSketch.m
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/21.
//  Copyright © 2016年 crash. All rights reserved.
//

#import "AGSMapView+extSketch.h"
#import <objc/runtime.h>

//const char *SketchLayerType = "AGSSketchGraphicsLayer * ";

#define SketchLayerType @"AGSSketchGraphicsLayer *"

@implementation AGSMapView (extSketch)


/**
 *  @author crash         crash_wu@163.com   , 16-03-21 15:03:26
 *
 *  @brief  绘制图形
 *
 *  @param geometry 图形类别(点，线，面)
 */
-(void)drawSketchLayer:(SouthgisGeometryType) geometry{
    
    
    AGSSketchGraphicsLayer *sketchLayer=objc_getAssociatedObject(self, SketchLayerType);
    
    if (!sketchLayer) {
        
        //Sketch layer
        AGSSketchGraphicsLayer* sketchLayer = [[AGSSketchGraphicsLayer alloc] initWithGeometry:nil];
        [self addMapLayer:sketchLayer withName:@"Sketch layer"];
        
        //往类别中添加实例变量
        objc_setAssociatedObject(self, SketchLayerType, sketchLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    [sketchLayer clear];
    
    switch (geometry) {
        case MutablePointType:{//绘制多点
            
            self.touchDelegate = sketchLayer;
            sketchLayer.geometry = [[AGSMutablePoint alloc] initWithX:NAN y:NAN spatialReference:self.spatialReference];
            [[sketchLayer undoManager]removeAllActions];
        }break;
            
        case MutablePolylineType:{//绘制直线
            
            self.touchDelegate = sketchLayer;
            sketchLayer.geometry = [[AGSMutablePolyline alloc] initWithSpatialReference:self.spatialReference];
            [[sketchLayer undoManager]removeAllActions];
        }break;
            
        case MutablePolygonType:{//绘制面
            
            self.touchDelegate = sketchLayer;
            sketchLayer.geometry = [[AGSMutablePolygon alloc] initWithSpatialReference:self.spatialReference];
            [[sketchLayer undoManager]removeAllActions];
            
        }break;
            
        default:
            break;
    }
    
}


@end
