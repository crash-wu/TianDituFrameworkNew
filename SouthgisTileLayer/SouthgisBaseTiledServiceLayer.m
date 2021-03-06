//
//  SouthgisTiledServiceLayer.m
//  RTLibrary-ios
//
//  Created by Jeremy on 16/3/28.
//  Copyright © 2016年 zlycare. All rights reserved.
//
 
#import "SouthgisBaseTiledServiceLayer.h"

NSString *const DataKey = @"data";
NSString *const FullEnvelopKey = @"fullEnvelop";
NSString *const TileInfoKey = @"tileInfo";

@interface SouthgisBaseTiledServiceLayer()

@property(nonatomic,strong)AGSTileKey* tilekey;

@end

@implementation SouthgisBaseTiledServiceLayer

-(AGSUnits)units{
    return _units;
}

/**********重写父类方法***********/
-(AGSSpatialReference *)spatialReference{
    return _fullEnvelope.spatialReference;
}

-(AGSEnvelope *)fullEnvelope{
    return _fullEnvelope;
}

-(AGSEnvelope *)initialEnvelope{
    //Assuming our initial extent is the same as the full extent
    return _fullEnvelope;
}

-(AGSTileInfo*) tileInfo{
    return _tileInfo;
}

- (NSInteger)currentLevel{
    
    return self.tilekey.level;
}

- (instancetype)initWithCachePath:(NSString *)cachePath{
    
    if (self = [super init]) {
        self.cacheDocPath = cachePath;
        _requestQueue = [[NSOperationQueue alloc] init];
        [_requestQueue setMaxConcurrentOperationCount:16];
    }
     
    return self;
}

- (void)setTileData:(NSData *)data forKey:(AGSTileKey *)tilekey{

    //如果存在路径就缓存
    if (self.cacheDocPath != NULL)
        [self cacheTiledDataInLocalData:data forKey:tilekey];
    
    
    [super setTileData:data forKey:tilekey];
    
    self.tilekey = tilekey;
}


/**
 * @author Jeremy, 16-03-28 17:03:54
 *
 * 用归档方式缓存数据
 *
 * @param data    切片数据
 * @param tilekey 切片信息
 */
- (void)cacheTiledDataInLocalData:(NSData *)data forKey:(AGSTileKey *)tilekey{

    if (data == nil) {
        return;
    }
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
     
        NSString *filePath = [self getPathByTileKey:tilekey];
       
        NSMutableData *mData = [[NSMutableData alloc]init];
        //归档保存
        NSKeyedArchiver *archvier = [[NSKeyedArchiver alloc]initForWritingWithMutableData:mData];
        
        [archvier encodeObject:data forKey:DataKey];
        [archvier encodeObject:[_fullEnvelope encodeToJSON] forKey:FullEnvelopKey];
        [archvier encodeObject:[_tileInfo encodeToJSON] forKey:TileInfoKey];
        [archvier finishEncoding];
        //数据保存本地
        [mData writeToFile:filePath atomically:YES];
        
    });

}


/**
 * @author Jeremy, 16-03-28 17:03:13
 *
 * 获取缓存路径
 *
 * @param tileKey 切片信息
 *
 * @return 切片
 */
- (NSData *)getCacheTiledDataFromLocalFile:(AGSTileKey *)tilekey{
    
    NSString *filePath = [self getPathByTileKey:tilekey];
    
    NSMutableData *mData = [[NSMutableData alloc]initWithContentsOfFile:filePath];
   
    if (mData == nil) {
        return nil;
    }
    //接档
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:mData];
   
    NSData *data = [unarchiver decodeObjectForKey:DataKey];
    
    if (_tileInfo == nil) {
        NSDictionary *tileInfoDic = [unarchiver decodeObjectForKey:TileInfoKey];
        _tileInfo = [[AGSTileInfo alloc]initWithJSON:tileInfoDic];
    }
    
    if (_fullEnvelope == nil) {
         NSDictionary *fullEnvelopDic = [unarchiver decodeObjectForKey:FullEnvelopKey];
        _fullEnvelope = [[AGSEnvelope alloc]initWithJSON:fullEnvelopDic];
    }
   
    return data;
}


/**
 * @author Jeremy, 16-03-29 14:03:48
 *
 * 通过tilekey生成切片本地路径
 *
 * @param tilekey 切片信息
 *
 * @return 本地保存路径
 */
- (NSString *)getPathByTileKey:(AGSTileKey *)tilekey{
    
    NSString *fileName = [NSString stringWithFormat:@"%ld.model",tilekey.column];
    
    NSString *filePath = [NSString stringWithFormat:@"%@/%ld/%ld",self.cacheDocPath,tilekey.level,tilekey.row];
    
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        [fileManager createDirectoryAtPath:filePath
               withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    filePath = [filePath stringByAppendingPathComponent:fileName];

    return filePath;
}

/**
 * @author Jeremy, 16-03-30 16:03:23
 *
 * 加载本地切片操作
 *
 * @param tilekey
 * @param loadComplete 完成加载操作
 */
- (void)loadTileDataFromCacheWithTileKey:(AGSTileKey *)tilekey loadCompleteBlock:(void(^)(NSData *data))loadComplete{
    
    NSData *data = [self getCacheTiledDataFromLocalFile:tilekey];
    
    if (loadComplete != nil)
        loadComplete(data);
    
}


int MakeAGSUnits(NSString* wkt){
    NSString* value ;
    BOOL _continue = YES;
    NSScanner* scanner = [NSScanner scannerWithString:wkt];
    //Scan for the UNIT information in WKT.
    //If WKT is for a Projected Coord System, expect two instances of UNIT, and use the second one
    while (_continue) {
        [scanner scanUpToString:@"UNIT[\"" intoString:NULL];
        [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"UNIT[\""]];
        _continue = [scanner scanUpToString:@"\"" intoString:&value];
    }
    if([@"Foot_US" isEqualToString:value] || [@"Foot" isEqualToString:value]){
        return AGSUnitsFeet;
    }else if([@"Meter" isEqualToString:value]){
        return AGSUnitsMeters;
    }else if([@"Degree" isEqualToString:value]){
        return AGSUnitsDecimalDegrees;
    }else{
        //TODO: Not handling other units like Yard, Chain, Grad, etc
        return -1;
    }
}



@end
