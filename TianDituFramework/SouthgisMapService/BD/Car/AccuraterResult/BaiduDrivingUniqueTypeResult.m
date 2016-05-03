//
//  BaiduDrivingUniqueTypeResult.m
//  TianDituFramework
//
//  Created by Lee on 16/4/26.
//  Copyright © 2016年 crash. All rights reserved.
//

#import "BaiduDrivingUniqueTypeResult.h"
#import "YYModel.h"

@implementation BaiduDrivingUniqueTypeResult
// 容器类
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"routes" : NSStringFromClass([BaiduDrivingUniqueTypeScheme class])};
}

// 自定义解析
//- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
//    NSArray *routes = dic[@"routes"];
//    if (![routes isKindOfClass:[NSArray class]]) return NO;
//    
//    NSMutableArray *mutArr = [NSMutableArray arrayWithCapacity:routes.count];
//    for (NSDictionary *route in routes) {
//        id scheme = [route[@"scheme"] firstObject];
//        BaiduDrivingUniqueTypeScheme *drivingScheme = [BaiduDrivingUniqueTypeScheme yy_modelWithJSON:scheme];
//        if (drivingScheme) [mutArr addObject:drivingScheme];
//    }
//    _routes = mutArr.copy;
//    return YES;
//}

- (NSString *)debugDescription {
    return [self yy_modelDescription];
}
@end
