//
//  LoggerDao.h
//  TianDituFramework
//
//  Created by 吴小星 on 16/4/21.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  @brief  日记类型
 */
typedef NS_ENUM(NSInteger,LOGGERTYPE){
    /**
     *  @brief  普通操作
     */
    LOGTYPE_OPERATION=1,
    /**
     *  @brief  系统类型
     */
     LOGTYPE_SYSTEM,
    /**
     *  @brief  系统异常
     */
     LOGTYPE_ERROR,
    /**
     *  @brief  其他类型
     */
    LOGTYPE_OTHER//其他类型
};



/**
 *  @brief  日记类型实体
 */
@interface LoggerDao : NSObject

@property(nonatomic,strong) NSString *sysCode;//系统名称
@property(nonatomic,assign) LOGGERTYPE logType;//日记类型
@property(nonatomic,strong) NSString *moduleCode;//模块名称
@property(nonatomic,strong) NSString *createTime;//创建时间
@property(nonatomic,strong) NSString *equipmentType;//设备类型
@property(nonatomic,strong) NSString *equipmentNo;//系统版本
@property(nonatomic,strong) NSString *content;//日记内容


/**
 *  @brief  初始化日记实体
 *
 *  @return 日记实体对象
 */
-(instancetype)initLoggerDao;

@end
