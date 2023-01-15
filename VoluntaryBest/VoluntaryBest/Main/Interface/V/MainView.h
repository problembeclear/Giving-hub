//
//  MainView.h
//  VoluntaryBest
//
//  Created by 王璐 on 2023/1/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainView : UIView
- (void)initView;
@property (nonatomic, strong) UITextField* textFieldItem;
@property (nonatomic, strong) UIScrollView* scrollActivity;
@property (nonatomic, strong) UIScrollView* scrollButton;

@end

NS_ASSUME_NONNULL_END
