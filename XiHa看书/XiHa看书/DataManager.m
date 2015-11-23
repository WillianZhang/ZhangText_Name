//
//  DataManager.m
//  XiHa看书
//
//  Created by lanou3g on 15/11/20.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "DataManager.h"
#import "BSTableViewController.h"
#import "BSCollectionViewCell.h"
#import "ZQTableViewCell.h"
#import "recommendModel.h"
#import "ZQModel.h"
#import "ScrollModel.h"
#import "ListViewController.h"
#import "JDListModel.h"
#define BASELIST_URL @"http://ios.mzread.com/api/v1/ebook_tags/new_book_list/jingdong"
@interface DataManager ()

@property(nonatomic, retain)ZQModel *JDmodel;

@end


@implementation DataManager

static DataManager *manager = nil;

+(instancetype)sharedManager{
    if (manager == nil) {
        manager = [DataManager new];
        
        [manager requestData];
        [manager requestData1];
    }
    return manager;
}

-(void)requestData{
   dispatch_async(dispatch_get_global_queue(0, 0), ^{
       
   

    NSURL *url = [NSURL URLWithString:BASE_URL];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    NSURLSession *session = [NSURLSession sharedSession];
    __weak typeof (self)temp = self;
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSMutableDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
        NSMutableDictionary *dictionaryL = dictionary[@"data"];
        
        temp.JDArray = [NSMutableArray arrayWithCapacity:5];//京东解析
        NSMutableDictionary *dictionaryJD = dictionaryL[@"jingdong"];
        self.JDmodel = [ZQModel new];
        [_JDmodel setValuesForKeysWithDictionary:dictionaryJD];
        [_JDArray addObject:_JDmodel];
        

        
        
        temp.ZXArray = [NSMutableArray arrayWithCapacity:5];//中信云解析
        NSMutableDictionary *dictionaryZX = dictionaryL[@"zhongxin"];
        ZQModel *ZXmodel = [ZQModel new];
        [ZXmodel setValuesForKeysWithDictionary:dictionaryZX];
        [_ZXArray addObject:ZXmodel];
        
        
        temp.lightsArray = [NSMutableArray arrayWithCapacity:2];//轻阅读解析
        NSMutableDictionary *dictionaryLig = dictionaryL[@"lights"];
        NSArray *array0 = dictionaryLig[@"banners"];
        for (NSDictionary *dic in array0) {
            ScrollModel *model1 = [ScrollModel new];
            [model1 setValuesForKeysWithDictionary:dic];
            [_lightsArray addObject:model1];
            // NSLog(@"❤️%@",_lightsArray);
            //  [headImage sd_setImageWithURL:[NSURL URLWithString:_lightsArray[index]]];
            
        }
        
        
        
        temp.dataArray = [NSMutableArray arrayWithCapacity:5];//推荐解析
        NSMutableDictionary *dictionaryBooks = dictionaryL[@"recommend"];
        NSArray *array = dictionaryBooks[@"books"];
        for (NSDictionary *dic in array) {
            recommendModel *model = [recommendModel new];
            [model setValuesForKeysWithDictionary:dic];
            [_dataArray addObject:model];
        }
    
        
      // 返回主线程更新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!self.myUpdataUI) {
                NSLog(@"black 没有代码");
            }else{
                self.myUpdataUI();
            }
        });
    }];
    
    
    [task resume];
   
   });
}

-(void)requestData1{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
     NSLog(@"111111111");
    
    NSString *str = BASELIST_URL;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:str parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        self.JDListArray = [NSMutableArray arrayWithCapacity:5];
        NSDictionary *dic = responseObject;
        NSArray *arr = dic[@"books"];
        for (NSDictionary *diction in arr) {
            JDListModel *model = [JDListModel new];
            [model setValuesForKeysWithDictionary:diction];
            [_JDListArray addObject:model];
            
        }
        NSLog(@"wwwwwwww%@",_JDListArray);
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"xxx");
        
    }];
       
});
        
        
        
    
}
//
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        
//       // NSURL *url = [NSURL URLWithString:BASELIST_URL];
//        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//        [manager GET:BASELIST_URL parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
//            self.JDListArray = [NSMutableArray arrayWithCapacity:5];//京东里面拼接接口书籍列表的解析
//            NSDictionary *dictionary1 = responseObject;
//                    NSArray *arrayJD = dictionary1[@"books"];
//                    for (NSDictionary *dict in arrayJD) {
//                        JDListModel *model = [JDListModel new];
//                        [model setValuesForKeysWithDictionary:dict];
//                        [_JDListArray addObject:model];
//
//            
//            
//        } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
//            NSLog(@"aa");
//        };
//        
//        
//        
//        
//        
//        
////    });
////    dispatch_async(dispatch_get_global_queue(0, 0), ^{
////    //继续解析京东里面拼接接口后的内容
////      
//////        NSString *string = @"http://ios.mzread.com";
//////    
//////        
//////    NSString *string1 = [string stringByAppendingString:self.JDmodel.url];
//////        NSLog(@"%@",self.JDmodel.url);
////    NSURL *url = [NSURL URLWithString:BASELIST_URL];
////        NSLog(@"%@",url);
////    NSMutableURLRequest *request1 = [NSMutableURLRequest requestWithURL:url];
////  
////    NSURLSession *session1 = [NSURLSession sharedSession];
////    __weak typeof (self)temp = self;
////    NSURLSessionDataTask *task1 = [session1 dataTaskWithRequest:request1 completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
////        NSMutableDictionary *dictionary1 = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
////        temp.JDListArray = [NSMutableArray arrayWithCapacity:5];//京东里面拼接接口书籍列表的解析
////        NSArray *arrayJD = dictionary1[@"books"];
////        for (NSDictionary *dict in arrayJD) {
////            JDListModel *model = [JDListModel new];
////            [model setValuesForKeysWithDictionary:dict];
////            [_JDListArray addObject:model];
////        }
////        //返回主线程更新UI
////        dispatch_async(dispatch_get_main_queue(), ^{
////            if (!self.myUpdataUI) {
////                NSLog(@"black 没有代码");
//            }else{
//                self.myUpdataUI();
//            }
//        });
//        
//    }];
//    [task1 resume];
//        
//        });

//}







@end
