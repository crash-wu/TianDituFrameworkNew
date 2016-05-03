//
//  NSObject+extObjectToJSON.h
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/17.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSObject (extObjectToJSON)


/**
 *  @author crash         crash_wu@163.com   , 16-03-16 16:03:10
 *
 *  @brief  将实体，或者字典转化成JSON字符串
 *
 *  @return JSON字符串
 */
- (NSString *)objectToString;



/**
 *  @author crash         crash_wu@163.com   , 16-03-16 11:03:20
 *
 *  @brief  将字典转化成JSON字符串
 *
 *  @param dic 需要转换的字典
 *
 *  @return 返回JSON字符串
 */
- (NSString*)dictionaryToJson:(NSDictionary *)dic;

@end
