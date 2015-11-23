//
//  CustomFlowLayout.m
//  XiHa看书
//
//  Created by lanou3g on 15/11/21.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "CustomFlowLayout.h"

#define kItem 100

@implementation CustomFlowLayout

-(void)prepareLayout{
    //设置大小
    self.itemSize = CGSizeMake(kItem+20, kItem+50);
    //设置滚动方向
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.minimumLineSpacing = 50;
    //左右边距
    CGFloat inset = (SCREEN_WIDTH-kItem)*0.5;
    //设置内边距
    self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);

}


//Collection集合视图
//    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
//    layout.minimumLineSpacing = 45;
//    layout.minimumInteritemSpacing = 10;
//
//    layout.itemSize = CGSizeMake(SCREEN_WIDTH/3-20, (SCREEN_HEIGHT-240)/3);
//
//    layout.sectionInset = UIEdgeInsetsMake(15, 15, 40, 15);

//是否时刻改变并重新布局
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}
//这个数组里面放置的是每一个item的设置属性
-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    //从父类里面获取item设置属性的数组
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    //获取屏幕的中心点
    CGFloat centerX = SCREEN_WIDTH*0.5+self.collectionView.contentOffset.x;
    //遍历
    for (UICollectionViewLayoutAttributes *attrs in array) {
        //确定item的中心点
        CGFloat itemCenterX = attrs.center.x;
        //确定缩放比例
        CGFloat scale = 1+0.5*(1-ABS(itemCenterX-centerX)/200);
        //开始缩放
        attrs.transform3D = CATransform3DMakeScale(scale, scale, 1);
        
    }
    
    return array;
}






@end
