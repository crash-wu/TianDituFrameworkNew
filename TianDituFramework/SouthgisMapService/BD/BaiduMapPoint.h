//
//  BaiduMapPoint.h
//  TianDituFramework
//
//  Created by Lee on 16/4/25.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface  BdLngLat : NSObject

// 经度
@property (nonatomic, strong) NSNumber  *lng;

// 维度
@property (nonatomic, strong) NSNumber *lat;

@end


@interface BaiduMapPoint : NSObject

@property(nonatomic,strong) BdLngLat *destinationPt;
@property(nonatomic,strong) BdLngLat *originPt;

@end



