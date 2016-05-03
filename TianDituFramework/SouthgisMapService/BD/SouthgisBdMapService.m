//
//  SouthgisBdMapService.m
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/31.
//  Copyright © 2016年 crash. All rights reserved.
//

#import "SouthgisBdMapService.h"
#include <CommonCrypto/CommonCrypto.h>
#import "BaiduWebServiceBUSResult.h"
#import "BaiduBUSFuzzyTypeLine.h"
#import "BaiduBUSUniqueTypeResult.h"
#import "BaiduDrivingSearchResult.h"
#import "BaiduDrivingFuzzyTypeResult.h"
#import "BaiduDrivingUniqueTypeResult.h"

#define BD_MAPSEARVICE_SEARCH_URL @"http://api.map.baidu.com/place/v2/search"

#define GET_BD_POI_SEARCH_URL(string) [NSString stringWithFormat:@"%@?%@",BD_MAPSEARVICE_SEARCH_URL,string] //百度地图POI




// 百度网络服务域名
static NSString *const kBaiduWebServiceRootString = @"http://api.map.baidu.com";

// POI服务
static NSString *const kPOIURI = @"/place/v2/search";

// 路线检索服务
static NSString *const kDirectionURI = @"/direction/v1";

// 批量路线查询服务
static NSString *const kRouteMatrixURI = @"/direction/v1/routematrix";

// 位置请求服务
static NSString *const kPlaceSuggestionURI = @"/place/v2/suggestion/";

/**
 *  将非百度地图的坐标转换为百度地图中的坐标
 *  目前支持的非百度坐标有：
 *      1.GPS获取的坐标
 *      2.google地图坐标
 *      3.soso地图坐标
 *      4.amap地图坐标
 *      5.mapbar地图坐标
 */
static NSString *const kChangePositionURI = @"/geoconv/v1/";

// 地址与经纬度互转服务
static NSString *const kGeocodingURI = @"/geocoder/v2/";

// 定位服务
static NSString *const kLocationURI = @"/location/ip";

@implementation SouthgisBdMapService


/**
 *  @author crash         crash_wu@163.com   , 16-04-26 16:04:19
 *
 *  @brief  百度地图驾车路线查询
 *
 *  @param driverEntity 驾车路线查询实体
 *  @param success      返回成功Block
 
 *  @discussion success block 中的 object 类型是一个
        BaiduDrivingSearchResult类型实体
 
 *      Example:
            success=^(id objcet){
                BaiduDrivingUniqueTypeResult *result=(BaiduDrivingUniqueTypeResult*)objcet ;
                if(result.type== ACCUTATE_TYPE ){
                    //如果是精准查询
                    BaiduBUSUniqueTypeResult *subR=(BaiduBUSUniqueTypeResult *)result.result;
                }else{
 
                    //如何是模糊查询
                    BaiduBUSFuzzyTypeLine *subR=(BaiduBUSFuzzyTypeLine*)result.result;
                }
            }
 *  @param fail         失败
 */
-(void)carLineSearch:(nonnull BdCarLineSearchKeyword *)driverEntity success:(nonnull SuccessBlock)success andFail:(nonnull FailedBlock)fail {
    
    NSDictionary *paramsDict = [driverEntity yy_modelToJSONObject];

    
    NSString *urlStr = [self p_bdWebServerURLWithDictionary:paramsDict andURI:@"/direction/v1"];
    DLog(@"驾车路线请求地址:%@\n\n", urlStr);
    // 开始请求数据
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
        
        [self p_mapReponseObject:data fromService:BdCarLineDirection success:success failed:fail];
    }] resume];
}



/**
 *  @author crash         crash_wu@163.com   , 16-03-16 10:03:32
 *
 *  @brief  百度地图POI搜索
 *
 *  @param keyWord 搜索类型实体
 *  @param success       搜索成功返回Block
 
 *  @discussion success block 中的 object 类型是一个
        NSArray<BdPOIResult*> 的数组
 
 *      Example:
            success=^(id objcet){
                NSArray<BdPOIResult*> *array=(NSArray*)object;
 
            }
 
 *  @param failed        失败block
 */
-(void)poiSearch:(nonnull BdPOISearchKeyWord *)keyWord success:(nullable SuccessBlock)success failed:(nullable FailedBlock)failed{

    NSDictionary *paramsDict = [keyWord yy_modelToJSONObject];
    
    NSString *urlStr = [self p_bdWebServerURLWithDictionary:paramsDict andURI:kPOIURI];
    
    DLog(@"请求地址:%@\n\n", urlStr);
    // 开始请求数据
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
        
        [self p_mapReponseObject:data fromService:BaiduWebServerPOI success:success failed:failed];
        
    }] resume];
    

}


