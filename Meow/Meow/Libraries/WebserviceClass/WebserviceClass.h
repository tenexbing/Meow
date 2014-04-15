//
//  WebserviceClass.h
//  ETWebservice
//
//  Created by ETEC on 12/10/1.
//  Copyright (c) 2012年 ETEC. All rights reserved.
//
/*
 Mar 2013/03/21 
 */
/*
 Async(異步)
 GET / POST
 Header Settings
 GET DATA / POST DATA
 */

#import <Foundation/Foundation.h>

/// 協議部分 (委托方法)
@protocol WebserviceClassDelegate <NSObject>
@optional
/// 狀態變更通知
- (void)statusDelegate;
@end

// Timer 時間間隔 ,check timeout用
#define TIME_INTERVAL 1
// Timer Timeout
#define TIMEOUT 15



typedef enum
{
    STATUS_READY2START = 0,         //已準備好開始新的連線
    STATUS_REQUEST = 1,             //設定Request資料
    STATUS_RECEIVERESPONSE = 2,     //連線成功,並接收Response取得狀態
	STATUS_RECEIVINGDATA = 3,       //接收資料中
    STATUS_FINISHLOADING = 4,       //完成接收資料
    STATUS_ERROR = 5,               //錯誤中斷
	STATUS_UNKNOWN = 999            //未知狀態
    
    
}WebserviceStatus;

/// Webservice Class
@interface WebserviceClass : UIViewController
{
    NSURLConnection         *urlConnection;
    
    NSMutableURLRequest     *urlRequest;
    
    NSMutableData           *tempData;      //下載時暫存用的記憶體
    
    WebserviceStatus        status;
    
    NSInteger               httpStatusCode;
    
    NSMutableArray          *resultData;
        
    NSTimer                 *timer;         // 檢查進度&是否Timeout
    
    float                   timerTime;      // Timer已經Run多久
    
    NSString                *errorMsg;
}

/** @name 屬性 */

/// a single request object  
@property (nonatomic,strong) NSMutableURLRequest        *urlRequest;

/// 連線狀態
@property (nonatomic,assign) WebserviceStatus           status;

/// 解析後的資料
@property (nonatomic,strong) NSMutableArray             *resultData;



/// 錯誤訊息
@property (nonatomic,strong) NSString                   *errorMsg;

/**
 * The Webservice delegate object.
 *
 * @see WebserviceClassDelegate
 */
@property (nonatomic, unsafe_unretained) id<WebserviceClassDelegate> delegate;

/** @name 類別方法 */


/** @name 實體方法 */

/// 初始化
- (id)init;

/// 重新初始化
- (void)reset;

/**
 * Request Webservice (GET)
 * @param webserviceURLString Request URL
 * @param theData the GET DATA String
 */
- (void)requestWebserviceGET:(NSString *)webserviceURLString
                     theData:(NSString *)theData;

/// 狀態變更通知
//- (void)statusDelegate;

/// 委託事件
- (void)delegateMethod;

@end
