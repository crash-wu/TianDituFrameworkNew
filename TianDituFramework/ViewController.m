//
//  ViewController.m
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/15.
//  Copyright © 2016年 crash. All rights reserved.
//

#import "ViewController.h"
#import "BusLineSearch.h"
#import "CarLineSearch.h"
#import "AGSMapView+extSketch.h"
#import "SouthgisAGSQuerty.h"
#import "TdtPOISearchKeyWord.h"
#import "SouthgisTdtMapService.h"
#import "SouthgisBdMapService.h"
#import "BdPOISearchKeyWord.h"
#import "SouthgisTianDiTuWMTSLayer.h"


#define kFeatureServiceURL @"http://172.16.50.244:6080/arcgis/rest/services/test/ckq/FeatureServer"


#define kMapServiceLayerURL @"http://sampleserver1.arcgisonline.com/ArcGIS/rest/services/Demographics/ESRI_Census_USA/MapServer/3"


@interface ViewController()<AGSLayerDelegate,SouthgisAGSQuertyDelegate,AGSQueryTaskDelegate,AGSMapViewLayerDelegate>{
//    LocationUtils *location;
    
    AGSQueryTask *queryTask;
    
    SouthgisAGSQuerty *querty;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    yymapView=[[AGSMapView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:yymapView];
    
    
    yysearchBar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 100, 100, 50)];
    yysearchBar.delegate=self;
    [self.view insertSubview:yysearchBar aboveSubview:yymapView];
    
    
    busSearchBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [busSearchBtn setTitle:@"公交路线" forState:UIControlStateNormal];
    busSearchBtn.frame=CGRectMake(100, 100, 100, 50);
    busSearchBtn.backgroundColor=[UIColor blueColor];
    [busSearchBtn addTarget:self action:@selector(bus:) forControlEvents:UIControlEventTouchUpInside];
    [self.view insertSubview:busSearchBtn aboveSubview:yymapView];
    
    
    carBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [carBtn setTitle:@"驾车路线" forState:UIControlStateNormal];
    carBtn.frame=CGRectMake(200, 100, 100, 50);
    carBtn.backgroundColor=[UIColor blueColor];
    [carBtn addTarget:self action:@selector(car:) forControlEvents:UIControlEventTouchUpInside];
    [self.view insertSubview:carBtn aboveSubview:yymapView];
    
    
    saveBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    saveBtn.frame=CGRectMake(300, 100, 100, 50);
    saveBtn.backgroundColor=[UIColor blueColor];
    [saveBtn addTarget:self action:@selector(save:) forControlEvents:UIControlEventTouchUpInside];
    [self.view insertSubview:saveBtn aboveSubview:yymapView];
    
    
    
    
    featureBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [featureBtn setTitle:@"feature" forState:UIControlStateNormal];
    featureBtn.frame=CGRectMake(0, 150, 100, 50);
    featureBtn.backgroundColor=[UIColor blueColor];
    [featureBtn addTarget:self action:@selector(feature:) forControlEvents:UIControlEventTouchUpInside];
    [self.view insertSubview:featureBtn aboveSubview:yymapView];
    
    
    wmtBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [wmtBtn setTitle:@"wmt" forState:UIControlStateNormal];
    wmtBtn.frame=CGRectMake(100, 150, 100, 50);
    wmtBtn.backgroundColor=[UIColor blueColor];
    [wmtBtn addTarget:self action:@selector(wmt:) forControlEvents:UIControlEventTouchUpInside];
    [self.view insertSubview:wmtBtn aboveSubview:yymapView];
    
    
    
    titleBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [titleBtn setTitle:@"title" forState:UIControlStateNormal];
    titleBtn.frame=CGRectMake(200, 150, 100, 50);
    titleBtn.backgroundColor=[UIColor blueColor];
    [titleBtn addTarget:self action:@selector(title:) forControlEvents:UIControlEventTouchUpInside];
    [self.view insertSubview:titleBtn aboveSubview:yymapView];
    
    
    locationBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [locationBtn setTitle:@"定位" forState:UIControlStateNormal];
    locationBtn.frame=CGRectMake(300, 150, 100, 50);
    locationBtn.backgroundColor=[UIColor blueColor];
    [locationBtn addTarget:self action:@selector(location:) forControlEvents:UIControlEventTouchUpInside];
    [self.view insertSubview:locationBtn aboveSubview:yymapView];
    
    pointBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [pointBtn setTitle:@"点" forState:UIControlStateNormal];
    pointBtn.frame=CGRectMake(0, 200, 100, 50);
    pointBtn.backgroundColor=[UIColor blueColor];
    [pointBtn addTarget:self action:@selector(point:) forControlEvents:UIControlEventTouchUpInside];
    [self.view insertSubview:pointBtn aboveSubview:yymapView];
    
    
    
    lineBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [lineBtn setTitle:@"线" forState:UIControlStateNormal];
    lineBtn.frame=CGRectMake(100, 200, 100, 50);
    lineBtn.backgroundColor=[UIColor blueColor];
    [lineBtn addTarget:self action:@selector(line :) forControlEvents:UIControlEventTouchUpInside];
    [self.view insertSubview:lineBtn aboveSubview:yymapView];
    
    
    polygonBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [polygonBtn setTitle:@"面" forState:UIControlStateNormal];
    polygonBtn.frame=CGRectMake(200, 200, 100, 50);
    polygonBtn.backgroundColor=[UIColor blueColor];
    [polygonBtn addTarget:self action:@selector(polygon :) forControlEvents:UIControlEventTouchUpInside];
    [self.view insertSubview:polygonBtn aboveSubview:yymapView];
    
    
    arbBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [arbBtn setTitle:@"属性查询" forState:UIControlStateNormal];
    arbBtn.frame=CGRectMake(300, 200, 100, 50);
    arbBtn.backgroundColor=[UIColor blueColor];
    [arbBtn addTarget:self action:@selector(arrbite :) forControlEvents:UIControlEventTouchUpInside];
    [self.view insertSubview:arbBtn aboveSubview:yymapView];
    
    SouthgisEnvelope envelop[]={};
    envelop->minX=118.11257833;
    envelop->minY=36.52728142;
    envelop->maxX=119.15319634;
    envelop->maxY=38.30500386;

    yymapView.layerDelegate=self;
    [yymapView loadTianDituLayer:WMTS_VECTOR_MERCATOR andEnvelope:nil];
 //   [yymapView loadBDLayer:BDVecLayerType andEnvelope:nil];
   // [self titlethh];
    
    

    
}

