//
//  NewsView.m
//  VoluntaryBest
//
//  Created by 王璐 on 2023/1/15.
//

#import "NewsView.h"
#import "Masonry.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@implementation NewsView
- (void)initView{
    
    self.backgroundColor = [UIColor whiteColor];
    UIButton* buttonReturnMain = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonReturnMain setImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    [self addSubview:buttonReturnMain];
    buttonReturnMain.titleLabel.font = [UIFont systemFontOfSize:50];
    [buttonReturnMain setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonReturnMain mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(15);
        make.top.equalTo(self).with.offset(34);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
    }];
    [buttonReturnMain addTarget:self action:@selector(returnMian) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel* label = [[UILabel alloc] init];
    label.text = @"我的消息";
    [self addSubview:label];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:28];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonReturnMain).with.offset(30);
        make.top.equalTo(self).with.offset(40);
        make.width.mas_equalTo(WIDTH - 90);
        make.height.mas_equalTo(30);
    }];
    
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.frame = CGRectMake(0, 80, WIDTH, HEIGHT - 80);
    self.tableView.backgroundColor = [UIColor systemGray4Color];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"111"];
    [self addSubview:self.tableView];
    //self.tableView.backgroundColor = [UIColor redColor];
    
    
}
//注意.m文件里一定实现这几个函数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
   return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"111"];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"111"];
    }
    if (indexPath.row == 0) {
        UILabel* labelText = [[UILabel alloc] init];
        labelText.text = @"您的助学捐款已到账！";
        labelText.font = [UIFont systemFontOfSize:18];
        labelText.textColor = [UIColor blackColor];
        labelText.frame = CGRectMake(20, 20, WIDTH - 40, 60);
        [cell addSubview:labelText];
        UILabel* label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor redColor];
        label.frame = CGRectMake(WIDTH - 20, 35, 10, 10);
        label.layer.cornerRadius = label.frame.size.width/2;
        label.layer.masksToBounds = YES;
        [cell addSubview:label];
    } else if (indexPath.row == 1) {
        UILabel* labelText = [[UILabel alloc] init];
        labelText.text = @"您的秦岭清扫活动已完结！请查收完结报告！";
        labelText.font = [UIFont systemFontOfSize:18];
        labelText.textColor = [UIColor blackColor];
        labelText.frame = CGRectMake(20, 20, WIDTH - 40, 60);
        [cell addSubview:labelText];
        UILabel* label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor redColor];
        label.frame = CGRectMake(WIDTH - 20, 35, 10, 10);
        label.layer.cornerRadius = label.frame.size.width/2;
        label.layer.masksToBounds = YES;
        [cell addSubview:label];
    } else if (indexPath.row == 2) {
        UILabel* labelText = [[UILabel alloc] init];
        labelText.text = @"西安邮电大学西典课堂活动完结报告";
        labelText.font = [UIFont systemFontOfSize:18];
        labelText.textColor = [UIColor blackColor];
        labelText.frame = CGRectMake(20, 20, WIDTH - 40, 60);
        [cell addSubview:labelText];
        UILabel* label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor redColor];
        label.frame = CGRectMake(WIDTH - 20, 35, 10, 10);
        label.layer.cornerRadius = label.frame.size.width/2;
        label.layer.masksToBounds = YES;
        [cell addSubview:label];
    } else if (indexPath.row == 3) {
        UILabel* labelText = [[UILabel alloc] init];
        labelText.text = @"您的支教报名已通过，请及时添加个人信息";
        labelText.font = [UIFont systemFontOfSize:18];
        labelText.textColor = [UIColor grayColor];
        labelText.frame = CGRectMake(20, 20, WIDTH - 40, 60);
        [cell addSubview:labelText];
    } else if (indexPath.row == 4) {
        UILabel* labelText = [[UILabel alloc] init];
        labelText.text = @"您关注的校园美化师活动已开始报名，请及时填写信息";
        labelText.font = [UIFont systemFontOfSize:18];
        labelText.textColor = [UIColor grayColor];
        labelText.frame = CGRectMake(20, 20, WIDTH - 40, 60);
        [cell addSubview:labelText];
    } else if (indexPath.row == 5) {
        UILabel* labelText = [[UILabel alloc] init];
        labelText.text = @"您的图书馆志愿者申请已通过！";
        labelText.font = [UIFont systemFontOfSize:18];
        labelText.textColor = [UIColor grayColor];
        labelText.frame = CGRectMake(20, 20, WIDTH - 40, 60);
        [cell addSubview:labelText];
    } else if (indexPath.row == 6) {
        UILabel* labelText = [[UILabel alloc] init];
        labelText.text = @"请及时领取您的防艾勋章！";
        labelText.font = [UIFont systemFontOfSize:18];
        labelText.textColor = [UIColor grayColor];
        labelText.frame = CGRectMake(20, 20, WIDTH - 40, 60);
        [cell addSubview:labelText];
    }
    return cell;
}


- (void)returnMian{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"returnMain" object:nil];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
