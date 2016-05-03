//
//  BaiduDrivingUniqueTypeScheme.m
//  TianDituFramework
//
//  Created by Lee on 16/4/26.
//  Copyright © 2016年 crash. All rights reserved.
//

#import "BaiduDrivingUniqueTypeScheme.h"
#import "YYModel.h"


@implementation BaiduDrivingUniqueTypeScheme
// 容器类
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"steps" : NSStringFromClass([BaiduDrivingUniqueTypeStep class])};
}

// 自定义解析
//- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
//    NSArray *steps = dic[@"steps"];
//    if (![steps isKindOfClass:[NSArray class]]) return NO;
//    
//    NSMutableArray *mutArr = [NSMutableArray arrayWithCapacity:steps.count];
//    for (NSDictionary *step in steps) {
//        id scheme = [route[@"scheme"] firstObject];
//        BaiduDrivingUniqueTypeScheme *drivingScheme = [BaiduDrivingUniqueTypeScheme yy_modelWithJSON:scheme];
//        if (drivingScheme) [mutArr addObject:drivingScheme];
//    }
//    _steps = mutArr.copy;
//    return YES;
//}

- (NSString *)debugDescription {
    return [self yy_modelDescription];
}
@end
