//
//  SignalMonitor.h
//
//  Created by 吴小星 on 16/4/21.
//  Copyright (c) 2016年  吴小星. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  @author crash         crash_wu@163.com   , 16-04-22 11:04:01
 *
 *  @brief  Signal 异常监听类
 */
@interface SignalExceptionMonitorer : NSObject


/**
 *  @author crash         crash_wu@163.com   , 16-04-22 11:04:30
 *
 *  @brief 保存异常日记
 *
 *  @param exceptionInfo 异常信息
 */
+(void)saveCrash:(NSString *)exceptionInfo;

@end

/**
 *  @brief  Signal异常监听
 */
void SignalExceptionMonitor(void);
