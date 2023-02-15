//
//  SettingsView.h
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/1/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SettingsView : UIView
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong) UIScrollView* scrollViewInSettings;
@property (nonatomic, strong) UIView* headView;


@property (nonatomic, strong) UIView* achievementView;
@property (nonatomic, strong) UIView* activityView;
- (void) LayoutSelf;
- (void) LayoutHeadView;
- (void) LayoutScrollView;
- (void) LayoutAchievements;
- (void) LayoutActivity;
@end

NS_ASSUME_NONNULL_END
