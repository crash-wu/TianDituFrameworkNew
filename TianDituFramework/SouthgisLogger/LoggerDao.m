//
//  LoggerDao.m
//  TianDituFramework
//
//  Created by 吴小星 on 16/4/21.
//  Copyright © 2016年 crash. All rights reserved.
//

#import "LoggerDao.h"
#import <UIKit/UIKit.h>

@implementation LoggerDao


/**
 *  @brief  初始化日记实体
 *
 *  @return 日记实体对象
 */
-(instancetype)initLoggerDao{
    
    self = [super init];
    if (self) {
        
        
        //手机系统版本
        self.equipmentNo =[NSString stringWithFormat:@"%@:%@",[[UIDevice currentDevice] systemName], [[UIDevice currentDevice] systemVersion]];

        //手机型号
        self.equipmentType = [[UIDevice currentDevice] model];

        //获取APP名称
        self.sysCode = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"];
        
        //获取当前时间
        NSDateFormatter *formatter =[[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
        self.createTime=[formatter stringFromDate:[NSDate date]];
        
        
    }
    
    return self;
}

@end
