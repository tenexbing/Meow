//
//  JSONConvert.m
//  ETWebservice
//
//  Created by ETEC on 12/10/1.
//  Copyright (c) 2012年 ETEC. All rights reserved.
//

#import "JSONConvert.h"

@implementation JSONConvert

/*#################################################//
 MARK:取得載入時的資料
 //#################################################*/
/**
 * 取得載入時的資料's Webservice
 * @return POST Data String
 */
+ (NSString *)WSURL_GetInComeData
{
    NSString *webserviceURL = [NSString stringWithFormat:
                               @"http://yali.somee.com/api/Meow/10"];
    return webserviceURL;
}

/**
 * 取得載入時的資料
 */
+ (NSString *)_GetInComeData
{
    
    NSString *getDataStr = [NSString stringWithFormat:
                            @""];
    
    NSLog(@"\n------ GetInComeData getDataStr ------\n %@",getDataStr);
    
    return getDataStr;
    
}


/*#################################################//
 MARK:取得載入時的資料
 //#################################################*/
/**
 * 取得大科別's Webservice
 * @return POST Data String
 */
+ (NSString *)WSURL_GetMoreListData
{
    NSString *webserviceURL = [NSString stringWithFormat:
                               @"http://www.yaliwang.url.tw/api/Meow/5"];
    return webserviceURL;
}

/**
 * 取得載入時的資料
 */
+ (NSString *)_GetMoreListData
{
    
    NSString *getDataStr = [NSString stringWithFormat:
                            @""];
    
    NSLog(@"\n------ GetSchedulePeriod getDataStr ------\n %@",getDataStr);
    
    return getDataStr;
    
}



/*#################################################//
 --------------------------------------------------
 MARK:   解析回傳字串
 --------------------------------------------------
 //#################################################*/
/**
 * 解析回傳字串
 * @param jsonString JSON 格式的字串
 * @return 解析後的結果
 */
+ (NSMutableArray *)parserJsonString:(NSMutableData *)jsonString
{
     NSError *error;
 
    NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:jsonString options:NSJSONReadingMutableLeaves error:&error];

    
    NSMutableArray *resultArray = [[NSMutableArray alloc]init];

    
    NSLog(@"%@",[resultDic objectForKey:@"isSuccess"]);
    
    // 是否成功
    NSString *isSuccess = [resultDic objectForKey:@"isSuccess"];
    [resultArray addObject:isSuccess ];
    
    // 訊息
    NSString *message =[resultDic objectForKey:@"message"];
    [resultArray addObject:message];
    
    // 回傳結果(科別)
    NSArray *resultList = [resultDic objectForKey:@"resultList"];
    [resultArray addObject:resultList];
    
    return resultArray;
}



@end
