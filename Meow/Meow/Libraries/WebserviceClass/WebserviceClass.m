//
//  WebserviceClass.m
//  ETWebservice
//
//  Created by ETEC on 12/10/1.
//  Copyright (c) 2012年 ETEC. All rights reserved.
//

#import "WebserviceClass.h"
#import "JSONConvert.h"



@implementation WebserviceClass

@synthesize urlRequest;
@synthesize status;
@synthesize resultData;
@synthesize errorMsg;

#pragma mark -
#pragma mark * [Init & Reset]

/// 初始化
- (id)init
{
	if((self = [super init])) {
        tempData = [NSMutableData alloc];
        status = STATUS_READY2START;
        httpStatusCode = 0;
        resultData = [[NSMutableArray alloc] init];
        
        timer = [NSTimer timerWithTimeInterval:TIME_INTERVAL
                                        target:self
                                      selector:@selector(timerDo:)
                                      userInfo:nil
                                       repeats:YES];
        
        timerTime = 0;
        errorMsg = @"";
	}
	
	return self;
}

/// 重新初始化
- (void)reset
{
    tempData = [NSMutableData alloc];
    [urlConnection cancel];
    status = STATUS_READY2START;
    httpStatusCode = 0;
    [resultData removeAllObjects];
    [self stopTimer:timer];
    
    timer = [NSTimer timerWithTimeInterval:TIME_INTERVAL
                                    target:self
                                  selector:@selector(timerDo:)
                                  userInfo:nil
                                   repeats:YES];
    
    timerTime = 0;
    errorMsg = @"";
}

#pragma mark -
#pragma mark * [Request Settings]


/**
 * Set Request Connection
 * @param Connection Connection String
 */
- (void)setRequestConnection:(NSString *)theConnection
{
    [urlRequest addValue:theConnection forHTTPHeaderField:@"Connection"];
}







#pragma mark -
#pragma mark * [Request Webservice]


/**
 * Request Webservice (GET)
 * @param webserviceURLString Request URL
 * @param serviceName Service Name
 * @param theData the GET DATA String
 */
- (void)requestWebserviceGET:(NSString *)webserviceURLString
                     theData:(NSString *)theData
{
    assert(webserviceURLString!=nil);
    assert(theData!=nil);
    
    // 先清空
    [resultData removeAllObjects];
    
    status = STATUS_REQUEST;
    
    NSString *theGetURL = webserviceURLString;
    //theGetURL = [NSString stringWithFormat:@"%@?%@",webserviceURLString,theData];
    
    NSLog(@"\n------ requestWebserviceGET ------\n theGetURL = %@ ",theGetURL);
    
    //NSLog(@"\n------ requestWebserviceGET ------\n theGetURL = %@ ",[theGetURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]);
    NSURL *URL = [NSURL URLWithString: [theGetURL stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    urlRequest = [NSMutableURLRequest requestWithURL:URL
                                      cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                  timeoutInterval:15];
    
    //======================== Set GET Data =====================
    [urlRequest setHTTPMethod: @"GET"];
    
    tempData = [NSMutableData alloc];
    urlConnection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
    
    // 開始Timer,check何時 Timeout
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];

}

#pragma mark -
#pragma mark * [NSURLConnection Delegate]

/// 連線失敗,包含連線錯誤或取消連線
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    [urlConnection cancel];
    
    errorMsg = [NSString stringWithFormat:@"%@",error];
    NSLog(@"\n------ didFailWithError 發生錯誤 ------\n %@",error);
    
    //[ETGlobals alertMsgByContent:[NSString stringWithFormat:@"%@",error]];
    
    if (status != STATUS_ERROR) {
        status = STATUS_ERROR;  //處理完後再改變狀態
        
            [NSThread detachNewThreadSelector:@selector(delegateMethod) toTarget:self withObject:self];
    }
    
}

