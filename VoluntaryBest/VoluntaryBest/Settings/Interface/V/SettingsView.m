//
//  SettingsView.m
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/1/6.
//

#import "SettingsView.h"
#import "Masonry.h"
#import "SettingsTableView.h"

#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height

@interface SettingsView ()
@property (nonatomic, strong) SettingsTableView;

@end


@implementation SettingsView

- (void) LayoutSelf {
    self.backgroundColor = [UIColor whiteColor];
    
    [self LayoutHeadView];
    [self LayoutScrollView];
    
}
- (void) LayoutHeadView {
    
    self.headView = [[UIView alloc] init];
    self.headView.backgroundColor = [UIColor colorWithRed:100.0/255 green:200.0/255 blue:149.0/255 alpha:1];
    
    [self addSubview:self.headView];
    
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(0);
        make.top.equalTo(self).with.offset(0);
        make.width.mas_equalTo(Width);
        make.height.mas_equalTo(Height*0.2);
    }];
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
    labelName.text = @"志同道合01";
    labelName.font = [UIFont systemFontOfSize:20];
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



- (void) LayoutScrollView {
    self.scrollViewInSettings = [[UIScrollView alloc] init];
    [self addSubview:self.scrollViewInSettings];

//    [self.scrollViewInSettings mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self).with.offset(0);
//        make.top.equalTo(self).with.offset(Height*0.2);
//        make.width.mas_equalTo(Width);
//        make.height.mas_equalTo(Height*0.8);
//    }];

    self.scrollViewInSettings.frame = CGRectMake(0, Height*0.2, Width, Height*2);
    self.scrollViewInSettings.backgroundColor = [UIColor systemGray5Color];

    self.scrollViewInSettings.showsVerticalScrollIndicator = YES;
    self.scrollViewInSettings.showsHorizontalScrollIndicator = NO;
    self.scrollViewInSettings.contentSize = CGSizeMake(0, Height*2);
    self.scrollViewInSettings.scrollEnabled = YES;
    [self LayoutAchievements];
}

- (void) LayoutAchievements {
    self.achievementView = [[UIView alloc] init];
    [self addSubview:self.achievementView];
    [self.achievementView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.scrollViewInSettings).with.offset(Width*0.05);
        make.right.equalTo(self.scrollViewInSettings).with.offset(-Width*0.05);
        make.top.equalTo(self.scrollViewInSettings).with.offset(30);
        make.height.mas_equalTo(Height*0.12);
    }];
    self.achievementView.backgroundColor = [UIColor whiteColor];

    self.achievementView.layer.cornerRadius = 20;
    self.achievementView.layer.masksToBounds = YES;


    //参与活动
    UILabel* label1 = [[UILabel alloc] init];
    label1.text = @"参与活动";
    label1.textAlignment = NSTextAlignmentCenter;
    label1.textColor = [UIColor blackColor];
    [self addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.achievementView).with.offset(0);
        make.top.equalTo(self.achievementView).with.offset(0);
        make.width.mas_equalTo(Width*0.3);
        make.height.mas_equalTo(Height*0.05);
    }];
    UILabel* labelCount1 = [[UILabel alloc] init];
    labelCount1.text = @"0";
    labelCount1.font = [UIFont systemFontOfSize:25];
    labelCount1.textAlignment = NSTextAlignmentCenter;
    [self addSubview:labelCount1];
    [labelCount1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label1.mas_left).with.offset(0);
        make.top.equalTo(label1.mas_bottom).with.offset(0);
        make.width.mas_equalTo(Width*0.3);
        make.height.mas_equalTo(Height*0.07);
    }];
    //公益贡献
    UILabel* label2 = [[UILabel alloc] init];
    label2.text = @"公益贡献";
    label2.textAlignment = NSTextAlignmentCenter;
    label2.textColor = [UIColor blackColor];
    [self addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label1.mas_right).with.offset(0);
        make.top.equalTo(label1.mas_top).with.offset(0);
        make.width.mas_equalTo(Width*0.3);
        make.height.mas_equalTo(Height*0.05);
    }];
    UILabel* labelCount2 = [[UILabel alloc] init];
    labelCount2.text = @"0";
    labelCount2.font = [UIFont systemFontOfSize:25];
    labelCount2.textAlignment = NSTextAlignmentCenter;
    [self addSubview:labelCount2];
    [labelCount2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label2.mas_left).with.offset(0);
        make.top.equalTo(label2.mas_bottom).with.offset(0);
        make.width.mas_equalTo(Width*0.3);
        make.height.mas_equalTo(Height*0.07);
    }];
    //我的勋章
    UILabel* label3 = [[UILabel alloc] init];
    label3.text = @"我的勋章";
    label3.textAlignment = NSTextAlignmentCenter;
    label3.textColor = [UIColor blackColor];
    [self addSubview:label3];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label2.mas_right).with.offset(0);
        make.top.equalTo(label2.mas_top).with.offset(0);
        make.width.mas_equalTo(Width*0.3);
        make.height.mas_equalTo(Height*0.05);
    }];

    UILabel* labelCount3 = [[UILabel alloc] init];
    labelCount3.text = @"0";
    labelCount3.font = [UIFont systemFontOfSize:25];
    labelCount3.textAlignment = NSTextAlignmentCenter;
    [self addSubview:labelCount3];
    [labelCount3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label3.mas_left).with.offset(0);
        make.top.equalTo(label3.mas_bottom).with.offset(0);
        make.width.mas_equalTo(Width*0.3);
        make.height.mas_equalTo(Height*0.07);
    }];


    [self LayoutActivity];
}

- (void) LayoutActivity {
    self.activityView = [[UIView alloc] init];
    [self addSubview:self.activityView];
    [self.activityView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.scrollViewInSettings).with.offset(Width*0.05);
        make.right.equalTo(self.scrollViewInSettings).with.offset(-Width*0.05);
        make.top.equalTo(self.achievementView.mas_bottom).with.offset(30);
        make.height.mas_equalTo(Height*0.2);
    }];
    self.activityView.backgroundColor = [UIColor whiteColor];

    self.activityView.layer.cornerRadius = 20;
    self.activityView.layer.masksToBounds = YES;

    UIView* grayView = [[UIView alloc] init];
    grayView.backgroundColor = [UIColor systemGray3Color];
    grayView.frame = CGRectMake(0, 40, Width, 0.5);
    [self.activityView addSubview:grayView];

    UILabel* labelAct = [[UILabel alloc] init];
    labelAct.text = @"我的活动";
    labelAct.textAlignment = NSTextAlignmentCenter;
    [self.activityView addSubview:labelAct];
    [labelAct mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.activityView).with.offset(0);
        make.top.equalTo(self.activityView).with.offset(0);
        make.width.mas_equalTo(Width*0.2);
        make.height.mas_equalTo(40);
    }];

}
- (void) LayoutService {

}



@end
