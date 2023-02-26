//
//  ErShiSiView.h
//  VoluntaryBest
//
//  Created by 王璐 on 2023/2/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ErShiSiView : UIView
- (void)initView;
@property (nonatomic, strong) UIScrollView* chooseScrollView;
@property (nonatomic, strong) UIScrollView* exactScrollView;
@property (nonatomic, copy) NSMutableArray* chooseArray;
@property (nonatomic, strong) UIButton* buttonCity;
@property (nonatomic, copy) NSMutableArray* cityArray;
@property (nonatomic, copy) NSMutableArray* otherCityArray;
@end

NS_ASSUME_NONNULL_END
