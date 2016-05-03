//
//  BaiduBUSUniqueTypeResult.m
//  TianDituFramework
//
//  Created by Lee on 16/4/25.
//  Copyright © 2016年 crash. All rights reserved.
//

#import "BaiduBUSUniqueTypeResult.h"
#import "YYModel.h"

@implementation BaiduBUSUniqueTypeResult
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"routes" : NSStringFromClass([BaiduBUSUniqueTypeLine class])};
}

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    NSArray *routes = dic[@"routes"];
    if (![routes isKindOfClass:[NSArray class]]) return NO;
    
    NSMutableArray *mutArr = [NSMutableArray arrayWithCapacity:routes.count];
    for (NSDictionary *route in routes) {
        id scheme = [route[@"scheme"] firstObject];
        BaiduBUSUniqueTypeLine *node = [BaiduBUSUniqueTypeLine yy_modelWithJSON:scheme];
        if (node) [mutArr addObject:node];
    }
    _routes = mutArr.copy;
    return YES;
}

- (NSString *)debugDescription {
    return [self yy_modelDescription];
}
@end
