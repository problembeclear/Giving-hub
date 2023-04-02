//
//  NewsView.h
//  VoluntaryBest
//
//  Created by 王璐 on 2023/1/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsView : UIView
<UITableViewDelegate, UITableViewDataSource>
- (void)initView;
@property (nonatomic, strong) UITableView* tableView;
@end

NS_ASSUME_NONNULL_END
