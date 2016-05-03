//
//  LoggerUtil.h
//  TianDituFramework
//
//  Created by 吴小星 on 16/4/21.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YTKKeyValueStore.h>
#import "LoggerDao.h"
#import <YYModel.h>

/**
 *  @brief  日记处理类
 */
@interface LoggerUtil : NSObject


/**
 *  @brief  初始化日记处理类（单例模式）
 *
 *  @return 日记处理对象
 */
+(LoggerUtil *)defaultLoggerUtil;

/**
 *  @brief  系统操作日记
 *
 *  @param moduleCode 模块名称
 *  @param content    日记内容
 */
-(void)addOperationLog:(NSString *)moduleCode andContent :(NSString *)content;

/**
 *  @brief  系统日记
 *
 *  @param moduleCode 模块名称
 *  @param content    日记内容
 */
-(void) addSysServiceLog:(NSString *)moduleCode andContent :(NSString *)content;

/**
 *  @brief  系统异常日记
 *
 *  @param moduleCode 模块名称
 *  @param content    日记内容
 */
-(void )addErrorLog:(NSString *)moduleCode andContent :(NSString *)content;


/**
 *  @brief  系统异常日记
 *
 *  @param moduleCode 模块名称
 *  @param content    日记内容
 */
-(void)addOtherLog:(NSString *)moduleCode andContent :(NSString *)content;


/**
 *  @brief  上传日记到服务器
 *
 *  @param servicehost  服务器地址
 */
-(void)uploadLoggerToService:(NSString *)servicehost;

@end
