//
//  SettingsView.m
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/1/6.
//

#import "SettingsView.h"
#import "Masonry.h"

#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height

@implementation SettingsView

- (void) LayoutSelf {
    self.backgroundColor = [UIColor whiteColor];
    
    [self LayoutHeadView];
    [self LayoutScrollView];
    
}
- (void) LayoutHeadView {
    
    self.headView = [[UIView alloc] init];
    self.headView.backgroundColor = [UIColor colorWithRed:48.0/255 green:200.0/255 blue:149.0/255 alpha:1];
    
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
    NSLog(@"11");
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
    UIView* achievementsView = [[UIView alloc] init];
    [self addSubview:achievementsView];
    [achievementsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.scrollViewInSettings).with.offset(Width*0.05);
        make.right.equalTo(self.scrollViewInSettings).with.offset(-Width*0.05);
        make.top.equalTo(self.scrollViewInSettings).with.offset(30);
        make.height.mas_equalTo(Height*0.15);
    }];
    achievementsView.backgroundColor = [UIColor whiteColor];
    
    achievementsView.layer.cornerRadius = 20;
    achievementsView.layer.masksToBounds = YES;
}
@end
