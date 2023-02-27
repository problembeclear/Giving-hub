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
    [self LayoutScrollView];
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
    NSArray* arrayForSegmentControl = @[@"我的关注", @"感想"];
    self.segmentControlInForum = [[UISegmentedControl alloc] initWithItems:arrayForSegmentControl];
    [self addSubview:self.segmentControlInForum];
    [self.segmentControlInForum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(0);
        make.top.equalTo(labelTitle.mas_bottom).with.offset(-20);
        make.width.mas_equalTo(Width);
        make.height.mas_equalTo(Height*0.04);
    }];
    self.segmentControlInForum.selectedSegmentIndex = 0;
    
    
    [self.segmentControlInForum addTarget:self action:@selector(changeView:) forControlEvents:UIControlEventValueChanged];
    
}


- (void) changeView:(NSInteger) selectedSegmentIndex {
    if (self.segmentControlInForum.selectedSegmentIndex == 0) {
        
    } else {
        
    }
}
- (void) LayoutScrollView {
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.frame = CGRectMake(0, Height*0.14 - 10, Width, Height*0.78);
    self.scrollView.contentSize = CGSizeMake(Width*2, 0);
    
    
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
    
    return 1;
}


- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ForumTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"111"];
    
    if (cell == nil) {
        cell = [[ForumTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"111"];
    
    }
    //设置文字换行
    [cell.content setLineBreakMode:NSLineBreakByWordWrapping];
    cell.content.numberOfLines = 0;
    
    
    if (indexPath.row == 0) {
        cell.content.text = @"世界很喧嚣，每个人都互为孤岛\n 将所有敏感的小心思传递出去\n 来换回一份暖心的奇遇\n 拥抱早已准备好，只等你向我奔赴而来\n 由～发起的守护女性公益活动开始招募啦！\n说出自己的故事\n一同拥抱敏感，韧性而活";
        cell.headImage.image = [UIImage imageNamed:@"touxiang1.jpeg"];
        cell.labelName.text = @"abcd";
        cell.labelLocation.text = @"陕西西安";
        cell.labelTime.text = @"1分钟前";
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
    if (indexPath.row == 1) {
        cell.content.text = @"为持续推进水环境治理以及河湖长制工作纵深发展，进一步提高河湖保护意识，武昌区河湖长办联合武昌区检察院、武汉爱我百湖志愿者协会、紫阳公园管理处、民间河湖长们与2023年2月24日在武昌区紫阳湖开展了“河湖长来绘河湖。我为家园添春色”宣传活动，在各级领导的代理下，走访调研，下基层，我们环湖，徒步巡查，积极宣讲。";
        cell.headImage.image = [UIImage imageNamed:@"touxiang0.jpg"];
        cell.labelName.text = @"wasabi";
        cell.labelLocation.text = @"河南郑州";
        cell.labelTime.text = @"3分钟前";
        UIImageView* imageFirst = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cellImage2.png"]];
        [cell.content addSubview:imageFirst];
        [imageFirst mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(cell.content).with.offset(0);
            make.width.mas_equalTo((Width-30)/3);
            make.height.mas_equalTo((Width-30)/3);
            make.bottom.equalTo(cell.buttonLike.mas_top).with.offset(-10);
            make.top.equalTo(cell.content.mas_bottom).with.offset(10);
        }];
    }
    
    return  cell;
}


@end
