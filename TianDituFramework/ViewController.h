//
//  ViewController.h
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/15.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ArcGIS/ArcGIS.h>
#import "AGSMapView+extTianDiTu.h"
#import "Southgis_TiledServiceLayer.h"
#import "LoggerDao.h"
#import "LoggerUtil.h"
#import "BdBusLineSearchKeyword.h"
#import "SouthgisBdMapService.h"
#import "BdCarLineSearchKeyword.h"
#import "SouthgisTdtMapService.h"

@interface ViewController : UIViewController<UISearchBarDelegate>{
    
    AGSMapView *yymapView;
    UISearchBar *yysearchBar;
    
    UIButton *busSearchBtn;
    UIButton *carBtn;
    UIButton *saveBtn;
    UIButton *featureBtn;
    UIButton *wmtBtn;
    UIButton *titleBtn;
    UIButton *locationBtn;
    
    UIButton *pointBtn;
    UIButton *lineBtn;
    UIButton *polygonBtn;
    
    UIButton *arbBtn;
}


@property(nonatomic,strong) NSString *name;

@end

