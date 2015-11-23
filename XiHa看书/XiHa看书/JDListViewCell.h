//
//  JDListViewCell.h
//  XiHa看书
//
//  Created by lanou3g on 15/11/20.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDListModel.h"

@interface JDListViewCell : UITableViewCell


@property (nonatomic, retain) UIImageView *headImage;

@property (nonatomic, retain) UILabel *nameLabel;

@property (nonatomic, retain) UILabel *author_nameLabel;

@property (nonatomic, retain) UILabel *idLabel;

@property (nonatomic, retain) UILabel *priceLabel;

@property (nonatomic, retain) JDListModel *modelVC;

@end
