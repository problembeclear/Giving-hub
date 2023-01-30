//
//  MyLayout.m
//  VoluntaryBest
//
//  Created by 王璐 on 2023/1/31.
//

#import "MyLayout.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@implementation MyLayout

//数组的相关设置在这个方法中
//布局前的准备 会调用这个方法
- (void)prepareLayout {
    [super prepareLayout];
    
    _itemCount = (int)[self.collectionView numberOfItemsInSection:0];
    _attributeArray = [[NSMutableArray alloc] init];
    
    //设置为静态的2列
    //计算每一个item的宽度
    float itemWidth = ([UIScreen mainScreen].bounds.size.width - self.sectionInset.left - self.sectionInset.right - self.minimumInteritemSpacing ) / 2;
    
    //定义数组保存每一列的高度
    //这个数组的主要作用是保存每一列的总高度，这个样在布局时，我们可以始终将下一个item放在最短的列下面
    CGFloat colHeight[2] = {self.sectionInset.top, self.sectionInset.bottom};
    
    //itemCount是外界传进来的item的个数 遍历来设置每一个item的布局
    for (int i = 0; i < self.itemCount; i++) {
        //设置每一个item的位置等相关属性
        NSIndexPath *index = [NSIndexPath indexPathForItem:i inSection:0];
        //创建一个布局属性类， 通过indexPath来创建
        UICollectionViewLayoutAttributes *attris = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:index];
        //随意一个高度 在60-260之间
        CGFloat height = arc4random() % 200 + 60;
        
        //哪一行高度小 则放到哪一列下面
        //标记最短的列
        int flag = 0;
        if (colHeight[0] < colHeight[1]) {
            //将新的item高度加入到短的一列
            colHeight[0] = colHeight[0] + height + self.minimumLineSpacing;
            flag = 0;
        } else {
            colHeight[1] = colHeight[1] + height + self.minimumLineSpacing;
            flag = 1;
        }
        
        //设置item的位置
        attris.frame = CGRectMake(self.sectionInset.left + (self.minimumInteritemSpacing + itemWidth) * flag, colHeight[flag] - height - self.minimumLineSpacing, itemWidth, height);
        
        [_attributeArray addObject:attris];
    }
    
    //设置itemSize来确保滑动范围的正确 这里是通过将所有的item高度平均化，计算出来的 （以最高的列为标准）
    if (colHeight[0] > colHeight[1]) {
        self.itemSize = CGSizeMake(itemWidth, (colHeight[0] - self.sectionInset.top) * 2 / _itemCount - self.minimumLineSpacing);
    } else {
        self.itemSize = CGSizeMake(itemWidth, (colHeight[1] - self.sectionInset.top) * 2 / _itemCount - self.minimumLineSpacing);
    }
    
}

//返回布局数组
- (NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return _attributeArray;
}
@end
