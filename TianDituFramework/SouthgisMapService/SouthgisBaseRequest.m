//
//  SouthgisBaseRequest.m
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/29.
//  Copyright © 2016年 crash. All rights reserved.
//

#import "SouthgisBaseRequest.h"


static NSString * const MSG = @"msg";
static NSString * const STATUS = @"status";
static NSString * const RES = @"res";
static NSString * const CODE = @"code";
static NSString * const DESC = @"description";//description


@implementation SouthgisBaseRequest



/*
+(SouthgisBaseRequest* )parseResponseErrorJSON:(id)json
{
    NSLog(@"%@",json);
    
    if ([NSJSONSerialization isValidJSONObject:json]) {
        SouthgisBaseRequest *baseEntity = [[SouthgisBaseRequest alloc] init];
        baseEntity.status = [((NSNumber *)[json objectForKey:STATUS]) intValue];
        
        baseEntity.code = [((NSNumber *)[json objectForKey:CODE])
                           intValue];
        if ([json objectForKey:DESC]) {
            baseEntity.des = [json objectForKey:DESC];
        }
        return baseEntity;
    }
    return nil;
}




+ (SouthgisBaseRequest *)parseResponseStatusJSON:(id)json
{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:json options:NSJSONWritingPrettyPrinted error:nil];
    //格式化打印输出至控制台
    NSString *responseJSON = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSLog(@"%@",responseJSON);
    NSDictionary *dic_json = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:nil];
    if ([NSJSONSerialization isValidJSONObject:dic_json]) {
        NSNumber *status = (NSNumber *)[dic_json objectForKey:STATUS];
        SouthgisBaseRequest *baseEntity = [[SouthgisBaseRequest alloc] init];
        baseEntity.status = [status intValue];
        
        if ([dic_json objectForKey:MSG]) {
            
            baseEntity.msg = [dic_json objectForKey:MSG];
        }
        baseEntity.code = [((NSNumber *)[dic_json objectForKey:CODE])
                           intValue];
        
        if ([dic_json objectForKey:DESC]) {
            baseEntity.des = [dic_json objectForKey:DESC];
        }
        
        
        return baseEntity;
    }
    return nil;
}




+(SouthgisBaseRequest *)parseResponseUpdateJSON:(id)json
{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:json options:NSJSONWritingPrettyPrinted error:nil];
    //格式化打印输出至控制台
  //  NSString *responseJSON = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    NSDictionary *dic_json = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:nil];
    if ([NSJSONSerialization isValidJSONObject:dic_json]) {
        NSNumber *status = (NSNumber *)[dic_json objectForKey:STATUS];
        SouthgisBaseRequest *baseEntity = [[SouthgisBaseRequest alloc] init];
        baseEntity.status = [status intValue];
        baseEntity.code = [((NSNumber *)[dic_json objectForKey:CODE])
                           intValue];
        id res = [dic_json objectForKey:RES];
        baseEntity.version = [res objectForKey:@"v"];
        baseEntity.updateURL = [res objectForKey:@"url"];
        return baseEntity;
    }
    return nil;
}


*/

@end
