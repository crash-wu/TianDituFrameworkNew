//
//  CarLineSearch.h
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/17.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>




/**
 *  @author crash         crash_wu@163.com   , 16-03-17 10:03:43
 *
 *  @brief  驾车路线规划类型
 */
typedef NS_ENUM(NSInteger,DriverType){
    
    FastType=0,//最快路线
    ShortType,//最短路线
    AvoidHightRoutType,//避开高速
    WalkType//步行
    
};

/**
 *  @author crash         crash_wu@163.com   , 16-03-17 10:03:46
 *
 *  @brief  驾车规划请求参数实体
 */
@interface CarLineSearch : NSObject

@property(nonatomic,strong) NSString *orig;//起点经纬度
@property(nonatomic,strong) NSString *dest;//终点经纬度
@property(nonatomic,strong) NSString *mid;//途径点经纬度和 类型集合
@property(nonatomic,assign) DriverType style;//驾车路线规划类型


@end
