//
//  SettingsCell.h
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/2/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SettingsCell : UITableViewCell
@property (strong, nonatomic) UIImageView* imageInSetting ;

@property (strong, nonatomic) UILabel* labelInSetting ;

@property (strong, nonatomic) UISwitch* switchInSetting ;
@end

NS_ASSUME_NONNULL_END