//-(void)mapViewDidLoad:(AGSMapView *)mapView{
//    
//    [self titlethh];
//}

#pragma mark -属性查询
-(void)arrbite:(UIButton *)button{
    
    NSString *url=@"http://112.94.224.247:8080/rest/services/SZHJ/DisasterManagement/FeatureServer/0";
    
    NSArray *outField=[NSArray arrayWithObjects:@"*", nil];
    
    AGSQuery *query=[AGSQuery new];
    query.text=@"F";
    query.outFields=outField;
    querty=[[SouthgisAGSQuerty alloc]initWithURL:kMapServiceLayerURL andQuery:query];
    querty.southgisAGSQuertyDelegate=self;
    

}


- (void)queryTask:(AGSQueryTask *)queryTask operation:(NSOperation *)op didExecuteWithFeatureSetResult:(AGSFeatureSet *)featureSet {
    
   // [SVProgressHUD showSuccessWithStatus:@"查询成功!"];

    
}


-(void)quertyWithFeatureSetResult:(AGSFeatureSet *)featureSet{
    
    
    
    
};

-(void)quertyDidFailWithError:(NSError *)error{
    
    
}

#pragma mark -绘制面
-(void)polygon:(UIButton *)button{

    [yymapView drawSketchLayer:MutablePolygonType];
    [self testCrash];
}

-(void)testCrash{
    
    NSArray *arry=[NSArray arrayWithObjects:@"1",@"2",@"3", nil];
//    NSLog(@"arry=%@",arry[4]);
 //   LoggerDao *loger=[[LoggerDao alloc]initLoggerDao];
    
    LoggerUtil *logger =[LoggerUtil defaultLoggerUtil];

    [logger uploadLoggerToService:@"http://172.16.50.204:8080"];
}

