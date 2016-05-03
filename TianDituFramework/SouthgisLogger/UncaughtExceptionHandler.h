//
//  UncaughtExceptionHandler.h
//
//  Created by 吴小星 on 16/4/21.
//  Copyright (c) 2016年  吴小星. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoggerUtil.h"

@interface UncaughtExceptionHandler:NSObject

@end


/**
 *  @brief  系统异常监听
 */
void UncaughtExceptionMonitor(void);


