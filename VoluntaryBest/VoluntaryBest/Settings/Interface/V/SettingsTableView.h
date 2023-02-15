//
//  SettingsTableView.h
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/2/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SettingsTableView : UITableView
@property (strong, nonatomic) UIImageView* imageInSetting ;

@property (strong, nonatomic) UIButton* buttonInSetting ;

@property (strong, nonatomic) UILabel* labelInSetting ;

@property (strong, nonatomic) UIImageView* imageView;

@property (strong, nonatomic) UISwitch* switchInSetting ;
@end

NS_ASSUME_NONNULL_END
