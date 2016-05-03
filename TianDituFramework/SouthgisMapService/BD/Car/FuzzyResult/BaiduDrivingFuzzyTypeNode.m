//
//  BaiduDrivingFuzzyTypeNode.m
//  TianDituFramework
//
//  Created by Lee on 16/4/26.
//  Copyright © 2016年 crash. All rights reserved.
//

#import "BaiduDrivingFuzzyTypeNode.h"
#import "YYModel.h"

@implementation BaiduDrivingFuzzyTypeNode
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"content" : NSStringFromClass([BaiduDrivingFuzzyTypeNodeAddress class])};
}

- (NSString *)description {
    return[self yy_modelDescription];
}
@end
