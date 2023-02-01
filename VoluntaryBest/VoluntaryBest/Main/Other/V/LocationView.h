//
//  LocationView.h
//  VoluntaryBest
//
//  Created by 王璐 on 2023/1/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LocationView : UIView
@property (nonatomic, strong) UITextField* searchTextField;
@property (nonatomic, copy) NSMutableArray* cityArray;
@property (nonatomic, copy) NSMutableArray* otherCityArray;
@property (nonatomic, copy) NSMutableArray* recommendArray;
@property (nonatomic, strong) UIScrollView* cityScrollView;
@property (nonatomic, strong) UIScrollView* exactScrollView;
@property (nonatomic, strong) UIScrollView* othersScrollView;
@property (nonatomic, strong) UIButton* buttonCityExact;
@property (nonatomic, strong) UIButton* buttonCity;
- (void)initView;

@end

NS_ASSUME_NONNULL_END
