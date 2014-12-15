//
//  MainViewController.m
//  Meow
//
//  Created by b on 3/11/14.
//  Copyright (c) 2014 b. All rights reserved.
//

#import "MainViewController.h"
#import "MainTableViewCell.h"
#import "ContentViewController.h"
#import "JSONConvert.h"
#import "AFNetworking.h"



@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setStyle];
    
    //webservice
    webservice = [[WebserviceClass alloc] init];
    webservice.delegate = self;
    [webservice reset];
    NSString *getStr = [JSONConvert _GetInComeData];    //post 的資料內容
    tableData=[[NSMutableArray alloc] init];
    [webservice requestWebserviceGET:[JSONConvert WSURL_GetInComeData] theData:getStr];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tableData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    MainTableViewCell *cell = (MainTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil)
    {
        cell = [[MainTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.lblName.text=[[tableData objectAtIndex:indexPath.row ] objectForKey:@"Name"];
    cell.lblLocation.text=[NSString stringWithFormat:@"%@" ,[[tableData objectAtIndex:indexPath.row ] objectForKey:@"Area"]];
    cell.lblSex.text=[[tableData objectAtIndex:indexPath.row ] objectForKey:@"Gender"];
    cell.lblAge.text=[[tableData objectAtIndex:indexPath.row] objectForKey:@"Age"];
    
    
    
    NSString *picPath=[NSString stringWithFormat:@"%@%@",@"http://yali.somee.com/pic/" ,[[tableData objectAtIndex:indexPath.row] objectForKey:@"PicPath"]];
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:picPath]];
    //預設圖片
    UIImage* placeholder = [UIImage imageNamed:@"z03.png"];
    
    UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyleWhite)];
    [activity startAnimating];
    [activity setFrame:CGRectMake(100 , 6 , 120, 120)];
    [cell.contentView addSubview:activity];
    
    [cell.imgPic setImageWithURLRequest:request placeholderImage:placeholder
                                 success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                     cell.imgPic.image = image;
                                     [activity removeFromSuperview];
                                     NSLog(@"Loaded successfully: %ld", (long)[response statusCode]);
                                 } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                     [activity removeFromSuperview];
                                     NSLog(@"failed loading: %@", error);
                                 }];

    
    return cell;
}

#pragma mark - setStyle

- (void)setStyle
{
    self.view.backgroundColor = [UIColor colorWithRed:0.246 green:0.657 blue:0.646 alpha:1.000];
    self.tblMain.backgroundColor = [UIColor colorWithRed:0.246 green:0.657 blue:0.646 alpha:1.000];
    
    [self.btnFilter setImage:[UIImage imageNamed:@"iconFilter"] forState:UIControlStateNormal];
    self.btnFilter.titleLabel.text = nil;
    
    self.viewWrapSegm.backgroundColor = [UIColor colorWithRed:0.975 green:0.971 blue:0.946 alpha:1.000];
    
}


#pragma mark － WebserviceClass Delegate

// Webservice
- (void)statusDelegate
{
    switch (webservice.status) {
        case STATUS_FINISHLOADING:
        {
            if (webservice.resultData.count == 0) {
                NSLog(@"無資料！");
                return;
            }
            // 取得載入時的資料
            [self getGetInComeData_parser:webservice.resultData];
            
            break;
        }
        case STATUS_ERROR:
        {
            //錯誤
            NSLog(@"error -- STATUS_ERROR ");
            break;
        }
        case STATUS_UNKNOWN:
        {
            //未知錯誤
            NSLog(@"unknow -- STATUS_UNKNOWN");
            break;
        }
        default:
        {
            break;
        }
    }
}

#pragma mark－parser
//getGetInComeData 解析
- (void)getGetInComeData_parser:(NSMutableArray *)resultDataAry
{
    NSString *result;
    for (int i=0; i<[[resultDataAry objectAtIndex:2] count]; i++) {
        
        NSDictionary *dicResult = [[resultDataAry objectAtIndex:2] objectAtIndex:i];
        [tableData addObject:dicResult];
    }
    NSLog(@"tableData count=%lu",(unsigned long)[tableData count]);
    [[self tblMain] reloadData];
}


@end
