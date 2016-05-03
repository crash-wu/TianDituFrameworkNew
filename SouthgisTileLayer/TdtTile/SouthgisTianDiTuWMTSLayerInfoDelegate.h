//
//  SouthgisTianDiTuWMTSLayerInfoDelegate.h
//  RTLibrary-ios
//
//  Created by Jeremy on 16/3/29.
//  Copyright © 2016年 zlycare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Southgis_WMTSLayerInfo.h"
#import "Southgis_WMTSLayer.h"

@interface SouthgisTianDiTuWMTSLayerInfoDelegate : NSObject

-(Southgis_WMTSLayerInfo*)getLayerInfo:(WMTSLayerTypes) tiandituType;

@end
