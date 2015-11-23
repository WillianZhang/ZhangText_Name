//
//  JDListModel.h
//  XiHa看书
//
//  Created by lanou3g on 15/11/20.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDListModel : NSObject

@property (nonatomic, retain) NSString *author_name;
@property (nonatomic, retain) NSString *cover;
@property (nonatomic, assign) int ID;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *origin_price;
@property (nonatomic, retain) NSString *price;
@property (nonatomic, retain) NSString *translator_name;
@property (nonatomic, retain) NSString *web_price;



@end
