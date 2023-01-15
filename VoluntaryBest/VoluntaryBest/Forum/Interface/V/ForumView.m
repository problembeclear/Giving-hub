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
    self.tableView.estimatedRowHeight = 400;
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
        
      
        
        UIImageView* imageFirst = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"peitu1.jpg"]];
        UIImageView* imageSecond = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"peitu2.jpg"]];
        
        
        [cell.content addSubview:imageFirst];
        [cell.content addSubview:imageSecond];
        [imageFirst mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(cell.content).with.offset(0);
            make.width.mas_equalTo((Width-30)/3);
            make.height.mas_equalTo((Width-30)/3);
            make.bottom.equalTo(cell.buttonLike.mas_top).with.offset(-10);
            make.top.equalTo(cell.content.mas_bottom).with.offset(10);
        }];
        [imageSecond mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageFirst.mas_right).with.offset(20);
            make.width.mas_equalTo((Width-30)/3);
            make.height.mas_equalTo((Width-30)/3);
            make.bottom.equalTo(cell.buttonLike.mas_top).with.offset(-10);
            make.top.equalTo(cell.content.mas_bottom).with.offset(10);
        }];
    }
    
    
    return  cell;
}
@end
