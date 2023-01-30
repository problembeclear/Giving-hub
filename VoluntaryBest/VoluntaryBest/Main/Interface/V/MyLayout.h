//
//  MyLayout.h
//  VoluntaryBest
//
//  Created by 王璐 on 2023/1/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyLayout : UICollectionViewFlowLayout

@property (nonatomic, assign) int itemCount;
@property (nonatomic, strong) NSMutableArray *attributeArray;
@end

NS_ASSUME_NONNULL_END
