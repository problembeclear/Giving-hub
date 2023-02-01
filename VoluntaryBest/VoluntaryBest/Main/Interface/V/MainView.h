//
//  MainView.h
//  VoluntaryBest
//
//  Created by 王璐 on 2023/1/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainView : UIView
<UICollectionViewDelegate,
UICollectionViewDataSource>
- (void)initView;
@property (nonatomic, strong) UITextField* textFieldItem;
@property (nonatomic, strong) UIScrollView* scrollActivity;
@property (nonatomic, strong) UIScrollView* scrollBack;
@property (nonatomic, strong) UIScrollView* scrollButton;
@property (strong, nonatomic) UICollectionView* collectionView;
@property (strong, nonatomic) UICollectionViewFlowLayout* flowLayout;
@property (strong, nonatomic) UIButton* locationButton;

@end

NS_ASSUME_NONNULL_END