/**
 *  @author crash         crash_wu@163.com   , 16-04-26 10:04:25
 *
 *  @brief  百度地图公交路线搜索
 *
 *  @param entity  公交路线搜索实体
 *  @param success 搜索成功返回block
 
 *  @discussion success block 中的 object 类型是一个
        BaiduWebServiceBUSResultType类型实体
 
 *      Example:
            success=^(id objcet){
                BaiduWebServiceBUSResultType *result=(BaiduWebServiceBUSResultType*)objcet ;
                if(result.type== ACCUTATE_TYPE ){
                    //如果是精准查询
                    BaiduBUSUniqueTypeResult *subR=(BaiduBUSUniqueTypeResult *)result.result;
                }else{
 
                    //如何是模糊查询
                    BaiduBUSFuzzyTypeLine *subR=(BaiduBUSFuzzyTypeLine*)result.result;
                }
            }
 *  @param failed  失败搜索返回
 */
-(void)busLineSearch:(nonnull BdBusLineSearchKeyword *)entity success:(nullable SuccessBlock)success failed:(nullable FailedBlock)failed{
    
    NSDictionary *paramsDict = [entity yy_modelToJSONObject];
    
    NSString *urlStr = [self p_bdWebServerURLWithDictionary:paramsDict andURI:kDirectionURI];
    
    DLog(@"请求地址:%@\n\n", urlStr);
    // 开始请求数据
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
        
        [self p_mapReponseObject:data fromService:BaiduWebServerDirection success:success failed:failed];
        
    }] resume];

}




#pragma mark -数据解析
/**
 *  @author crash         crash_wu@163.com   , 16-04-26 10:04:46
 *
 *  @brief  数据解析返回
 *
 *  @param responseObj 返回数据
 *  @param serviceType 请求类型(POI,公交路线)
 *  @param success     成功block
 *  @param failed      失败block
 */
- (void)p_mapReponseObject:(nonnull id)responseObj fromService:(BaiduWebServerType)serviceType success:(nullable SuccessBlock)success failed:(nullable FailedBlock)failed {
    
    switch (serviceType) {
            // POI服务
        case BaiduWebServerPOI: {
            if ([self p_mapPOIObject:responseObj success:success failed:failed]) {
                return ;
            }
        } break;
            
            // 查询公交路线服务
        case BaiduWebServerDirection: {
            if ([self p_mapDirectionObject:responseObj success:success failed:failed]) {
                return ;
            }
        } break;
        case BdCarLineDirection:{
            
            if ([self p_mapCarDirectionObject:responseObj success:success failed:failed]) {
                return ;
            }
            
        }break;
            // 未知服务
        default:
            break;
    }
    
    if (failed) {
        NSError *error = [NSError errorWithDomain:SouthgisErrorDomain code:BaiduWebServerErrorInvalidServiceType userInfo:@{@"message": @"无效的服务类型"}];
        failed(error);
    }
}


/**
 *  @author crash         crash_wu@163.com   , 16-04-26 10:04:47
 *
 *  @brief  POI数据解析
 *
 *  @param responseObj POI数据
 *  @param success
 *  @param failed
 *
 *  @return 返回数据解析状态
 */
- (BOOL)p_mapPOIObject:(nonnull id)responseObj success:(nullable SuccessBlock)success failed:(nullable FailedBlock)failed {
    
    id json = responseObj;
    if ([json isKindOfClass:[NSData class]]) {
        json = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
    }
    
    if (success && json) {
        
        NSString *code= [json objectForKey:@"status"];
        
        if ([code integerValue]==0&& code) {
          //  [SVProgressHUD showSuccessWithStatus:@"数据搜索成功!"];
            
            NSArray *poiArray=[NSArray yy_modelArrayWithClass:[BdPOIResult class] json:[json objectForKey:@"results"]];
            success(poiArray);

        }else{
            
            failed([json objectForKey:@"status"]);
        }
        
        return  YES;
    } else if (failed) {
        NSError *error = [NSError errorWithDomain:SouthgisErrorDomain code:-8001 userInfo:@{@"message": @"公交查询结果解析失败"}];
        failed(error);
        return YES;
    }
    
    return NO;
}



/**
 *  @author crash         crash_wu@163.com   , 16-04-26 10:04:10
 *
 *  @brief  路线数据解析
 *
 *  @param responseObj 路线数据
 *  @param success
 *  @param failed
 *
 *  @return 返回路线数据解析状态
 */
