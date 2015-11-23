//
//  MarkViewController.m
//  XiHa看书
//
//  Created by lanou3g on 15/11/19.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "MarkViewController.h"
#import "MarkCollectionViewCell.h"
#import "CustomFlowLayout.h"

@interface MarkViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic, retain)UICollectionView *collectionView;
@property(nonatomic, retain) UIImageView *imageView;

@end

@implementation MarkViewController
static NSString *indfiner = @"Cell";

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.navigationItem.title = @"我的书架";

        self.tabBarItem.title = @"书架";
        self.tabBarItem.image = [UIImage imageNamed:@"b1"];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
     CustomFlowLayout *layout = [[CustomFlowLayout alloc]init];
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(1, 0, SCREEN_WIDTH, (SCREEN_HEIGHT-113)/3) collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    for (int i =0; i < 5; i++) {
        
            self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, (SCREEN_HEIGHT-113)/3*i, SCREEN_WIDTH, (SCREEN_HEIGHT-113)/3)];
        if (i == 0) {
             _imageView.image = [UIImage imageNamed:@"mark.png"];
            [self.view addSubview:_imageView];
        }else{
        
            _imageView.image = [UIImage imageNamed:@"BookShelfCell.png"];
            [self.view addSubview:_imageView];
            }
    }

    
    
    [self.collectionView registerClass:[MarkCollectionViewCell class] forCellWithReuseIdentifier:indfiner];
    
    [self.view addSubview:_collectionView];


}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

//Collection的cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MarkCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:indfiner forIndexPath:indexPath];
    [_imageView addSubview:cell];
//    for (int i = 1; i < 6; i ++) {
//        if (indexPath.row == i-1) {
//            cell.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i]];
//        }
//    }
    cell.imageView.image = [UIImage imageNamed:@"5.jpg"];
    
    //cell.backgroundColor = [UIColor yellowColor];
    return cell;
    
    
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
