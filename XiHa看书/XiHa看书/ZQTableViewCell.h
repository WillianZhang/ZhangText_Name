//
//  ZQTableViewCell.h
//  XiHa看书
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZQModel.h"

@interface ZQTableViewCell : UITableViewCell

@property (nonatomic, retain) UIImageView *headImage;

@property (nonatomic, retain) UILabel *nameLabel;

@property (nonatomic, retain) UILabel *total_countLabel;

@property (nonatomic, retain) ZQModel *modelVC;


@end
