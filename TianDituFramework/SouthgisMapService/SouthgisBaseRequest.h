//
//  SouthgisBaseRequest.h
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/29.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>



/**
 *  Handler处理完成后调用的Block
 */
typedef void (^CompleteBlock)();

/**
 *  Handler处理成功时调用的Block
 */
typedef void (^SuccessBlock)(id obj);

/**
 *  Handler处理失败时调用的Block
 */
typedef void (^FailedBlock)(id obj);




@interface SouthgisBaseRequest : NSObject


@property (nonatomic,copy) NSString *_id;//ID
@property (nonatomic ,assign    ) NSInteger      status;//状态
@property (nonatomic  ,strong   ) NSString *msg;//状态信息
@property (nonatomic  ,strong   ) NSString *version;//版本号
@property (nonatomic  ,strong   ) NSString *updateURL;//升级URL
@property (nonatomic  ,assign   ) NSInteger      code;//其他请求状态
@property (nonatomic  ,strong   ) NSString *des;//错误信息描述




/**
 *  解析HTTP返回异常JSON
 *
 *  @param json
 *
 *  @return
 */
//+ (SouthgisBaseRequest *)parseResponseErrorJSON:(id)json;

/**
 *  解析成功或失败状态JSON
 *
 *  @param json
 *
 *  @return
 */
//+ (SouthgisBaseRequest *)parseResponseStatusJSON:(id)json;

/**
 *  解析版本号及升级URL JSON
 *
 *  @param json
 *
 *  @return
 */
//+ (SouthgisBaseRequest *)parseResponseUpdateJSON:(id)json;

@end
