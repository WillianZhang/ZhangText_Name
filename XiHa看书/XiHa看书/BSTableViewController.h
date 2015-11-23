//
//  BSTableViewController.h
//  XiHa看书
//
//  Created by lanou3g on 15/11/16.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDListModel.h"
#import "ZQModel.h"

@interface BSTableViewController : UITableViewController
@property (nonatomic,retain) JDListModel *JDmodel;
@property (nonatomic, retain) ZQModel *zqmodel;

@end
