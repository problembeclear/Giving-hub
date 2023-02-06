//
//  SaysView.h
//  VoluntaryBest
//
//  Created by 王璐 on 2023/2/5.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
NS_ASSUME_NONNULL_BEGIN

@interface SaysView : UIView
<
UITableViewDelegate,
UITableViewDataSource
>
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSMutableArray* array;
@property (nonatomic, strong) NSDictionary* dictionarySays;
- (void)initView;
- (void)getJsonModel;
@end

NS_ASSUME_NONNULL_END
