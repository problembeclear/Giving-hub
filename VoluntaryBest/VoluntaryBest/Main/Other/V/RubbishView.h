//
//  RubbishView.h
//  VoluntaryBest
//
//  Created by 王璐 on 2023/3/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RubbishView : UIView
<UITableViewDelegate, UITableViewDataSource>
- (void) initView;
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) UITextField* textField;
@property (nonatomic, strong) UILabel* label;

@property (nonatomic, copy) NSDictionary* rubbishDictionary;
@end

NS_ASSUME_NONNULL_END