#pragma mark 绘制线
-(void)line:(UIButton *)button{
 //   [yymapView drawSketchLayer:MutablePolylineType];
    
    LoggerUtil *logger =[LoggerUtil defaultLoggerUtil];
    [logger addOperationLog:@"dddd" andContent:@"tttt"];
}

#pragma mark -point
-(void)point:(UIButton *)button{
    
    [yymapView drawSketchLayer:MutablePointType];
    
}

#pragma mark -location
//-(void)location:(UIButton *)button{
//    
//    location=[[LocationUtils alloc]initLocationLocationType:REQUEST_ALWAYS];
//    location.locationDelegate=self;
//    [location startLocation];
//    
//}
//
//-(void)locationManager:(CLLocationManager *)locationManager locaiton:(CLLocation *)location{
//    
//    
//    
//}


#pragma mark -featureLayer
//-(void)feature:(UIButton *)button{
//    
//    /**----------FeatureLayer-------**/
//    
//       Southgis_AGSFeatureTableLayerOperation *layerOperation = [[Southgis_AGSFeatureTableLayerOperation alloc]initLayerOperationUrl:kFeatureServiceURL];
//    
//        layerOperation.layerDelegate = self;
//    
//        [layerOperation syncLoadFeatureLayerAndCacheWithParams:nil];
//     //   [layerOperation getFeatureLayerFormLocal];
//    
//}


#pragma mark -tileLayer

-(void)titlethh{


    /**------TileLayer ----------**/
        NSString* tileServiceURL = @"http://112.94.224.235/ArcGIS/rest/services/HSXZQ/MapServer";

        Southgis_TiledServiceLayer *titl=[[Southgis_TiledServiceLayer alloc]initTiledServiceLayerURL:tileServiceURL]
    ;
        [yymapView addMapLayer:titl withName:@"offLineMap"];
    
}




#pragma mark -WMTLayer

//-(void)wmt:(UIButton *)button{
//    
//    /**--------- WMTS -------------**/
//        NSString *wmtsUrl = @"http://www.yymap.gov.cn/wmts/kvp/services/shiliangdianziditu/MapServer/TDTWMTSServer";
//        Southgis_WMTSLayer *wmtsLayer = [[Southgis_WMTSLayer alloc]initWithLayerType:WMTS_VECTOR_2000 layerURL:wmtsUrl isCache:YES error:nil];
//        [yymapView addMapLayer:wmtsLayer];
//    
//    
//}
//
//- (void)loadFeature:(AGSFeatureTableLayer *)featureLayer error:(NSError *)error{
//    
//    featureLayer.delegate = self;
//    
//    [yymapView addMapLayer:featureLayer withName:@"good"];
//}
//
//- (void)taskJobStatus:(AGSResumableTaskJobStatus)status userInfo:(NSDictionary *)userInfo{
//    
//}
//
//#pragma mark - AGSLayerDelegate
//- (void)layerDidLoad:(AGSLayer *)layer
//{
//    NSLog(@"-------layerDidLoad-------");
//    
//}
//
//- (void)layer:(AGSLayer *)layer didFailToLoadWithError:(NSError *)error{
//    NSLog(@"-------didFailToLoadWithError-------");
//}
//
//-(void)layer:(AGSLayer *)layer didInitializeSpatialReferenceStatus:(BOOL)srStatusValid{
//    NSLog(@"-------didInitializeSpatialReferenceStatus-------");
//}


#pragma mark -savePhotoToAlbum
-(void)save:(UIButton *)button{
    
    
    [yymapView saveMapViewToPhotoAlbum];
}


