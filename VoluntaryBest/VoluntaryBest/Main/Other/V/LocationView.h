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
@property (nonatomic, strong) UIScrollView* cityScrollView;
@property (nonatomic, strong) UIScrollView* exactScrollView;
- (void)initView;

@end

NS_ASSUME_NONNULL_END
