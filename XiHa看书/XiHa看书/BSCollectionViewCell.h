//
//  BSCollectionViewCell.h
//  XiHa看书
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "recommendModel.h"

@interface BSCollectionViewCell : UICollectionViewCell


@property (nonatomic, retain) UIImageView *recommendImage;

@property (nonatomic, retain) UILabel *recommendLabel;

@property (nonatomic, retain) UILabel *priceLabel;


@property (nonatomic, retain) recommendModel *recommendTV;




@end
