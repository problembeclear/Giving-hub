//
//  ForumView.m
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/1/8.
//

#import "ForumView.h"
#import "Masonry.h"
#import "ForumTableViewCell.h"
#import "createTableViewCell.h"

#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height

@interface ForumView ()

@property (nonatomic, strong) UITextView* textView;

@end

@implementation ForumView

- (void) LayoutSelf {
    self.backgroundColor = [UIColor whiteColor];
    
    [self LayoutHead];
    [self LayoutScrollView];
    [self LayoutTableView];
    
    [self LayoutTextView];
    
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
    NSArray* arrayForSegmentControl = @[@"广场", @"写日志"];
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
        [self.scrollView setContentOffset:CGPointMake(0, 0)];
    } else {
        [self.scrollView setContentOffset:CGPointMake(Width, 0)];
    }
}

- (void) LayoutScrollView {
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.frame = CGRectMake(0, Height*0.14 - 10, Width, Height*0.78);
    self.scrollView.contentSize = CGSizeMake(Width*2, 0);
    
    self.scrollView.scrollEnabled = YES;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.alwaysBounceVertical = NO;
    self.scrollView.alwaysBounceHorizontal = YES;
    
    self.scrollView.backgroundColor = [UIColor systemGray6Color];
    
    [self addSubview:self.scrollView];
    
    self.scrollView.delegate = self;
    self.scrollView.tag = 101;
}

- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView.tag == 101) {
        if (scrollView.contentOffset.x >= Width*0.90) {
            self.segmentControlInForum.selectedSegmentIndex = 1;
        }
        if (scrollView.contentOffset.x < Width*0.5) {
            self.segmentControlInForum.selectedSegmentIndex = 0;
        }
    }
    
}

- (void) LayoutTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Width, Height*0.78) style:UITableViewStylePlain];
    
    self.tableView.tag = 1;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 400;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    
    
    [self.scrollView addSubview:self.tableView];
    
}



- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 2;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}


- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ForumTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"111"];
    createTableViewCell* cell2 = [tableView dequeueReusableCellWithIdentifier:@"222"];
    
    if (tableView.tag == 1) {
        
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
    if (tableView.tag == 2) {
        if (cell2 == nil) {
            cell2 = [[createTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"222"];
        }
        if (indexPath.row == 0) {
            cell2.cellImage.image = [UIImage imageNamed:@"quanxian.png"];
            cell2.mainLabel.text = @"权限设置";
            cell2.secondLabel.text = @"所有人可见";
            cell2.secondLabel.textColor = [UIColor grayColor];
        }
        if (indexPath.row == 1) {
            cell2.cellImage.image = [UIImage imageNamed:@"dingshirenwu.png"];
            cell2.mainLabel.text = @"定时";
            cell2.secondLabel.text = @"立即发表";
            cell2.secondLabel.textColor = [UIColor grayColor];
        }
        
        cell2.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell2;
    }
    return cell;
}

- (void) LayoutTextView {
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(30 + Width, 20, Width - 30*2, Height*0.25)];
    [self.scrollView addSubview:_textView];
    _textView.backgroundColor = [UIColor whiteColor];
    
    _textView.layer.cornerRadius = 25;
    _textView.clipsToBounds = YES;
    
    _textView.layer.borderColor = [[UIColor grayColor] CGColor];
    _textView.layer.borderWidth = 0.4;
    
    _textView.text = @"♡\n“不要担心，会变得很好，就像你时常期望的那个样子。”";
    _textView.font = [UIFont systemFontOfSize:18];
    
    
    
    
    
    
    
    UIButton* buttonForSend = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonForSend setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [buttonForSend setTitle:@"发布" forState:UIControlStateNormal];
    [buttonForSend setBackgroundColor:[UIColor whiteColor]];
    
    
    
    UIButton* buttonForLocation = [UIButton buttonWithType:UIButtonTypeCustom];

    buttonForLocation.tintColor = [UIColor whiteColor];
    [buttonForLocation setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [buttonForLocation setTitle:@"添加地点" forState:UIControlStateNormal];
    
    
    buttonForSend.layer.cornerRadius = 10;
    buttonForSend.clipsToBounds = YES;
    buttonForSend.layer.borderColor = [[UIColor whiteColor] CGColor];
    buttonForSend.layer.borderWidth = 0.4;
    
    
    buttonForLocation.layer.cornerRadius = 15;
    buttonForLocation.clipsToBounds = YES;
    buttonForLocation.layer.borderColor = [[UIColor whiteColor] CGColor];
    buttonForLocation.layer.borderWidth = 0.4;
    buttonForLocation.titleLabel.font = [UIFont systemFontOfSize:15];
    [buttonForLocation setBackgroundColor:[UIColor systemGray5Color]];

    
    [self.scrollView addSubview:buttonForSend];
    [buttonForSend mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_textView.mas_right).with.offset(0);
        make.width.mas_equalTo(Width*0.2);
        make.top.equalTo(_textView.mas_bottom).with.offset(10);
        make.height.mas_equalTo(Width*0.1);
    }];
    
    
    [self.scrollView addSubview:buttonForLocation];
    [buttonForLocation mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(buttonForSend).with.offset(10);
        make.height.mas_equalTo(Width*0.05);
        make.left.equalTo(_textView.mas_left).with.offset(0);
        make.width.mas_equalTo(Width*0.2);
    }];
    
    
    UIToolbar * topView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
       [topView setBarStyle:UIBarStyleBlack];
    topView.barTintColor = [UIColor whiteColor];
    UIBarButtonItem * SwitchButton = [[UIBarButtonItem alloc]initWithTitle:@"Switch" style:UIBarButtonItemStylePlain target:self action:nil];
    UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem * doneButton = [[UIBarButtonItem alloc]initWithTitle:@"收起↓" style:UIBarButtonItemStyleDone target:self action:@selector(dismissKeyBoard)];
    NSArray * buttonsArray = [NSArray arrayWithObjects:SwitchButton,btnSpace,doneButton,nil];
    [topView setItems:buttonsArray];
    [self.textView setInputAccessoryView:topView];
    
    
    [self LayoutSecondTableView];

}
- (void) LayoutSecondTableView {
    self.secondTableView = [[UITableView alloc] initWithFrame:CGRectMake(Width, Height*0.4, Width, Height*0.2) style:UITableViewStylePlain];
    
    self.secondTableView.tag = 2;
    self.secondTableView.backgroundColor = [UIColor clearColor];
    
    self.secondTableView.delegate = self;
    self.secondTableView.dataSource = self;
    
    [self.scrollView addSubview:self.secondTableView];
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.tag == 1) {
        
    }
    if (tableView.tag == 2) {
        
    }
}

- (IBAction) dismissKeyBoard {
   [self.textView resignFirstResponder];
}
@end
