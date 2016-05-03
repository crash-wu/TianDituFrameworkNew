//
//  LoggerUtil.m
//  TianDituFramework
//
//  Created by 吴小星 on 16/4/21.
//  Copyright © 2016年 crash. All rights reserved.
//

#import "LoggerUtil.h"


#define LOGGER_DB_NAME @"logger_db_name" //日记数据库名称
#define LOGGER_DB_TABLE_NAME @"logger_db_table_name" //日记数据库表格名称

@interface LoggerUtil()


@property(nonatomic,strong) dispatch_semaphore_t semaphore;//信号量
@property(nonatomic,assign) NSInteger loggerNum;//日记数量
@end

@implementation LoggerUtil


/**
 *  @brief  初始化日记处理类（单例模式）
 *
 *  @return 日记处理对象
 */
+(LoggerUtil *)defaultLoggerUtil{
    
    static LoggerUtil *instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[self alloc] init];
        instance.semaphore = dispatch_semaphore_create(1);
        
    });
    return instance;
}


/**
 *  @brief  系统操作日记
 *
 *  @param moduleCode 模块名称
 *  @param content    日记内容
 */
-(void)addOperationLog:(NSString *)moduleCode andContent :(NSString *)content{
    
    LoggerDao *dao =[[LoggerDao alloc]initLoggerDao];
    dao.logType=LOGTYPE_OPERATION;
    
    self.loggerNum +=1;
    //创建异步线程
    dispatch_queue_t  queue = dispatch_queue_create("operation",NULL );
    dispatch_async(queue,^{
        
        NSDictionary *dic = @{@"sysCode":dao.sysCode,@"logType":[NSNumber numberWithInteger:dao.logType],@"moduleCode":moduleCode,@"createTime":dao.createTime,@"equipmentType":dao.equipmentType,@"equipmentNo":dao.equipmentNo,@"content":content};
        
        //给资源池添加锁，防止资源抢夺
        dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
        
        //创建数据库
        YTKKeyValueStore *store =[[YTKKeyValueStore alloc] initDBWithName:LOGGER_DB_NAME];
        //创建数据表
        [store createTableWithName:LOGGER_DB_TABLE_NAME];
        [store putObject:dic withId:[NSString stringWithFormat:@"loggerID:%ld",(long)self.loggerNum] intoTable:LOGGER_DB_TABLE_NAME];
        
        dispatch_semaphore_signal(self.semaphore);
        
    });
    
}


/**
 *  @brief  系统日记
 *
 *  @param moduleCode 模块名称
 *  @param content    日记内容
 */
-(void) addSysServiceLog:(NSString *)moduleCode andContent :(NSString *)content{
    
    LoggerDao *dao =[[LoggerDao alloc]initLoggerDao];
    dao.logType=LOGTYPE_SYSTEM;
    
    self.loggerNum +=1;
    //创建异步线程
    dispatch_queue_t  queue = dispatch_queue_create("operation",NULL );
    dispatch_async(queue,^{
        
        NSDictionary *dic = @{@"sysCode":dao.sysCode,@"logType":[NSNumber numberWithInteger:dao.logType],@"moduleCode":moduleCode,@"createTime":dao.createTime,@"equipmentType":dao.equipmentType,@"equipmentNo":dao.equipmentNo,@"content":content};
        
        //给资源池添加锁，防止资源抢夺
        dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
        //创建数据库
        YTKKeyValueStore *store =[[YTKKeyValueStore alloc] initDBWithName:LOGGER_DB_NAME];
        //创建数据表
        [store createTableWithName:LOGGER_DB_TABLE_NAME];
        [store putObject:dic withId:[NSString stringWithFormat:@"loggerID:%ld",(long)self.loggerNum] intoTable:LOGGER_DB_TABLE_NAME];
        
        dispatch_semaphore_signal(self.semaphore);
        
    });
}


/**
 *  @brief  系统异常日记
 *
 *  @param moduleCode 模块名称
 *  @param content    日记内容
 */
-(void )addErrorLog:(NSString *)moduleCode andContent :(NSString *)content{
    
    LoggerDao *dao =[[LoggerDao alloc]initLoggerDao];
    dao.logType=LOGTYPE_ERROR;
    
    self.loggerNum +=1;
    
    
    NSDictionary *dic = @{@"sysCode":dao.sysCode,@"logType":[NSNumber numberWithInteger:dao.logType],@"moduleCode":moduleCode,@"createTime":dao.createTime,@"equipmentType":dao.equipmentType,@"equipmentNo":dao.equipmentNo,@"content":content};
    
    //给资源池添加锁，防止资源抢夺
    dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
    //创建数据库
    YTKKeyValueStore *store =[[YTKKeyValueStore alloc] initDBWithName:LOGGER_DB_NAME];
    //创建数据表
    [store createTableWithName:LOGGER_DB_TABLE_NAME];
    [store putObject:dic withId:[NSString stringWithFormat:@"loggerID:%ld",(long)self.loggerNum] intoTable:LOGGER_DB_TABLE_NAME];
    
    dispatch_semaphore_signal(self.semaphore);
   
}


