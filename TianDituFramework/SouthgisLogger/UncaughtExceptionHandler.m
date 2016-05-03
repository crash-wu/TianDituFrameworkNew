//
//  UncaughtExceptionHandler.h
//
//  Created by 吴小星 on 16/4/21.
//  Copyright (c) 2016年  吴小星. All rights reserved.
//

#import "UncaughtExceptionHandler.h"
#include <libkern/OSAtomic.h>
#include <execinfo.h>
#import <UIKit/UIKit.h>
#import "ExceptionModel.h"

@implementation UncaughtExceptionHandler


/**
 *  @brief  保存系统异常日记
 *
 *  @param exceptionInfo 异常信息
 */
+(void)saveCrash:(NSString *)exceptionInfo
{
    NSString * _libPath  = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"OCCrash"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:_libPath]){
        [[NSFileManager defaultManager] createDirectoryAtPath:_libPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%f", a];
    
    NSString * savePath = [_libPath stringByAppendingFormat:@"/error%@.log",timeString];
    
    BOOL sucess = [exceptionInfo writeToFile:savePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    NSLog(@"YES sucess:%d",sucess);
}

@end



/**
 *  @brief  异常信息处理
 *
 *  @param exception 异常信息
 */
void HandleException(NSException *exception)
{
    // 异常的堆栈信息
    NSArray *stackArray = [exception callStackSymbols];
    
    // 出现异常的原因
    NSString *reason = [exception reason];
    
    // 异常名称
  //  NSString *name = [exception name];
    
    //异常出现的所在类，及方法名
    NSString *crashCls=stackArray[3];
    
//    NSString *exceptionInfo = [NSString stringWithFormat:@"Exception reason：%@\nException name：%@\nException stack：%@",name, reason, stackArray];
//    
//    NSLog(@"%@", exceptionInfo);

//    [UncaughtExceptionHandler saveCrash:exceptionInfo];
    
    LoggerUtil *logger = [LoggerUtil defaultLoggerUtil];
    [logger addErrorLog:crashCls andContent:reason];
}


/**
 *  @brief  系统异常监听
 */
void UncaughtExceptionMonitor(void)
{
    NSSetUncaughtExceptionHandler(&HandleException);
}

