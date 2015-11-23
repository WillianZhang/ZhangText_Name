//
//  MyTableViewController.m
//  XiHa看书
//
//  Created by lanou3g on 15/11/16.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "MyTableViewController.h"
#import "MyTableViewCell.h"
#import "LandViewController.h"


@interface MyTableViewController ()

@end
static NSString *Landfer = @"landCell";
static NSString *infer = @"cell";

@implementation MyTableViewController

-(instancetype)initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:style];
    if (self) {
        self.navigationItem.title = @"我的";
        self.tabBarItem.title = @"我的";
        self.tabBarItem.image = [UIImage imageNamed:@"p1"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:infer];
    [self.tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:Landfer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:infer forIndexPath:indexPath];
    if (indexPath.row == 0) {
        MyTableViewCell *Landcell = [tableView dequeueReusableCellWithIdentifier:Landfer forIndexPath:indexPath];
        Landcell.backgroundColor = [UIColor cyanColor];
        UIButton *Landbtn = [UIButton buttonWithType:UIButtonTypeSystem];
        Landbtn.frame = CGRectMake(SCREEN_WIDTH/3, SCREEN_HEIGHT/3/4*3, SCREEN_WIDTH/3, SCREEN_HEIGHT/3/7);
        [Landbtn setTitle:@"点击登录" forState:UIControlStateNormal];
        Landbtn.backgroundColor = [UIColor purpleColor];
        Landbtn.layer.masksToBounds = YES;
        Landbtn.layer.cornerRadius = 10;
        [Landbtn addTarget:self action:@selector(toLandView:) forControlEvents:UIControlEventTouchUpInside];
        [Landcell addSubview:Landbtn];
    }
    
    return cell;
}

//跳转到登录页面
-(void)toLandView:(UIButton *)sender{
    LandViewController *landVC = [[LandViewController alloc]init];
    [self.navigationController pushViewController:landVC animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return SCREEN_HEIGHT/3;
    }else{
        return SCREEN_HEIGHT/15;
        
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
