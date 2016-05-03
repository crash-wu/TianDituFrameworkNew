//
//  BdPOISearchKeyWord.m
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/31.
//  Copyright © 2016年 crash. All rights reserved.
//

#import "BdPOISearchKeyWord.h"
#import "CocoaSecurity.h"
#include <CommonCrypto/CommonCrypto.h>


@implementation BdPOISearchKeyWord


-(instancetype) initKeyWord{
    
    self=[super init];
    
    if (self) {
        
        self.output=@"json";
        self.scope=1;
        
        self.mcode=[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    }
    return self;
    
}



@end
