//
//  TiandituPOIEntity.h
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/17.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>



/**
 *  @author crash         crash_wu@163.com   , 16-03-16 12:03:20
 *
 *  @brief  天地图POI搜索结果实体类
 */

@interface TdtPOIResult : NSObject


@property(nonatomic,strong,readwrite) NSString *name;//POI点名称
@property(nonatomic,strong,readwrite) NSString *phone;//电话号码
@property(nonatomic,strong,readwrite) NSString *address;//地址
@property(nonatomic,strong,readwrite) NSString *lonlat;//POI点坐标
@property(nonatomic,assign,readwrite) NSInteger distance;//距离


@end
