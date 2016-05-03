//
//  SGXMLParser.h
//  TianDituFramework
//
//  Created by 吴小星 on 16/4/29.
//  Copyright © 2016年 crash. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SGXMLParser : NSObject<NSXMLParserDelegate>


+ (NSArray *)convertDictionaryArray:(NSArray *)dictionaryArray toObjectArrayWithClassName:(NSString *)className classVariables:(NSArray *)classVariables;
+ (id)getDataAtPath:(NSString *)path fromResultObject:(NSDictionary *)resultObject;
+ (NSArray *)getAsArray:(id)object; //Utility function to get single NSDictionary object inside a array, if array is passed return the same

- (NSDictionary *)parseData:(NSData *)XMLData;

@end
