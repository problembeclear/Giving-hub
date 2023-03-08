//
//  SettingsView.m
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/1/6.
//

#import "SettingsView.h"
#import "Masonry.h"
#import "SettingsCell.h"

#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height

@interface SettingsView ()
@property (nonatomic, strong) UITableView* tableView;

@end


@implementation SettingsView

- (void) LayoutSelf {
    self.backgroundColor = [UIColor whiteColor];
    
    [self LayoutHeadView];

    [self LayoutTableView];
    
}
- (void) LayoutHeadView {
    
    self.headView = [[UIView alloc] init];
    self.headView.backgroundColor = [UIColor colorWithRed:100.0/255 green:200.0/255 blue:149.0/255 alpha:1];
    
    [self addSubview:self.headView];
    
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(0);
        make.top.equalTo(self).with.offset(0);
        make.width.mas_equalTo(Width);
        make.height.mas_equalTo(Height*0.23);
    }];
    
    UIImageView* imageHeader = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"headerbackground.png"]];
    
    [self.headView addSubview:imageHeader];
    
    //头像
    UIButton* buttonHeadImage = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.headView addSubview:buttonHeadImage];
    [buttonHeadImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(Width*0.1);
        make.top.equalTo(self).with.offset(Height*0.1);
        make.height.mas_equalTo(Width*0.15);
        make.width.mas_equalTo(Width*0.15);
    }];
    
    [buttonHeadImage setBackgroundImage:[UIImage imageNamed:@"touxiang.jpg"] forState:UIControlStateNormal];
    
    buttonHeadImage.layer.cornerRadius = Width*0.075;
    buttonHeadImage.layer.masksToBounds = YES;
    [buttonHeadImage addTarget:self action:@selector(replaceImage) forControlEvents:UIControlEventTouchUpInside];
    
    //名称
    UILabel* labelName = [[UILabel alloc] init];
    labelName.text = @"志愿者01";
    labelName.font = [UIFont systemFontOfSize:25];
    labelName.textColor = [UIColor blackColor];
    [self.headView addSubview:labelName];
    [labelName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonHeadImage.mas_right).with.offset(20);
        make.bottom.equalTo(buttonHeadImage.mas_bottom).with.offset(0);
        make.width.mas_equalTo(Width*0.3);
        make.height.mas_equalTo(Width*0.1);
    }];
    
    //修改按钮
    UIButton* buttonModify = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonModify setBackgroundImage:[UIImage imageNamed:@"xiugai.png"] forState:UIControlStateNormal];
    [self.headView addSubview:buttonModify];
    [buttonModify mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.headView).with.offset(-Width*0.1);
        make.top.equalTo(buttonHeadImage).with.offset(20);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    [buttonModify addTarget:self action:@selector(modifyDetails) forControlEvents:UIControlEventTouchUpInside];
}

- (void) replaceImage {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pressImage" object:nil];
}
- (void) modifyDetails {
    NSLog(@"MODIFY");
}



- (void) LayoutTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, Height*0.2, Width, Height*0.74) style:UITableViewStyleInsetGrouped];
    
    self.tableView.backgroundColor = [UIColor systemGray5Color];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self addSubview:self.tableView];
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    } else if (section == 1) {
        return 4;
    } else {
        return 2;
    }
    return 0;
}




- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld  %ld", indexPath.section, indexPath.row);
   
}



- (SettingsCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SettingsCell* cell = [tableView dequeueReusableCellWithIdentifier:@"111"];
    
    if (cell == nil) {
        cell = [[SettingsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"123"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    
    cell.backgroundColor = [UIColor whiteColor];
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.imageInSetting.image = [UIImage imageNamed:@"zhanghuguanli.png"];
            cell.labelInSetting.text = @"我的账户";
        } else if (indexPath.row == 1) {
            cell.imageInSetting.image = [UIImage imageNamed:@"shoucang-5.png"];
            cell.labelInSetting.text = @"我的收藏";
        } else {
            cell.imageInSetting.image = [UIImage imageNamed:@"huodong-5.png"];
            cell.labelInSetting.text = @"社区活动";
        }
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.imageInSetting.image = [UIImage imageNamed:@"haoyou1-xianxing.png"];
            cell.labelInSetting.text = @"好友";
        } else if (indexPath.row == 1) {
            cell.imageInSetting.image = [UIImage imageNamed:@"f-video.png"];
            cell.labelInSetting.text = @"视频设置";
        } else if (indexPath.row == 2) {
            cell.imageInSetting.image = [UIImage imageNamed:@"huodong-6.png"];
            cell.labelInSetting.text = @"历史活动";
        } else {
            cell.imageInSetting.image = [UIImage imageNamed:@"shuben.png"];
            cell.labelInSetting.text = @"课堂";
        }
    } else {
        if (indexPath.row == 0) {
            cell.imageInSetting.image = [UIImage imageNamed:@"shezhi-2.png"];
            cell.labelInSetting.text = @"详细设置";
        } else {
            cell.imageInSetting.image = [UIImage imageNamed:@"fankui.png"];
            cell.labelInSetting.text = @"反馈";
        }
    }
    
    
    
    return cell;
}



@end



