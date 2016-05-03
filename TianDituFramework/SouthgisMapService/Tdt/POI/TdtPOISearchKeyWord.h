//
//  TdtPOISearchKeyWord.h
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/31.
//  Copyright © 2016年 crash. All rights reserved.
//


#import <Foundation/Foundation.h>

/**
 *  @author crash         crash_wu@163.com   , 16-03-31 11:03:31
 *
 *  @brief  天地图POI搜索关键字
 */
@interface TdtPOISearchKeyWord :NSObject


@property(nonatomic,strong)NSString *count;//返回的结果数量(用于分页和缓存)
@property(nonatomic,strong)NSString *start;//返回结果起始位(用于分页 和缓存)默认 0
@property(nonatomic,strong)NSString *keyWord;//搜索的关键字
@property(nonatomic,strong)NSString *queryType;
@property(nonatomic,strong)NSString *mapBound;//查询的地图范围("-x,-y,x,y")
@property(nonatomic,strong)NSString *level;//目前查询的级别
@property(nonatomic,strong)NSString *queryRadius;//查询半径(周边搜索时)
@property(nonatomic,strong)NSString *pointLonlat;//点坐标(周边搜索)


@end
