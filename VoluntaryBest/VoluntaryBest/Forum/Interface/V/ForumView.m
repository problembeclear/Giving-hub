//
//  ForumView.m
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/1/8.
//

#import "ForumView.h"
#import "Masonry.h"
#import "ForumTableViewCell.h"

#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
@implementation ForumView

- (void) LayoutSelf {
    self.backgroundColor = [UIColor whiteColor];
    
    [self LayoutHead];
    [self LayoutTableView];
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
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, Height*0.14-10, Width, Height*0.78) style:UITableViewStylePlain];
    
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 300;
    self.tableView.rowHeight = UITableViewAutomaticDimension;

    [self addSubview:self.tableView];
    
}



- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 2;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 5;
}


- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ForumTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"111"];
    
    if (cell == nil) {
        cell = [[ForumTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"111"];
        
        //设置文字换行
        [cell.content setLineBreakMode:NSLineBreakByWordWrapping];
        cell.content.numberOfLines = 0;
        
        cell.content.text = @"我今天吃了一只烤鸭一块巧克力一个煎饼果子一个炸鸡腿一串烤面筋一个水果蛋糕一份烤冷面一份小龙虾喝了一杯杨枝甘露一瓶可乐一桶珍珠奶茶";
    }
    
    
    return  cell;
}
@end
