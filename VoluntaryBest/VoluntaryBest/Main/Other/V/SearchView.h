//
//  SearchView.h
//  VoluntaryBest
//
//  Created by 王璐 on 2023/1/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchView : UIView
<UITableViewDelegate,
UITableViewDataSource>
@property (nonatomic, strong)UITableView* buttonTableView;
@property (nonatomic, strong)UIButton* buttonOpen;
@property (nonatomic, copy) NSMutableArray* buttonTitleArray;
- (void)initView;

@end

NS_ASSUME_NONNULL_END
