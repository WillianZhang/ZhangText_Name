//
//  DataManager.h
//  XiHa看书
//
//  Created by lanou3g on 15/11/20.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^UpdataUI)();

@interface DataManager : NSObject
//承接推荐书籍书的解析对象
@property(nonatomic, retain) NSMutableArray *dataArray;
@property(nonatomic, retain) NSMutableArray *JDArray;
@property(nonatomic, retain) NSMutableArray *JDListArray;

@property(nonatomic, retain) NSMutableArray *ZXArray;

@property(nonatomic, retain) NSMutableArray *lightsArray;


//block的构建
@property (nonatomic, copy) UpdataUI myUpdataUI;


+(instancetype)sharedManager;

-(void)requestData;

-(void)requestData1;
@end
