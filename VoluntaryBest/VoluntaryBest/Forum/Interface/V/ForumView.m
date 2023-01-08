//
//  ForumView.m
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/1/8.
//

#import "ForumView.h"
#import "Masonry.h"


#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
@implementation ForumView

- (void) LayoutSelf {
    self.backgroundColor = [UIColor whiteColor];
    
    [self LayoutHead];
}
- (void) LayoutHead {
    UILabel* labelTitle = [[UILabel alloc] init];
    labelTitle.text = @"公益圈";
    labelTitle.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:labelTitle];
    [labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(0);
        make.top.equalTo(self).with.offset(10);
        make.width.mas_equalTo(Width);
        make.height.mas_equalTo(Height*0.1);
    }];
    NSArray* arrayForSegmentControl = @[@"全部", @"关注"];
    self.segmentControlInForum = [[UISegmentedControl alloc] initWithItems:arrayForSegmentControl];
    [self addSubview:self.segmentControlInForum];
    [self.segmentControlInForum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(0);
        make.top.equalTo(labelTitle.mas_bottom).with.offset(-20);
        make.width.mas_equalTo(Width);
        make.height.mas_equalTo(Height*0.04);
    }];
    self.segmentControlInForum.selectedSegmentIndex = 0;
    
    
}
- (void) LayoutTableView {
    self.tableView = [[UITableView alloc] init];
    
    self.tableView.estimatedRowHeight = 200;
    self.tableView.rowHeight = UITableViewAutomaticDimension;


}
@end
