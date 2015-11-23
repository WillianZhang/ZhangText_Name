//
//  xxxxxxxxViewController.m
//  XiHa看书
//
//  Created by lanou3g on 15/11/20.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

//#import "xxxxxxxxViewController.h"
//#define BASELIST_URL @"http://ios.mzread.com/api/v1/ebook_tags/new_book_list/jingdong"
//
//@interface xxxxxxxxViewController ()
//
//@property(nonatomic, retain)UIWebView *webView;
//
//@end
//
//@implementation xxxxxxxxViewController
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//    self.webView = [[UIWebView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    
//    [self.view addSubview:_webView];
//    [self jiexishiyan];
//    
//}
//
//-(void)jiexishiyan{
//    
//    //NSString *str = @"http://ios.mzread.com/api/v1/ebook_tags/new_book_list/jingdong";
//    NSString *str = @"http://c9.xiyouxi.com/default.html";
//       // AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    
//      //  [manager GET:str parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
////           NSArray * JDListArray = [NSMutableArray arrayWithCapacity:5];
////            NSDictionary *dic = responseObject;
////            NSArray *arr = dic[@"books"];
////            for (NSDictionary *diction in arr) {
////                JDListModel *model = [JDListModel new];
////                [model setValuesForKeysWithDictionary:diction];
////                [_JDListArray addObject:model];
////            }
////            NSURL * shaeURL = [NSURL URLWithString:responseObject[data[@"discount"[@"i"] ]];
////            NSLog(@"zzzzzz%@",shaeURL);
//            NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
//    [self.webView scalesPageToFit];
//            [self.webView loadRequest:request];
//            
//            // [self.webView loadRequest:request];
//            
////        } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
////            NSLog(@"xxx");
////            
////        }];
//    
// 
//
//    
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
///*
//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}
//*/
//
//@end
