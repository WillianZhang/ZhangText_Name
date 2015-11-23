//
//  DetailBookController.m
//  XiHa看书
//
//  Created by lanou3g on 15/11/19.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "DetailBookController.h"

@interface DetailBookController ()



@end

@implementation DetailBookController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"书籍详情";
    self.view.backgroundColor = [UIColor purpleColor];
    self.head4Image = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/12, SCREEN_HEIGHT/16, SCREEN_WIDTH/12*4, SCREEN_HEIGHT/16*4)];
    _head4Image.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_head4Image];
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
