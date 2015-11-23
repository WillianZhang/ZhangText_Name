//
//  BSTableViewController.m
//  XiHa看书
//
//  Created by lanou3g on 15/11/16.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "BSTableViewController.h"
#import "BSCollectionViewCell.h"
#import "ZQTableViewCell.h"
#import "recommendModel.h"
#import "ZQModel.h"
#import "ScrollModel.h"
#import "ListViewController.h"
#import "JDTableViewController.h"
#import "xxxxxxxxViewController.h"
#import "MJRefresh.h"
#import "DataManager.h"



@interface BSTableViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic ,retain)UIScrollView *scroll;
@property(nonatomic, retain)UIPageControl *paged;

@property(nonatomic, retain) NSTimer *timer;//计时器

@property(nonatomic, retain)UICollectionView *collectionView;

//因为cell上需要添加不同空间，自定义，所以定义全局cell
@property(nonatomic, retain)UITableViewCell *cell;

@end

static NSString *inder = @"cell";
static NSString *inderfiner = @"CollectionCell";
@implementation BSTableViewController
int l = 0;

-(instancetype)initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:style];
    if (self) {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"更多" style:UIBarButtonItemStylePlain target:self action:@selector(MoreBook:)];
        
        self.navigationItem.title = @"平价书城";
        self.tabBarItem.title = @"书城";
        self.tabBarItem.image = [UIImage imageNamed:@"h1"];
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(Click:) userInfo:nil repeats:YES];
        [DataManager sharedManager].myUpdataUI = ^(){
            //开始刷新
            [self.tableView.mj_header beginRefreshing];
            //数据刷新
            [self.tableView reloadData];
            //结束刷新
            [self.tableView.mj_header endRefreshing];
            
        };
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
   
   
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    //在单例中取出青阅读盛放model的数组，用_lightsArray承接
    NSArray *_lightsArray = [DataManager sharedManager].lightsArray;
    
    //轮播器
    self.scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, (SCREEN_HEIGHT-113)/3)];
  
    _scroll.contentSize = CGSizeMake(SCREEN_WIDTH * _lightsArray.count, (SCREEN_HEIGHT-113)/3);
    _scroll.pagingEnabled = YES;
    _scroll.bounces = YES;
    //tabView.tableHeaderView = _scroll;
    [self.view addSubview:_scroll];
#pragma 数据解析放到viewDidLoad里面方法不走、放到初始化才走
    for (int i = 0; i < _lightsArray.count; i++) {
        
        ScrollModel *model = _lightsArray[i];
        UIImageView *imgview = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*i, 0,SCREEN_WIDTH, (SCREEN_HEIGHT-113)/3)];
        [imgview sd_setImageWithURL:[NSURL URLWithString:model.image]];
        [_scroll addSubview:imgview];
    }
    [self.view addSubview:_scroll];
    self.paged = [[UIPageControl alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/3, (SCREEN_HEIGHT-113)/3-10, SCREEN_WIDTH/3, 8)];
    _paged.numberOfPages = 5;
    _paged.currentPage = 0;
    //paged.pageIndicatorTintColor = [UIColor redColor];
    _paged.currentPageIndicatorTintColor = [UIColor blackColor];
    [self.view addSubview:_paged];


    
    
    //Collection集合视图
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    
    layout.itemSize = CGSizeMake(110, 175);
    
    layout.sectionInset = UIEdgeInsetsMake(5, 10, 5, 10);
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, (SCREEN_HEIGHT-113)/3+30, SCREEN_WIDTH, (SCREEN_HEIGHT-113)/3) collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor lightGrayColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    

 
    
    
    //cell注册
    [self.tableView registerClass:[ZQTableViewCell class] forCellReuseIdentifier:inder];
    
    
    [self.collectionView registerClass:[BSCollectionViewCell class] forCellWithReuseIdentifier:inderfiner];
 
    [self.view addSubview:self.collectionView];
    
    
    
    //下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [[DataManager sharedManager] requestData];
        [[DataManager sharedManager] requestData1];
        
    }];
    //上拉加载
    self.tableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
        
    }];
    
}




-(void)MoreBook:(UIBarButtonItem *)sender{
   // NSLog(@"ZOULE AHAHAHHAHAHHAHA");
    ListViewController *listVC = [[ListViewController alloc]init];
    [self.navigationController pushViewController:listVC animated:YES];
}

//定时器 、同时触发UIPageControl
-(void)Click:(NSTimer *)sender{
    self.scroll.contentOffset = CGPointMake(l%5*SCREEN_WIDTH, 0);
    l++;
  
    NSInteger currentPage = _scroll.contentOffset.x/SCREEN_WIDTH;
    self.paged.currentPage = currentPage;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    if (section == 2) {
        return 2;
    }else{
    return 1;
    }
}


//Collection的cell设置
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZQTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:inder forIndexPath:indexPath];
    //在单例中取出青阅读盛放model的数组，用_lightsArray承接
   
    if (indexPath.section == 2 && indexPath.row == 0) {
        cell.modelVC = [DataManager sharedManager].JDArray[indexPath.row];
    } else if (indexPath.section == 2 && indexPath.row ==1){
        //京东和中信都只有一组数据，所以row都等于0；所以下面第二行row等于1判定行数的时候下面的row-1
        cell.modelVC = [DataManager sharedManager].ZXArray[indexPath.row - 1];
    }
    
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
    
    
}



//Collection的cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    BSCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:inderfiner forIndexPath:indexPath];
    cell.recommendTV = [DataManager sharedManager].dataArray[indexPath.row];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;


}

//设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {
        return (SCREEN_HEIGHT-113)/4;
    }else{
    
    return (SCREEN_HEIGHT-113)/3;
    }
}


//分区头的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else{
    return 30;
    }
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return @"编辑推荐";
    }else if (section == 2){
        return @"专区";
    }else if (section == 3){
        return @"优惠合集";
    }

    
    else{
    return @"哈哈哈";
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2 && indexPath.row == 0) {
        JDTableViewController *jdVC = [[JDTableViewController alloc]init];
//        xxxxxxxxViewController *cc = [[xxxxxxxxViewController alloc]init];
        [self.navigationController pushViewController:jdVC animated:YES];
    }
}


////分区脚的高度
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 25;
//}


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
