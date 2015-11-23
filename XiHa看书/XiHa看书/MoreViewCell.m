//
//  MoreViewCell.m
//  XiHa看书
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "MoreViewCell.h"

@implementation MoreViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.headImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, SCREEN_WIDTH/16*5, SCREEN_HEIGHT/5 -10)];
        _headImage.backgroundColor = [UIColor cyanColor];
        [self addSubview:_headImage];
        
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/16*6, SCREEN_HEIGHT/5/12, SCREEN_WIDTH/16*9, SCREEN_HEIGHT/5/12*3)];
        //_nameLabel.backgroundColor = [UIColor cyanColor];
        [self addSubview:_nameLabel];
        
        self.author_nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/16*6, SCREEN_HEIGHT/5/12*5, SCREEN_WIDTH/16*5, SCREEN_HEIGHT/5/12*2)];
        //_author_nameLabel.backgroundColor = [UIColor blackColor];
        [self addSubview:_author_nameLabel];
        
        self.idLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/16*6, SCREEN_HEIGHT/5/12*7, SCREEN_WIDTH/16*5, SCREEN_HEIGHT/5/12*2)];
        //_idLabel.backgroundColor = [UIColor blueColor];
        [self addSubview:_idLabel];

        
        self.priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/16*12, SCREEN_HEIGHT/5/12*9, SCREEN_WIDTH/16*4, SCREEN_HEIGHT/5/12*2)];
        //_priceLabel.backgroundColor = [UIColor brownColor];
        [self addSubview:_priceLabel];


        
        
        
    }
    return self;
}

-(void)setMoreModel:(ListModel *)MoreModel{
    [_headImage sd_setImageWithURL:[NSURL URLWithString:MoreModel.cover]];
    _nameLabel.text = MoreModel.name;
    _author_nameLabel.text = MoreModel.author_name;
    _idLabel.text = [NSString stringWithFormat:@"%d",MoreModel.ID];
    _priceLabel.text = MoreModel.price;
    
    
    
}








- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
