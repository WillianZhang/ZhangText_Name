//
//  JDDetailViewController.m
//  XiHa看书
//
//  Created by lanou3g on 15/11/21.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "JDDetailViewController.h"

@interface JDDetailViewController ()

@end

@implementation JDDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(10, SCREEN_HEIGHT/3, SCREEN_WIDTH/2, SCREEN_HEIGHT/10)];
    _label.backgroundColor = [UIColor yellowColor];
    _label.text = _obj.name;
    
    self.headImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, SCREEN_WIDTH-20, SCREEN_HEIGHT/3)];
    [_headImage sd_setImageWithURL:[NSURL URLWithString:_obj.cover]];
    
    [self.view addSubview:_label];
    [self.view addSubview:_headImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
