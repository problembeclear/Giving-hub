//
//  ForumView.h
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/1/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ForumView : UIView <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
@property (nonatomic, strong) UISegmentedControl* segmentControlInForum;
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) UIScrollView* scrollView;

- (void) LayoutSelf;
- (void) LayoutTableView;
@end

NS_ASSUME_NONNULL_END
