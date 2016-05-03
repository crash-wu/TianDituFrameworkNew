//
//  RTHttpClient.h
//  ZLYDoc
//  HTTP网络请求
//  Created by Ryan on 14-4-10.
//  Copyright (c) 2014年 ZLY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

//HTTP REQUEST METHOD TYPE
typedef NS_ENUM(NSInteger, RTHttpRequestType) {
    RTHttpRequestGet,
    RTHttpRequestPost,
    RTHttpRequestDelete,
    RTHttpRequestPut,
};

/**
 *  请求开始前预处理Block
 */
typedef void(^PrepareExecuteBlock)(void);

/****************   RTHttpClient   ****************/
@interface RTHttpClient : NSObject


//返回值为XML
- (instancetype)initHttpXML;

+ (RTHttpClient *)defaultClient;

//需要POST JSON 到服务器
+ (RTHttpClient *)postJSONClient;

//针对postJSON中有些返回值是XML，定制接收类型
- (void)setResponseAcceptableContentTypes:(AFHTTPResponseSerializer <AFURLResponseSerialization> *)responseSerializer;

/**
 *  HTTP请求（GET、POST、DELETE、PUT）
 *
 *  @param path
 *  @param method     RESTFul请求类型
 *  @param parameters 请求参数
 *  @param prepare    请求前预处理块
 *  @param success    请求成功处理块
 *  @param failure    请求失败处理块
 */
- (void)requestWithPath:(NSString *)url
                method:(NSInteger)method
            parameters:(id)parameters
        prepareExecute:(PrepareExecuteBlock) prepare
               success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
               failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

/**
 *  HTTP请求（HEAD）
 *
 *  @param path
 *  @param parameters
 *  @param success
 *  @param failure
 */
- (void)requestWithPathInHEAD:(NSString *)url
                  parameters:(NSDictionary *)parameters
                     success:(void (^)(NSURLSessionDataTask *task))success
                     failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

/**
 *  POST请求
 *  参数带JSON
 *  @param path
 *  @param parameters
 *  @param success
 *  @param failure
 */
- (void)postJSONWithPath:(NSString *)url
              parameters:(id)parameters prepareExecute:(PrepareExecuteBlock)prepareExecute
                 success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                 failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

//判断当前网络状态
- (BOOL)isConnectionAvailable;

@end
