//
//  BaiduBUSUniqueTypeLine.m
//  TianDituFramework
//
//  Created by Lee on 16/4/25.
//  Copyright © 2016年 crash. All rights reserved.
//

#import "BaiduBUSUniqueTypeLine.h"
#import "YYModel.h"

@implementation BaiduBUSUniqueTypeLine
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"steps" : NSStringFromClass([BaiduBUSUniqueTypeNode class])};
}

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    NSArray *steps = dic[@"steps"];
    if (![steps isKindOfClass:[NSArray class]]) return NO;
    
    NSMutableArray *mutArr = [NSMutableArray arrayWithCapacity:steps.count];
    for (NSArray *step in steps) {
        NSMutableArray *subStepMutArr = [NSMutableArray arrayWithCapacity:step.count];
        for (NSDictionary *subStep in step) {
            BaiduBUSUniqueTypeNode *node = [BaiduBUSUniqueTypeNode yy_modelWithDictionary:subStep];
            if (node) [subStepMutArr addObject:node];
        }
        
        [mutArr addObject:subStepMutArr.copy];
    }
    _steps = mutArr.copy;
    return YES;
}

- (NSString *)debugDescription {
    return [self yy_modelDescription];
}
@end
