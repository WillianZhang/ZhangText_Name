//
//  BSCollectionViewCell.m
//  XiHa看书
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "BSCollectionViewCell.h"

@implementation BSCollectionViewCell



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //NSLog(@"走了吗？？？？？？？？？？");
        
        self.recommendImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 110, 140)];
        [self addSubview:_recommendImage];
        
        self.recommendLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 140, 110, 20)];
        //_recommendLabel.backgroundColor = [UIColor orangeColor];
        [self addSubview:_recommendLabel];
        
        self.priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(75, 160, 110, 15)];
       // _priceLabel.backgroundColor = [UIColor blueColor];
        [self addSubview:_priceLabel];
     
        
    }
    return self;
}


-(void)setRecommendTV:(recommendModel *)recommendTV{
   // _recommendImage.image = [UIImage imageNamed:recommendTV.coverImage];
    //网络解析图片  使用 SDWebImage 中的 "UIImageView+WebCache.h"  不可直接传
    [_recommendImage sd_setImageWithURL:[NSURL URLWithString:recommendTV.cover]];
    
    _recommendLabel.text = recommendTV.name;
    _recommendLabel.font = [UIFont systemFontOfSize:15];
    
    _priceLabel.text = recommendTV.price;
    _priceLabel.font = [UIFont systemFontOfSize:10];
    
}






- (void)awakeFromNib {
    // Initialization code
}

@end
