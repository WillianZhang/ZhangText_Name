//
//  ListViewController.m
//  XiHa看书
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "ListViewController.h"
@class BSTableViewController;
#import "ListModel.h"
#import "MoreViewCell.h"
#import "DetailBookController.h"
@interface ListViewController ()

@property(nonatomic, retain) NSMutableArray *dataArray;

@end
static NSString *inder = @"MoreCell";
@implementation ListViewController

-(instancetype)initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:style];
    if (self) {
        [self.navigationController popViewControllerAnimated:YES];
        [self loadData];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"书籍列表";
    [self.tableView registerClass:[MoreViewCell class] forCellReuseIdentifier:inder];
   
}
- (void)loadData{
    //数据解析
    NSURL *url = [NSURL URLWithString:BASEon_URL];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    NSURLSession *session = [NSURLSession sharedSession];
    __weak typeof (self)temp = self;
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSMutableDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingAllowFragments) error:nil];
        NSMutableDictionary *dictionaryM = dictionary[@"book"];
        
        temp.dataArray = [NSMutableArray arrayWithCapacity:5];//推荐解析
//        NSMutableDictionary *dictionaryBooks = dictionaryL[@"recommend"];
//        NSArray *array = dictionaryBooks[@"books"];
//        for (NSDictionary *dic in array) {
            ListModel *model = [ListModel new];
            [model setValuesForKeysWithDictionary:dictionaryM];
            [_dataArray addObject:model];
       // }
        NSLog(@"👌👌👌👌👌%@",_dataArray);
        
        [temp.tableView reloadData];
        
    }];
    [task resume];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MoreViewCell *cell = [tableView dequeueReusableCellWithIdentifier:inder forIndexPath:indexPath];
    
   
    
    cell.MoreModel = _dataArray[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SCREEN_HEIGHT/5;
}

//点击cell触发事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailBookController *detailVC = [[DetailBookController alloc]init];
    [self.navigationController pushViewController:detailVC animated:YES];
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
