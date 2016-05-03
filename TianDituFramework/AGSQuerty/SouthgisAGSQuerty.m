//
//  SouthgisAGSQuerty.m
//  TianDituFramework
//
//  Created by 吴小星 on 16/3/21.
//  Copyright © 2016年 crash. All rights reserved.
//

#import "SouthgisAGSQuerty.h"
#import "SouthgisArcGisExtenHeadFile.h"

@interface SouthgisAGSQuerty()<AGSQueryTaskDelegate>{
    

    
}



@end

@implementation SouthgisAGSQuerty

/**
 *  @author crash         crash_wu@163.com   , 16-03-22 10:03:40
 *
 *  @brief  初始化查询对象
 *
 *  @param URL   查询的URL
 *  @param query AGSQueryTask 操作参数
 *
 *  @return 查询对象
 */
-(instancetype)initWithURL:(NSString *)URL andQuery:(AGSQuery *)query {
    
    self=[super init];
    
    if (self) {
        
        //set up query task against layer, specify the delegate
        self.queryTask = [AGSQueryTask queryTaskWithURL:[NSURL URLWithString:URL]];
        self.queryTask.delegate = self;
        [self.queryTask executeWithQuery:query];
        [SVProgressHUD showWithStatus:@"正在查询...."];
       
    }
    return self;
    
}



#pragma mark AGSQueryTaskDelegate


//results are returned
- (void)queryTask:(AGSQueryTask *)queryTask operation:(NSOperation *)op didExecuteWithFeatureSetResult:(AGSFeatureSet *)featureSet {

    [SVProgressHUD showSuccessWithStatus:@"查询成功!"];
    if ([self.southgisAGSQuertyDelegate respondsToSelector:@selector(quertyWithFeatureSetResult:)]) {
        
        [self.southgisAGSQuertyDelegate quertyWithFeatureSetResult:featureSet ];
    }
}

//if there's an error with the query display it to the user
- (void)queryTask:(AGSQueryTask *)queryTask operation:(NSOperation *)op didFailWithError:(NSError *)error {

    [SVProgressHUD showErrorWithStatus:@"查询失败!"];
    if ([self.southgisAGSQuertyDelegate respondsToSelector:@selector(quertyDidFailWithError:)]) {
        
        [self.southgisAGSQuertyDelegate quertyDidFailWithError:error];
        
    }
}


@end
