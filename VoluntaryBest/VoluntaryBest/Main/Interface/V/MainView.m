//
//  MainView.m
//  VoluntaryBest
//
//  Created by 王璐 on 2023/1/9.
//

#import "MainView.h"
#import "Masonry.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@implementation MainView
- (void)initView{
    self.backgroundColor = [UIColor colorWithRed:48.0/255 green:200.0/255 blue:149.0/255 alpha:1];
    
    //地区选择
    UIButton* locationButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [locationButton setTitle:@"杭州市" forState:UIControlStateNormal];
    [self addSubview:locationButton];
    [locationButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    locationButton.titleLabel.font = [UIFont boldSystemFontOfSize:26];
    [locationButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(0);
        make.top.equalTo(self).with.offset(34);
        make.width.mas_equalTo(WIDTH*0.3);
        make.height.mas_equalTo(HEIGHT*0.05);
        
    }];
    [locationButton addTarget:self action:@selector(pressLoactionButton:) forControlEvents:UIControlEventTouchUpInside];
    //locationButton.backgroundColor = [UIColor yellowColor];
    
    //志愿者人数标签
    UILabel* lablePeople = [[UILabel alloc] init];
    lablePeople.text = @"1,101,708";
    lablePeople.font = [UIFont systemFontOfSize:26];
    [self addSubview:lablePeople];
    [lablePeople mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(WIDTH*0.27);
        make.top.equalTo(self).with.offset(34);
        make.width.mas_equalTo(WIDTH*0.25);
        make.height.mas_equalTo(HEIGHT*0.05);
        
    }];
    //lablePeople.backgroundColor = [UIColor redColor];
    UILabel* lablePeopleNum = [[UILabel alloc] init];
    lablePeopleNum.text = @"志愿者";
    lablePeopleNum.font = [UIFont systemFontOfSize:16];
    [self addSubview:lablePeopleNum];
    [lablePeopleNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(WIDTH*0.52);
        make.top.equalTo(self).with.offset(HEIGHT*0.05);
        make.width.mas_equalTo(WIDTH*0.15);
        make.height.mas_equalTo(HEIGHT*0.03);
        
    }];
    //lablePeopleNum.backgroundColor = [UIColor redColor];
    
    //搜索button。二维码button，消息button
    UIButton* searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [searchButton setImage:[UIImage imageNamed:@"sousuo"] forState:UIControlStateNormal];
    [self addSubview:searchButton];
    [searchButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    searchButton.titleLabel.font = [UIFont boldSystemFontOfSize:26];
    [searchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(WIDTH*0.65);
        make.top.equalTo(self).with.offset(HEIGHT* 0.04);
        make.width.mas_equalTo(WIDTH*0.08);
        make.height.mas_equalTo(WIDTH*0.08);
        
    }];
    [searchButton addTarget:self action:@selector(pressSearchButton:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton* scanButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [scanButton setImage:[UIImage imageNamed:@"saomiao"] forState:UIControlStateNormal];
    [self addSubview:scanButton];
    [scanButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    scanButton.titleLabel.font = [UIFont boldSystemFontOfSize:26];
    [scanButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(WIDTH*0.75);
        make.top.equalTo(self).with.offset(HEIGHT* 0.04);
        make.width.mas_equalTo(WIDTH*0.08);
        make.height.mas_equalTo(WIDTH*0.08);
        
    }];
    [scanButton addTarget:self action:@selector(pressScanhButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton* newsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [newsButton setImage:[UIImage imageNamed:@"xiaoxi"] forState:UIControlStateNormal];
    [self addSubview:newsButton];
    [newsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    newsButton.titleLabel.font = [UIFont boldSystemFontOfSize:26];
    [newsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(WIDTH*0.85);
        make.top.equalTo(self).with.offset(HEIGHT* 0.04);
        make.width.mas_equalTo(WIDTH*0.08);
        make.height.mas_equalTo(WIDTH*0.08);
        
    }];
    [newsButton addTarget:self action:@selector(pressNewsButton:) forControlEvents:UIControlEventTouchUpInside];
    
    
}
- (void)pressLoactionButton:(UIButton*)buttonLocation{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pressLocationButton" object:nil];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
