//
//  JDDetailViewController.h
//  XiHa看书
//
//  Created by lanou3g on 15/11/21.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListModel.h"


@interface JDDetailViewController : UIViewController

@property (nonatomic, retain) UIImageView *headImage;
@property (nonatomic, retain) UILabel *label;


@property (nonatomic, retain) ListModel *obj;

@end
