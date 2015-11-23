//
//  ListModel.h
//  XiHa看书
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListModel : NSObject

@property (nonatomic, retain) NSString *cover;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *author_name;
@property (nonatomic, assign) int ID;
@property (nonatomic, retain) NSString *author_summary;
@property (nonatomic, retain) NSString *price;
@property (nonatomic, retain) NSString *publish_time;
@property (nonatomic, retain) NSString *publisher_name;
@property (nonatomic, retain) NSString *summary;
@property (nonatomic, retain) NSString *created_at;
@property (nonatomic, retain) NSString *created_at_timestamp;





@end