/**
 *  @brief  系统异常日记
 *
 *  @param moduleCode 模块名称
 *  @param content    日记内容
 */
-(void)addOtherLog:(NSString *)moduleCode andContent :(NSString *)content{
    
    LoggerDao *dao =[[LoggerDao alloc]initLoggerDao];
    dao.logType=LOGTYPE_OTHER;
    
    self.loggerNum +=1;
    //创建异步线程
    dispatch_queue_t  queue = dispatch_queue_create("operation",NULL );
    dispatch_async(queue,^{
        
        NSDictionary *dic = @{@"sysCode":dao.sysCode,@"logType":[NSNumber numberWithInteger:dao.logType],@"moduleCode":moduleCode,@"createTime":dao.createTime,@"equipmentType":dao.equipmentType,@"equipmentNo":dao.equipmentNo,@"content":content};
        
        //给资源池添加锁，防止资源抢夺
        dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
        //创建数据库
        YTKKeyValueStore *store =[[YTKKeyValueStore alloc] initDBWithName:LOGGER_DB_NAME];
        //创建数据表
        [store createTableWithName:LOGGER_DB_TABLE_NAME];
        [store putObject:dic withId:[NSString stringWithFormat:@"loggerID:%ld",(long)self.loggerNum] intoTable:LOGGER_DB_TABLE_NAME];
        
        dispatch_semaphore_signal(self.semaphore);
        
    });
    
}

/**
 *  @brief  上传日记到服务器
 *
 *  @param servicehost  服务器地址
 */
-(void)uploadLoggerToService:(NSString *)servicehost{


    
    dispatch_queue_t queue =dispatch_queue_create("uploadLogger", NULL);
    
    dispatch_async(queue, ^{
        
        YTKKeyValueStore *store =[[YTKKeyValueStore alloc]initDBWithName:LOGGER_DB_NAME];
        NSArray  *array= [store getAllItemsFromTable:LOGGER_DB_TABLE_NAME];
        
        NSMutableArray *mutbArray=[NSMutableArray array];
        
        for (YTKKeyValueItem *dic in array){
            
            [mutbArray addObject:dic.itemObject];
        }

        NSString *json= [mutbArray yy_modelToJSONString];
        json=[self p_stringByURLEncode:json];
        
        NSString *url =[NSString stringWithFormat:@"%@/mobile_config/api/mobileLog/saveMobileLog.do?json=%@",servicehost,json];
        
        [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:url] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

            if (error) {

                return ;
            }
            
            if (!data || data.length == 0) {
                return ;
            }
            
            id json;
            if ([data isKindOfClass:[NSData class]]) {
                json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            }
            if (![json objectForKey:@"code"] &&([[json objectForKey:@"code"] integerValue]==200)) {
                
                [store clearTable:LOGGER_DB_TABLE_NAME];
            }
            
            return;
            
        }]resume];
        
        /*
        NSDictionary *param =@{@"json":json};

        AFHTTPSessionManager *httpManager = [AFHTTPSessionManager manager];

        //请求参数序列化类型
        //响应结果序列化类型
        httpManager.responseSerializer = [AFJSONResponseSerializer serializer];
        httpManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",@"text/json", @"text/plain",@"text/xml", nil];
        [httpManager POST:url parameters:param success:^(NSURLSessionDataTask *task, id responseObject) {
            
           // NSLog(@"res=%@",responseObject);
            NSDictionary *dictionary =(NSDictionary *)responseObject;
            if (![dictionary objectForKey:@"code"] &&([[dictionary objectForKey:@"code"] integerValue]==200)) {
                
                [store clearTable:LOGGER_DB_TABLE_NAME];
            }
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            
            
        }];*/
        
    });
         
}


/**
 *  @author crash         crash_wu@163.com   , 16-04-27 09:04:07
 *
 *  @brief 转换非URL规范字符
 *
 *  @param str 需要转化的字符串
 *
 *  @return 返回转化成功的字符串
 */
- (nonnull NSString *)p_stringByURLEncode:(nonnull NSString *)str {
    static NSString * const kAFCharactersGeneralDelimitersToEncode = @":#[]@?/";
    static NSString * const kAFCharactersSubDelimitersToEncode = @"!$&'()*+,;=";
    
    NSMutableCharacterSet * allowedCharacterSet = [[NSCharacterSet URLQueryAllowedCharacterSet] mutableCopy];
    [allowedCharacterSet removeCharactersInString:[kAFCharactersGeneralDelimitersToEncode stringByAppendingString:kAFCharactersSubDelimitersToEncode]];
    static NSUInteger const batchSize = 50;
    
    NSUInteger index = 0;
    NSMutableString *escaped = @"".mutableCopy;
    
    while (index < str.length) {
        NSUInteger length = MIN(str.length - index, batchSize);
        NSRange range = NSMakeRange(index, length);
        range = [str rangeOfComposedCharacterSequencesForRange:range];
        NSString *substring = [str substringWithRange:range];
        NSString *encoded = [substring stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacterSet];
        [escaped appendString:encoded];
        
        index += range.length;
    }
    return escaped;
}


@end
