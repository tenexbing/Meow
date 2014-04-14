//
//  JSONConvert.h
//  ETWebservice
//
//  Created by ETEC on 12/10/1.
//  Copyright (c) 2012年 ETEC. All rights reserved.
//

#import <Foundation/Foundation.h>



//================================================
//   Webservice Service Name                    ||
//================================================

/// Json解析與Webservice定義
@interface JSONConvert : NSObject

/*#################################################//
 MARK:取得載入時的資料
 //#################################################*/
/**
 * 取得載入時的資料's Webservice
 * @return POST Data String
 */
+ (NSString *)WSURL_GetInComeData;
+ (NSString *)_GetInComeData;


/*#################################################//
 MARK:取得更多資料
 //#################################################*/
/**
 * 取得更多資料's Webservice
 * @return POST Data String
 */
+ (NSString *)WSURL_GetMoreListData;
+ (NSString *)_GetMoreListData;




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
+ (NSMutableArray *)parserJsonString:(NSString *)jsonString;

@end