#pragma mark -Bus
-(void)bus:(UIButton *)button{
    
    BusLineSearch *entity=[[BusLineSearch alloc]init];
    entity.startposition=@"118.67484,37.454076";
    entity.endposition=@"118.538304,37.4569";
    entity.lineType=SpeedyType;
    SouthgisTdtMapService *search=[[SouthgisTdtMapService alloc]init];
    
    [search busLineSearch:entity success:^(id obj) {
        
    } failed:^(id obj) {
        
    }];
    
    
    BdBusLineSearchKeyword *bdEntity=[[ BdBusLineSearchKeyword alloc]initKeyWord];
    bdEntity.origin =@"上地五街";
    bdEntity.destination=@"北京大学";
    bdEntity.region =@"北京";
    bdEntity.ak=@"2regFG8iBbLZZCZ7MzcG2mcw1zAOOcC5";
    bdEntity.sk =@"0P8mPg716jIHEIbB80v0VMCKAhlnNGGh";
    
    
//    SouthgisBdMapService *service=[[SouthgisBdMapService alloc]init];
//    [service busLineSearch:bdEntity success:^(id obj) {
//        
//        
//    } failed:^(id obj) {
//        
//    }];
}


#pragma mark -car
-(void)car:(UIButton *)button{
    
    CarLineSearch *entity=[[CarLineSearch alloc]init];
    entity.orig=@"118.67484,37.454076";
    entity.dest=@"118.538304,37.4569";
    entity.style=FastType;
    
        SouthgisTdtMapService *poiSearch=[[SouthgisTdtMapService alloc]init];
    [poiSearch carLineSearch:entity success:^(id obj) {
        
    } andFail:^(id obj) {
        
    }];
//    [SouthgisTianDituRouteSearch executeTianDituSearchCarLine:entity success:^(id obj) {
//        
//    } andFail:^(id obj) {
//        
//    }];
    
    BdCarLineSearchKeyword *carEntiy=[[BdCarLineSearchKeyword alloc]initKeyWord];
    carEntiy.origin =@"上地五街";
    carEntiy.destination=@"北京大学";
    carEntiy.origin_region =@"北京";
    carEntiy.destination_region=@"北京";
    carEntiy.ak=@"2regFG8iBbLZZCZ7MzcG2mcw1zAOOcC5";
    carEntiy.sk =@"0P8mPg716jIHEIbB80v0VMCKAhlnNGGh";
    
    
//    SouthgisBdMapService *service=[[SouthgisBdMapService alloc]init];
//    [service carLineSearch:carEntiy success:^(id obj) {
//        
//    } andFail:^(id obj) {
//        
//    }];
}


#pragma mark -poi
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    TdtPOISearchKeyWord *keyWorkEntity=[[TdtPOISearchKeyWord alloc]init];
    keyWorkEntity.queryType=@"7";
    keyWorkEntity.queryRadius = @"10000";
    keyWorkEntity.count = @"20";
    keyWorkEntity.keyWord=@"银行";
    keyWorkEntity.mapBound=[yymapView getMapBoundToJSON];
    keyWorkEntity.start=@"0";
    
    keyWorkEntity.level=[NSString stringWithFormat:@"%ld",(long)[yymapView getTianDituLevelForResolution] ];
    
    SouthgisTdtMapService *poiSearch=[[SouthgisTdtMapService alloc]init];
    [poiSearch poiSearch:keyWorkEntity success:^(id obj) {
        
    } failed:^(id obj) {
        
    }];
    

    BdPOISearchKeyWord *bdKeyWord=[[BdPOISearchKeyWord alloc]initKeyWord];
    
    bdKeyWord.location=@"36.652181,116.870643";
    bdKeyWord.query=@"银行";
    bdKeyWord.ak=@"2regFG8iBbLZZCZ7MzcG2mcw1zAOOcC5";
    bdKeyWord.page_size=0;
    bdKeyWord.page_num=10;
    bdKeyWord.radius =10000;
    bdKeyWord.sk =@"0P8mPg716jIHEIbB80v0VMCKAhlnNGGh";

    SouthgisBdMapService *bdService=[[SouthgisBdMapService alloc]init];
//    [bdService poiSearch:bdKeyWord success:^(id obj) {
//        
//        NSArray *arry=(NSArray *)obj;
//        
//    } failed:^(id obj) {
//        
//    }];
//    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
