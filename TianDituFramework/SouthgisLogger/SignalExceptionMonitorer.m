//
//  SignalHandler.h
//
//  Created by 吴小星 on 16/4/21.
//  Copyright (c) 2016年  吴小星. All rights reserved.
//

#import "SignalExceptionMonitorer.h"
#include <libkern/OSAtomic.h>
#include <execinfo.h>
#import <UIKit/UIKit.h>
#import "UncaughtExceptionHandler.h"
#import "ExceptionModel.h"

@interface SignalExceptionMonitorer()<UIAlertViewDelegate>

@end


@implementation SignalExceptionMonitorer


/**
 *  @author crash         crash_wu@163.com   , 16-04-22 11:04:18
 *
 *  @brief  保存异常日记
 *
 *  @param exceptionInfo signal异常信息
 */
+(void)saveCrash:(NSString *)exceptionInfo
{
    NSString * _libPath  = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"SigCrash"];
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
 *  @author crash         crash_wu@163.com   , 16-04-22 11:04:56
 *
 *  @brief  处理signal 信号
 *
 *  @param signal signal 量
 */
void SignalExceptionHandler(int signal)
{
    NSMutableString *mstr = [[NSMutableString alloc] init];
    [mstr appendString:@"Stack:\n"];
    void* callstack[128];
    int i, frames = backtrace(callstack, 128);
    char** strs = backtrace_symbols(callstack, frames);
    for (i = 0; i <frames; ++i) {
        [mstr appendFormat:@"%s\n", strs[i]];
    }
    [SignalExceptionMonitorer saveCrash:mstr];

}

/**
 *  @author crash         crash_wu@163.com   , 16-04-22 11:04:53
 *
 *  @brief  注册signal 异常监听
 */
void SignalExceptionMonitor(void)
{
    signal(SIGHUP, SignalExceptionHandler);
    signal(SIGINT, SignalExceptionHandler);
    signal(SIGQUIT, SignalExceptionHandler);
    
    signal(SIGABRT, SignalExceptionHandler);
    signal(SIGILL, SignalExceptionHandler);
    signal(SIGSEGV, SignalExceptionHandler);
    signal(SIGFPE, SignalExceptionHandler);
    signal(SIGBUS, SignalExceptionHandler);
    signal(SIGPIPE, SignalExceptionHandler);
}

