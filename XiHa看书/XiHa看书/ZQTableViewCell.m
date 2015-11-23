//
//  ZQTableViewCell.m
//  XiHa看书
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "ZQTableViewCell.h"

@implementation ZQTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        self.headImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/6*2, (SCREEN_HEIGHT-113)/4)];
       // _headImage.backgroundColor = [UIColor cyanColor];
        [self addSubview:_headImage];
        
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/3,(SCREEN_HEIGHT-113)/4/5, SCREEN_WIDTH/4*2, (SCREEN_HEIGHT-113)/4/4)];
        //_nameLabel.backgroundColor = [UIColor cyanColor];
        [self addSubview:_nameLabel];
        
        self.total_countLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/3,(SCREEN_HEIGHT-113)/4/5*3, SCREEN_WIDTH/4*2,(SCREEN_HEIGHT-113)/4/5)];
        //_total_countLabel.backgroundColor = [UIColor cyanColor];
        [self addSubview:_total_countLabel];
        
    }
    return self;
}


-(void)setModelVC:(ZQModel *)modelVC{
    [_headImage sd_setImageWithURL:[NSURL URLWithString:modelVC.image]];
    
    _nameLabel.text = modelVC.name;
    
    NSLog(@"xxxxxxxx%@",_nameLabel.text);
    
    _total_countLabel.text = [NSString stringWithFormat:@"共%d本",modelVC.total_count];
    _total_countLabel.font = [UIFont systemFontOfSize:15];
    
    
    
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