/// 連線成功,並接收Response取得狀態
- (void)connection: (NSURLConnection *)connection didReceiveResponse: (NSURLResponse *)aResponse
{
    /*
     2xx	順利完成
     200	OK；要求已完成。
     201	OK，請遵循 POST 指令執行。
     202	OK，接受處理程序，但是處理程序尚未完成。
     203	OK，部份資訊 -- 僅傳回部份資訊。
     204	OK，無回應 -- 已收到要求，但沒有要傳回的資訊。
     3xx	重新導向
     301	已移動 -- 所要求的資料已有了新的位置且該變更為永久性。
     302	已找到 -- 所要求的資料暫時有了不同的 URI。
     303	請參閱其他資訊 -- 對該要求的回應可以在另一個 URI 下找到並需要用 GET 方法擷取。
     304	未修改 -- 文件未如預期作修改。
     305	使用 Proxy -- 所要求的資源必須透過位置欄位中所提供的 Proxy 來存取。
     306	未使用 -- 不再使用的；這個代碼留到將來使用。
     4xx	錯誤似乎出在用戶端。
     400	不正確的要求 -- 要求中的語法有問題或者是要求無法滿足。
     401	未經授權的 -- 用戶端未經授權存取資料。
     402	要求付款 -- 表示一個收費計劃已生效。
     403	被禁止的 -- 即使有授權也沒要求存取。
     404	找不到 -- 伺服器找不到指定的資源；文件不存在。
     407	Proxy 驗證要求 -- 用戶端必須先用 Proxy 來驗證它本身。
     415	未支援的媒體類型 -- 伺服器拒絕服務要求因為要求實體的格式未受支援。
     5xx	錯誤似乎出在伺服器。
     500	內部錯誤 -- 因為一個非預期的狀況，伺服器無法達到要求。
     501	尚未實作 -- 伺服器不支援所要求的機能。
     502	不正確的閘道 -- 伺服器從一個上游伺服器接收到無效的回應。
     503	服務無法使用 -- 由於暫時的超載或維護，伺服器無法處理要求。
     */
    // 取得狀態
    httpStatusCode = (NSInteger)[(NSHTTPURLResponse *)aResponse statusCode];
    NSLog(@"\n------ didReceiveResponse Status ------\n %d",httpStatusCode);
        
    status = STATUS_RECEIVERESPONSE;    // 處理完後再改變狀態
    
[NSThread detachNewThreadSelector:@selector(delegateMethod) toTarget:self withObject:self];
}

/// 接收Data
-(void)connection:(NSURLConnection *)connection didReceiveData: (NSData *) incomingData
{
    // 收到封包，將收到的資料塞進緩衝中並修改進度條
    [tempData appendData:incomingData];
    NSLog(@"\n------ tempData.length ------\n %d",tempData.length);
    
    status = STATUS_RECEIVINGDATA;  // 處理完後再改變狀態
    
    [NSThread detachNewThreadSelector:@selector(delegateMethod) toTarget:self withObject:self];
}

/// 完成連線
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    // 完成接收,可開始解析
    NSLog(@"\n------ connectionDidFinishLoading ------");
    
    // 將Data轉換成utf-8編碼的文字
    NSString *responseStr = @"";
    responseStr = [[NSString alloc] initWithData:tempData encoding:NSUTF8StringEncoding];
    NSLog(@"responseStr=%@",responseStr);
    
    if (httpStatusCode == 200) {
      
            resultData = [JSONConvert parserJsonString:tempData];
        
        
        
        status = STATUS_FINISHLOADING;  // 處理完後再改變狀態
        NSLog(@"STATUS_FINISHLOADING");
        [self delegateMethod];
     //  [NSThread detachNewThreadSelector:@selector(delegateMethod) toTarget:self withObject:self];
        
    }else{
        if (status != STATUS_ERROR) {
            errorMsg = [[NSString alloc] initWithData:tempData encoding:NSUTF8StringEncoding];
            status = STATUS_ERROR;
            NSLog(@"STATUS_ERROR");

            [NSThread detachNewThreadSelector:@selector(delegateMethod) toTarget:self withObject:self];
        }
    }
    

}

#pragma mark -
#pragma mark * Timer

/**
 * Timer Check if Timeout
 * @param theTimer NSTimer
 */
- (void)timerDo:(NSTimer *)theTimer
{
    
    NSLog(@"\n------ In Timer ------\n");
    
    //Timer的時間
    timerTime += TIME_INTERVAL;
    //Timeout
    if (timerTime >= TIMEOUT) {
        //取消連線
        [self connection:urlConnection didFailWithError:[NSError errorWithDomain:@"Time Out" code:2 userInfo:nil]];
    }
    
    /*
     TATUS_READY2START = 0,         //已準備好開始新的連線
     STATUS_REQUEST = 1,             //設定Request資料
     STATUS_RECEIVERESPONSE = 2,     //連線成功,並接收Response取得狀態
     STATUS_RECEIVINGDATA = 3,       //接收資料中
     STATUS_FINISHLOADING = 4,       //完成接收資料
     STATUS_ERROR = 5,               //錯誤中斷
     */
    //追蹤狀態
    if (status == STATUS_ERROR) {
        
        //結束Timer
        [self stopTimer:theTimer];
    }else if (status == STATUS_UNKNOWN) {
        
        //結束Timer
        [self stopTimer:theTimer];
    }else if (status == STATUS_FINISHLOADING) {
        
        //結束Timer
        [self stopTimer:theTimer];
    }
    
    
}

/**
 * Stop Timer
 * @param theTimer NSTimer
 */
- (void)stopTimer:(NSTimer *)theTimer
{
    [theTimer invalidate];  //取消timer
    timerTime = 0;
    NSLog(@"\n------ Stop Timer ------\n");
}

#pragma mark -
#pragma mark * WebserviceClass Delegate
/*
/// 狀態變更通知
- (void)statusDelegate
{
    NSLog(@"\n------ 可被重寫 statusDelegate ------");
}
*/
-(void)delegateMethod
{
    [_delegate statusDelegate];
}
@end
