# SouthgisMapService
Southgis Map Service .Such as POI search ,Bus Line Search ,Car Line Search.It is suppor Baidu map(百度地图),TianDitu map(天地图)  .

#Usage

  ## Baidu Map POI search ,Bus Line Search ,Car Line Search .
  
    #import "SouthgisBdMapService.h"
    
    //POI search
    
      -(void)poiSearch:(nonnull BdPOISearchKeyWord *)keyWordEntity success:(nullable SuccessBlock)success failed:(nullable FailedBlock)failed;
      
    //BUS Line Search
    
      -(void)busLineSearch:(nonnull BdBusLineSearchKeyword *)entity success:(nullable SuccessBlock)success failed:(nullable FailedBlock)failed
      
    // Car Line Search 
    
      -(void)carLineSearch:(nonnull BdCarLineSearchKeyword *)driverEntity success:(nonnull SuccessBlock)success andFail:(nonnull FailedBlock)fail;
      
    
  ## TianDitu Map POI search ,Bus Line Search ,car Line Search
    
    #import "SouthgisTdtMapService"
    
    //POI search 
    
     -(void)poiSearch:( TdtPOISearchKeyWord *)keyWordEntity success:(SuccessBlock)success failed:(FailedBlock)failed
    
    //Bus Line search
    
      -(void)busLineSearch:(BusLineSearch *)entity success:(SuccessBlock)success failed:(FailedBlock)failed
      
    //car Line Search
    
    -(void)carLineSearch :(CarLineSearch *)driverEntity success:(SuccessBlock)success andFail:(FailedBlock)fail
    
# Install

  pod 'SouthgisMapService'
