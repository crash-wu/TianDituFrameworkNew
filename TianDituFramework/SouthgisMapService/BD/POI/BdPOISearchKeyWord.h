//
//  BdPOISearchKeyWord.h
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/31.
//  Copyright © 2016年 crash. All rights reserved.
//


#import <Foundation/Foundation.h>

/**
 *  @author crash         crash_wu@163.com   , 16-03-31 14:03:15
 *
 *  @brief  百度地图POI搜索实体
 */
@interface BdPOISearchKeyWord : NSObject

@property(nonatomic,strong) NSString *location;//点坐标 lat<纬度>,lng<经度>

@property(nonatomic,strong) NSString *ak;//百度开发平台上的key

@property(nonatomic,strong) NSString *output;//搜索结果输出格式

@property(nonatomic,strong) NSString *query;//关键字

@property(nonatomic,assign) NSInteger page_size;//页面

@property(nonatomic,assign) NSInteger page_num;//每页多少条

@property(nonatomic,assign) NSInteger scope;//检索结果详细程度。取值为1 或空，则返回基本信息；取值为2，返回检索POI详细信息

@property(nonatomic,assign) NSInteger radius;//半径

@property(nonatomic,strong) NSString *mcode;//项目bunder,初始化时已经获取

@property(nonatomic,strong) NSString *sk;//百度地图SK码

-(instancetype) initKeyWord;


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
-(NSString *)p_bdMapServerURLWithDictionary:( NSDictionary<NSString *, id> *)dict andURI:( NSString *)uri;

@end
