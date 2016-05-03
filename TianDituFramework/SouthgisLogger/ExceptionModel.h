//
//  ExceptionModel.h
//
//  Created by 吴小星 on 16/4/21.
//  Copyright (c) 2016年  吴小星. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const UncaughtExceptionHandlerSignalExceptionName;
extern NSString * const UncaughtExceptionHandlerSignalKey;
extern NSString * const UncaughtExceptionHandlerAddressesKey;

extern const volatile int32_t UncaughtExceptionCount;
extern const int32_t UncaughtExceptionMaximum;

extern const NSInteger UncaughtExceptionHandlerSkipAddressCount;
extern const NSInteger UncaughtExceptionHandlerReportAddressCount;

@interface ExceptionModel : NSObject

@end
