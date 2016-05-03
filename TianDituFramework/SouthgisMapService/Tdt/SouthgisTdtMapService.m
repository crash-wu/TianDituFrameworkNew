//
//  SouthgisTdtMapService.m
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/29.
//  Copyright © 2016年 crash. All rights reserved.
//

#import "SouthgisTdtMapService.h"
#import "SGXMLParser.h"

//天地图web 搜索服务接口(POI,地名地址，公交路线==)
#define TIANDITU_SEARCH_URL @"http://map.tianditu.com/query.shtml"

#define GET_TIANDITU_SEARCH_URL(searchType,postStr) [NSString stringWithFormat:@"%@?type=%@&postStr=%@",TIANDITU_SEARCH_URL,searchType,postStr] //天地图请求接口(POI,公交，驾车)

@implementation SouthgisTdtMapService



/**
*  @author crash         crash_wu@163.com   , 16-03-16 10:03:32
*
*  @brief  天地图POI搜索
*
*  @param keyWordEntity 搜索类型实体*  @param success       搜索成功返回Block

*  @discussion success block 中的 object 类型是一个NSArray<POISearchResult*> 的数组

*      Example:
        success=^(id objcet){
            //如果是天地图
            NSArray<TdtPOIResult*> *array=(NSArray*)object;
        }

*  @param failed        失败block
*/
-(void)poiSearch:( TdtPOISearchKeyWord *)keyWordEntity success:(SuccessBlock)success failed:(FailedBlock)failed{
    
    NSString *postStr = [keyWordEntity yy_modelToJSONString];
    postStr=[self p_stringByURLEncode:postStr];
    
    NSString *urlStr = GET_TIANDITU_SEARCH_URL(@"query",postStr);
    
   [ [[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:urlStr] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        DLog(@"请求完毕\n\n");
        if (error) {
            if (failed) {
                failed(error);
            }
            return ;
        }
        
        if (!data || data.length == 0) {
            if (failed) {
                NSError *error = [NSError errorWithDomain:SouthgisErrorDomain code:BaiduWebServerErrorNullResponse userInfo:@{@"message": @"空数据"}];
                failed(error);
            }
            return ;
        }
        
        id json;
        if ([data isKindOfClass:[NSData class]]) {
            json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        }
        
    
        if (success && json) {

            NSArray *dataArray=[NSArray yy_modelArrayWithClass:[TdtPOIResult class] json:[json objectForKey:@"pois"]];
                
                success(dataArray);

            return ;
            
        } else if (failed) {
            NSError *error = [NSError errorWithDomain:SouthgisErrorDomain code:-8001 userInfo:@{@"message": @"公交查询结果解析失败"}];
            failed(error);
            return;
        }
    } ] resume];
    
}



/**
 *  @author crash         crash_wu@163.com   , 16-03-17 11:03:18
 *
 *  @brief  驾车路线规划
 *  @discussion success block 中的 object 类型是一个CarLine类型
 
 *      Example:
 success=^(id objcet){
 
 CarLine *line=(CarLine*)object;
 }
 *  @param driverEntity 驾车路线请求参数实体
 *  @param success      路线请求成功bolck
 *  @param fail         路线请求失败bolck
 */
-(void)carLineSearch :(CarLineSearch *)driverEntity success:(SuccessBlock)success andFail:(FailedBlock)fail{
    
    NSString *postStr = [driverEntity yy_modelToJSONString];
    postStr=[self p_stringByURLEncode:postStr];
    
    NSString *urlStr = GET_TIANDITU_SEARCH_URL(@"search",postStr);

    
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:urlStr] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
        DLog(@"请求完毕\n\n");
        if (error) {
            if (fail) {
                fail(error);
            }
            return ;
        }
        
        if (!data || data.length == 0) {
            if (fail) {
                NSError *error = [NSError errorWithDomain:SouthgisErrorDomain code:BaiduWebServerErrorNullResponse userInfo:@{@"message": @"空数据"}];
                fail(error);
            }
            return ;
        }
        

//        
        //解析XML
        SGXMLParser *parser = [[SGXMLParser alloc]init];
        NSDictionary *resultObject = [parser parseData:data];
        NSDictionary *resultStr = [resultObject objectForKey:@"result"];
        if (resultObject == nil || [resultStr allKeys].count == 0) {
            // [AppUtils showErrorMessage:TEXT_SERVER_NOT_RESPOND];
            return;
        }
        
        CarLine *carLine = [[CarLine alloc]init];
        
        carLine.mapInfo = [SGXMLParser getDataAtPath:@"result.mapinfo" fromResultObject:resultObject];
        
        carLine.distance = [SGXMLParser getDataAtPath:@"result.distance" fromResultObject:resultObject];
        
        NSArray	*dataArray = [SGXMLParser getDataAtPath:@"result.routes.item" fromResultObject:resultObject];
        
        carLine.carRoutes=[NSArray yy_modelArrayWithClass:[CarLineNode class] json:dataArray];
        
        carLine.routelatlon = [SGXMLParser getDataAtPath:@"result.routelatlon" fromResultObject:resultObject];
        
        success(carLine);
        
        
    }] resume];
    
}




/**
 *  @author crash         crash_wu@163.com   , 16-03-17 13:03:18
 *
 *  @brief  天地图公交路线查询
 *  @discussion success block 中的 object 类型是一个BusLine类型的数组
 
 *      Example:
    success=^(id objcet){
 
            NSArray<BusLine *> array=(NSArray*)object
        }
 *  @param entity  公交路线请求参数实体
 *  @param success 路线请求成功bolck
 *  @param failed  路线请求失败bolck
 */
-(void)busLineSearch:(BusLineSearch *)entity success:(SuccessBlock)success failed:(FailedBlock)failed{
    
//
//    RTHttpClient *httpClient=[RTHttpClient postJSONClient];
    
    NSString *postStr = [entity yy_modelToJSONString];
    postStr=[self p_stringByURLEncode:postStr];
//    postStr = [postStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
//
//    postStr = [postStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSString *urlStr = GET_TIANDITU_SEARCH_URL(@"busline",postStr);
    
   // NSDictionary *param=@{@"type":@"busline",@"postStr":postStr};
    
    /*
    [httpClient postJSONWithPath:urlStr parameters:param prepareExecute:^{
        
        [SVProgressHUD showWithStatus:@"路线获取中..."];
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [SVProgressHUD showSuccessWithStatus:@"获取完成!"];
        NSArray *results = [responseObject objectForKey:@"results"];
        NSArray *lineArray=[NSArray yy_modelArrayWithClass:[BusLine class] json:results[0]];
        success(lineArray);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [SVProgressHUD showErrorWithStatus:@"获取失败!"];
    }];
    */
    
    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:urlStr] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        DLog(@"请求完毕\n\n");
        if (error) {
            if (failed) {
                failed(error);
            }
            return ;
        }
        
        if (!data || data.length == 0) {
            if (failed) {
                NSError *error = [NSError errorWithDomain:SouthgisErrorDomain code:BaiduWebServerErrorNullResponse userInfo:@{@"message": @"空数据"}];
                failed(error);
            }
            return ;
        }
        
        id json;
        if ([data isKindOfClass:[NSData class]]) {
            json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        }
        
        NSArray *results = [json objectForKey:@"results"];
        if (!results) {
            
            failed(@"error");
            
        }else{
            
            NSArray *lineArray=[NSArray yy_modelArrayWithClass:[BusLine class] json:results[0]];
            success(lineArray);
            
        }
        
        return;
        
    }] resume];
}




@end
