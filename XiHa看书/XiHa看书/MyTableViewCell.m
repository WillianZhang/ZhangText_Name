//
//  MyTableViewCell.m
//  XiHa看书
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.userImage = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/5/6, SCREEN_WIDTH/3, SCREEN_WIDTH/3)];
        
        _userImage.backgroundColor = [UIColor yellowColor];
        _userImage.layer.masksToBounds = YES;
        _userImage.layer.cornerRadius = SCREEN_WIDTH/3/2;
        
        [self addSubview:_userImage];
        
        
//        self.userLand = [UIButton buttonWithType:UIButtonTypeSystem];
//        _userLand.frame = CGRectMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/5/3*2, SCREEN_WIDTH/3, SCREEN_HEIGHT/5/6);
//        [_userLand setTitle:@"点击登录" forState:UIControlStateNormal];
//        _userLand.backgroundColor = [UIColor purpleColor];
//        [self addSubview:_userLand];
        
        
    }
    
    return self;
}





- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