- (BOOL)p_mapDirectionObject:(nonnull id)responseObj success:(nullable SuccessBlock)success failed:(nullable FailedBlock)failed {
    id json = responseObj;
    if ([json isKindOfClass:[NSData class]]) {
        json = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
    }
    
    if (success && json) {
        
        if ([[json objectForKey:@"status"] integerValue]==0) {
            
            BaiduWebServiceBUSResult *result=[BaiduWebServiceBUSResult yy_modelWithJSON:json];

            if (result.type == FUZZY_TYPE) {
                //模糊结

                result.result=[BaiduBUSFuzzyTypeLine yy_modelWithJSON:result.result];
            }
            else{
                //精准结果
               result.result  =[BaiduBUSUniqueTypeResult yy_modelWithJSON:result.result];

            }
            success(result);
        }else{
            
            failed([json objectForKey:@"status"]);
        }
        return YES;
    } else if (failed) {
        NSError *error = [NSError errorWithDomain:SouthgisErrorDomain code:-8001 userInfo:@{@"message": @"公交查询结果解析失败"}];
        failed(error);
        return YES;
    }
    
    return NO;
}


/**
 *  @author crash         crash_wu@163.com   , 16-04-26 10:04:10
 *
 *  @brief  驾车路线数据解析
 *
 *  @param responseObj 路线数据
 *  @param success
 *  @param failed
 *
 *  @return 返回路线数据解析状态
 */
- (BOOL)p_mapCarDirectionObject:(nonnull id)responseObj success:(nullable SuccessBlock)success failed:(nullable FailedBlock)failed {
    id json = responseObj;
    if ([json isKindOfClass:[NSData class]]) {
        json = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
    }
    

    if (success && json) {
        
        if ([[json objectForKey:@"status"] integerValue]==0) {
            
            BaiduDrivingSearchResult *result = [BaiduDrivingSearchResult yy_modelWithJSON:json];
            
            if ([result.type integerValue] ==FUZZY_TYPE) {
                //模糊
                
                result.result= [BaiduDrivingFuzzyTypeResult yy_modelWithJSON:result.result];
                
            }else{
                //精准
                result.result=[BaiduDrivingUniqueTypeResult yy_modelWithJSON:result.result];
            }
            
            success(result);
        }else{
            
            failed([json objectForKey:@"status"]);
        }
        return YES;
    } else if (failed) {
        NSError *error = [NSError errorWithDomain:SouthgisErrorDomain code:-8001 userInfo:@{@"message": @"公交查询结果解析失败"}];
        failed(error);
        return YES;
    }
    
    return NO;
}




#pragma mark -地址拼接
/**
 *  @author crash         crash_wu@163.com   , 16-04-25 15:04:30
 *
 *  @brief 请求地址拼接
 *
 *  @param dict 请求参数
 *  @param uri 请求地址 例如：/geocoder/v2/?
 *
 *  @return 请求地址拼接
 */
- (nonnull NSString *)p_bdWebServerURLWithDictionary:(nonnull NSDictionary<NSString *, id> *)dict andURI:(nonnull NSString *)uri {
    NSString *paramsStrIgnoreSK = [self p_paramsStringWithDictionary:dict];
    NSString *sk = dict[@"sk"];
    NSString *basicString = [NSString stringWithFormat:@"%@?%@%@", uri, paramsStrIgnoreSK, sk];
    NSString *sn = [self p_SNCodeByString:basicString];
    return [kBaiduWebServiceRootString stringByAppendingFormat:@"%@?%@&sn=%@", uri, paramsStrIgnoreSK, sn];
}


// 私有方法，拼接params字符串
- (nullable NSString *)p_paramsStringWithDictionary:(nonnull NSDictionary<NSString *, id> *)dict {
    NSMutableString *result = @"".mutableCopy;
    NSArray *sortedArr = [self p_allKeysSortedWithDictionary: dict];
    
    for (NSString *key in sortedArr) {
        if ([key isEqualToString:@"sk"]) {
            continue ;
        }
        
        [result appendFormat:@"%@=%@&", key, dict[key]];
    }
    
    if (result.length > 0) {
        // 去掉最后一个&
        NSRange range = {result.length-1, 1};
        [result deleteCharactersInRange:range];
    }
    
    return [result stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

// 私有方法，对字典的键升序排序
- (nonnull NSArray *)p_allKeysSortedWithDictionary:(nonnull NSDictionary<NSString *, id> *)dict {
    return [dict.allKeys sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}

// 私有方法，计算SN码
- (nonnull NSString *)p_SNCodeByString:(nonnull NSString *)string {
    unsigned char md5CStr[CC_MD5_DIGEST_LENGTH];
    const char *cStr = [[self p_stringByURLEncode:string] cStringUsingEncoding:NSUTF8StringEncoding];
    
    CC_MD5(cStr, (CC_LONG)strlen(cStr), md5CStr);
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x", md5CStr[i]];
    }
    return result.copy;
}




@end
