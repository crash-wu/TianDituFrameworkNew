//
//  BdCarLineSearchKeywork.m
//  TianDituFramework
//
//  Created by 吴小星 on 16/4/26.
//  Copyright © 2016年 crash. All rights reserved.
//

#import "BdCarLineSearchKeyword.h"

@implementation BdCarLineSearchKeyword



-(nullable instancetype)initKeyWord{
    
    self=[super init];
    if (self) {
        
        self.output=@"json";
        self.mcode=[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
        self.mode = @"driving";
    }
    
    return self;
}


- (NSString *)timestamp {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";
    formatter.locale = [NSLocale currentLocale];
    return [formatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:0.0]];
}


@end
