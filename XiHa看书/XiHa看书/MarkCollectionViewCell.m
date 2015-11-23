//
//  MarkCollectionViewCell.m
//  XiHa看书
//
//  Created by lanou3g on 15/11/19.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "MarkCollectionViewCell.h"

@implementation MarkCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BookShelfCell.png"]];
//        _imageView.frame = CGRectMake(0, 0, 320, 139);
//        
//        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 139)];
//        _label.backgroundColor = [UIColor clearColor];
//        [_label addSubview:_imageView];
//        [self addSubview:_label];
        self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 110, 140)];
        [self addSubview:_imageView];
     

    }
    return self;
}



@end
