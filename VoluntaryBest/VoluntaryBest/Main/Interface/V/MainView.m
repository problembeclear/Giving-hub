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
    [self initScrollActivity];
    
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
    [scanButton addTarget:self action:@selector(pressScanButton:) forControlEvents:UIControlEventTouchUpInside];
    
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
    
    
    self.textFieldItem = [[UITextField alloc] init];
    self.textFieldItem.frame = CGRectMake(70, HEIGHT*0.1, WIDTH - 80 - HEIGHT*0.05, HEIGHT*0.05);
    self.textFieldItem.backgroundColor = [UIColor whiteColor];
    self.textFieldItem.text = @"志愿汇";
    [self addSubview:self.textFieldItem];
    
    
    //时间获取。日期
    NSDate *dateOne = [NSDate date];
    NSDateFormatter *forMatter = [[NSDateFormatter alloc] init];
    [forMatter setDateFormat:@"dd"];
    NSString *dateStr = [forMatter stringFromDate:dateOne];
    
    //时间获取。月份
    NSDate *date =[NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MM"];
    NSString *dateStrTwo = [formatter stringFromDate:date];
    
    UILabel* labelDataOne = [[UILabel alloc] init];
    labelDataOne.frame = CGRectMake(30, HEIGHT*0.1, 40, HEIGHT*0.025);
    labelDataOne.backgroundColor = [UIColor whiteColor];
    labelDataOne.text = dateStr;
    [self addSubview:labelDataOne];
    
    UILabel* labelDataTwo = [[UILabel alloc] init];
    labelDataTwo.frame = CGRectMake(30, HEIGHT*0.125, 40, HEIGHT*0.025);
    labelDataTwo.backgroundColor = [UIColor whiteColor];
    labelDataTwo.text = [NSString stringWithFormat:@"%@月", dateStrTwo];
    [self addSubview:labelDataTwo];
    
    
    UIButton* buttonMore = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonMore.frame = CGRectMake(WIDTH - 25 - HEIGHT*0.05, HEIGHT*0.1, HEIGHT*0.05, HEIGHT*0.05);
    buttonMore.backgroundColor = [UIColor whiteColor];
    [buttonMore setImage:[UIImage imageNamed:@"liebiao.png"] forState:UIControlStateNormal];
    [self addSubview:buttonMore];
    
    [self addButton];
    
}
- (void)addButton{
    UIButton* buttonSearch = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:buttonSearch];
    [buttonSearch setImage:[UIImage imageNamed:@"chazhao-"] forState:UIControlStateNormal];
    [buttonSearch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.textFieldItem).with.offset(-50);
        make.top.equalTo(self.textFieldItem).with.offset(50);
        make.width.mas_equalTo(HEIGHT*0.07);
        make.height.mas_equalTo(HEIGHT*0.07);
    }];
    buttonSearch.backgroundColor = [UIColor colorWithRed:95.0/255 green:198.0/255 blue:167.0/255 alpha:1];
    UILabel* labelsearch = [[UILabel alloc] init];
    labelsearch.text = @"找活动";
    [self addSubview:labelsearch];
    [labelsearch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonSearch).with.offset(8);
        make.top.equalTo(buttonSearch).with.offset(HEIGHT*0.07);
        make.width.mas_equalTo(HEIGHT*0.1);
        make.height.mas_equalTo(HEIGHT*0.05);
    }];
    
    
    
    UIButton* buttonOrg = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:buttonOrg];
    [buttonOrg setImage:[UIImage imageNamed:@"qizhi"] forState:UIControlStateNormal];
    [buttonOrg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonSearch).with.offset((WIDTH - 40 - HEIGHT*0.07*4)/3  + HEIGHT*0.07);
        make.top.equalTo(self.textFieldItem).with.offset(50);
        make.width.mas_equalTo(HEIGHT*0.07);
        make.height.mas_equalTo(HEIGHT*0.07);
    }];
    buttonOrg.backgroundColor = [UIColor colorWithRed:103.0/255 green:152.0/255 blue:239.0/255 alpha:1];
    UILabel* labelOrg = [[UILabel alloc] init];
    labelOrg.text = @"找组织";
    [self addSubview:labelOrg];
    [labelOrg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonOrg).with.offset(8);
        make.top.equalTo(buttonOrg).with.offset(HEIGHT*0.07);
        make.width.mas_equalTo(HEIGHT*0.1);
        make.height.mas_equalTo(HEIGHT*0.05);
    }];
    
    UIButton* buttonBenefit = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:buttonBenefit];
    [buttonBenefit setImage:[UIImage imageNamed:@"gongyi"] forState:UIControlStateNormal];
    [buttonBenefit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonOrg).with.offset((WIDTH - 40 - HEIGHT*0.07*4)/3  + HEIGHT*0.07);
        make.top.equalTo(self.textFieldItem).with.offset(50);
        make.width.mas_equalTo(HEIGHT*0.07);
        make.height.mas_equalTo(HEIGHT*0.07);
    }];
    buttonBenefit.backgroundColor = [UIColor colorWithRed:239.0/255 green:181.0/255 blue:64.0/255 alpha:1];
    UILabel* labelBenefit = [[UILabel alloc] init];
    labelBenefit.text = @"身边公益";
    [self addSubview:labelBenefit];
    [labelBenefit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonBenefit).with.offset(0);
        make.top.equalTo(buttonBenefit).with.offset(HEIGHT*0.07);
        make.width.mas_equalTo(HEIGHT*0.1);
        make.height.mas_equalTo(HEIGHT*0.05);
    }];
    
    
    UIButton* buttonFriends = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:buttonFriends];
    [buttonFriends setImage:[UIImage imageNamed:@"yaoqing"] forState:UIControlStateNormal];
    [buttonFriends mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonBenefit).with.offset((WIDTH - 40 - HEIGHT*0.07*4)/3  + HEIGHT*0.07);
        make.top.equalTo(self.textFieldItem).with.offset(50);
        make.width.mas_equalTo(HEIGHT*0.07);
        make.height.mas_equalTo(HEIGHT*0.07);
    }];
    buttonFriends.backgroundColor = [UIColor colorWithRed:163.0/255 green:146.0/255 blue:241.0/255 alpha:1];
    UILabel* labelFriends = [[UILabel alloc] init];
    labelFriends.text = @"邀请朋友";
    [self addSubview:labelFriends];
    [labelFriends mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonFriends).with.offset(0);
        make.top.equalTo(buttonFriends).with.offset(HEIGHT*0.07);
        make.width.mas_equalTo(HEIGHT*0.1);
        make.height.mas_equalTo(HEIGHT*0.05);
    }];
}
- (void)initScrollActivity{
    self.scrollActivity = [[UIScrollView  alloc] init];
    self.scrollActivity.contentSize = CGSizeMake(WIDTH*3, HEIGHT);
    self.scrollActivity.backgroundColor = [UIColor redColor];
    [self addSubview:self.scrollActivity];
    self.scrollActivity.showsVerticalScrollIndicator = NO;
    self.scrollActivity.showsHorizontalScrollIndicator = NO;
    self.scrollActivity.scrollEnabled = NO;
    self.scrollActivity.pagingEnabled = NO;
    [self.scrollActivity mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).with.offset(0);
            make.top.equalTo(self).with.offset(0);
            make.width.mas_equalTo(WIDTH);
            make.height.mas_equalTo(HEIGHT);
    }];
    for(int i = 0; i < 3; i++){
            NSString* strName = [NSString stringWithFormat:@"%d.jpeg",i+1];
            UIImage* image = [UIImage imageNamed:strName];
            UIImageView* iView = [[UIImageView alloc]initWithImage:image];
            iView.frame = CGRectMake(WIDTH*i, 0, WIDTH, HEIGHT);
            [self.scrollActivity addSubview:iView];
        }
    NSTimer* timer = [[NSTimer alloc] init];
    timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timer) userInfo:nil repeats:YES];
    [self initScrollerButton];
}
- (void)timer {
    int dir = self.scrollActivity.contentOffset.x/WIDTH;
    if(dir != 2){
        [self.scrollActivity setContentOffset:CGPointMake(WIDTH * (dir % 3 + 1), 0) animated:NO];
    } else {
        self.scrollActivity.contentOffset = CGPointMake(0, 0);
    }
}
- (void)initScrollerButton{
    self.scrollButton = [[UIScrollView  alloc] init];
    self.scrollButton.contentSize = CGSizeMake(WIDTH*1.2, HEIGHT*0.2);
    self.scrollButton.backgroundColor = [UIColor clearColor];
    self.scrollButton.pagingEnabled = YES;
    self.scrollButton.scrollEnabled = YES;
    [self addSubview:self.scrollButton];
    self.scrollButton.showsVerticalScrollIndicator = NO;
    self.scrollButton.showsHorizontalScrollIndicator = NO;
    [self.scrollButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.scrollActivity).with.offset(0);
            make.top.equalTo(self.scrollActivity).with.offset(HEIGHT*0.4);
            make.width.mas_equalTo(WIDTH);
            make.height.mas_equalTo(HEIGHT*0.2);
    }];
    UIButton* buttonClass = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.scrollButton addSubview:buttonClass];
    [buttonClass setImage:[UIImage imageNamed:@"shipin"] forState:UIControlStateNormal];
    [buttonClass mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.scrollButton).with.offset((WIDTH-HEIGHT*0.05*4)/5);
        make.top.equalTo(self.scrollButton).with.offset(HEIGHT*0.02);
        make.width.mas_equalTo(HEIGHT*0.05);
        make.height.mas_equalTo(HEIGHT*0.05);
    }];
    UILabel* labelClass = [[UILabel alloc] init];
    labelClass.text = @"志愿学堂";
    [self.scrollButton addSubview:labelClass];
    [labelClass mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonClass).with.offset(-11);
        make.top.equalTo(buttonClass).with.offset(HEIGHT*0.04);
        make.width.mas_equalTo(HEIGHT*0.1);
        make.height.mas_equalTo(HEIGHT*0.05);
    }];
    
    
    UIButton* buttonLike = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.scrollButton addSubview:buttonLike];
    [buttonLike setImage:[UIImage imageNamed:@"gongyi-2"] forState:UIControlStateNormal];
    [buttonLike mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonClass).with.offset(-8);
        make.top.equalTo(buttonClass).with.offset(HEIGHT*0.09);
        make.width.mas_equalTo(HEIGHT*0.06);
        make.height.mas_equalTo(HEIGHT*0.06);
    }];
    UILabel* labelLike = [[UILabel alloc] init];
    labelLike.text = @"消费赞";
    [self.scrollButton addSubview:labelLike];
    [labelLike mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonLike).with.offset(0);
        make.top.equalTo(buttonLike).with.offset(HEIGHT*0.04);
        make.width.mas_equalTo(HEIGHT*0.1);
        make.height.mas_equalTo(HEIGHT*0.05);
    }];
    
    UIButton* buttonInsurance = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.scrollButton addSubview:buttonInsurance];
    [buttonInsurance setImage:[UIImage imageNamed:@"dunpai"] forState:UIControlStateNormal];
    [buttonInsurance mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonClass).with.offset(HEIGHT*0.05+(WIDTH-HEIGHT*0.05*4)/5);
        make.top.equalTo(self.scrollButton).with.offset(HEIGHT*0.02);
        make.width.mas_equalTo(HEIGHT*0.05);
        make.height.mas_equalTo(HEIGHT*0.05);
    }];
    UILabel* labelInsurance = [[UILabel alloc] init];
    labelInsurance.text = @"领保险";
    [self.scrollButton addSubview:labelInsurance];
    [labelInsurance mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonInsurance).with.offset(0);
        make.top.equalTo(buttonInsurance).with.offset(HEIGHT*0.04);
        make.width.mas_equalTo(HEIGHT*0.1);
        make.height.mas_equalTo(HEIGHT*0.05);
    }];
    
    UIButton* buttonBuy = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.scrollButton addSubview:buttonBuy];
    [buttonBuy setImage:[UIImage imageNamed:@"gouwulan"] forState:UIControlStateNormal];
    [buttonBuy mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonInsurance).with.offset(0);
        make.top.equalTo(buttonInsurance).with.offset(HEIGHT*0.1);
        make.width.mas_equalTo(HEIGHT*0.045);
        make.height.mas_equalTo(HEIGHT*0.045);
    }];
    UILabel* labelBuy = [[UILabel alloc] init];
    labelBuy.text = @"益起购";
    [self.scrollButton addSubview:labelBuy];
    [labelBuy mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonBuy).with.offset(-4);
        make.top.equalTo(buttonBuy).with.offset(HEIGHT*0.03);
        make.width.mas_equalTo(HEIGHT*0.1);
        make.height.mas_equalTo(HEIGHT*0.05);
    }];
    
    UIButton* buttonStar = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.scrollButton addSubview:buttonStar];
    [buttonStar setImage:[UIImage imageNamed:@"xingxing"] forState:UIControlStateNormal];
    [buttonStar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonInsurance).with.offset(HEIGHT*0.05+(WIDTH-HEIGHT*0.05*4)/5);
        make.top.equalTo(self.scrollButton).with.offset(HEIGHT*0.02);
        make.width.mas_equalTo(HEIGHT*0.05);
        make.height.mas_equalTo(HEIGHT*0.05);
    }];
    UILabel* labelStar = [[UILabel alloc] init];
    labelStar.text = @"公益繁星";
    [self.scrollButton addSubview:labelStar];
    [labelStar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonStar).with.offset(-11);
        make.top.equalTo(buttonStar).with.offset(HEIGHT*0.04);
        make.width.mas_equalTo(HEIGHT*0.1);
        make.height.mas_equalTo(HEIGHT*0.05);
    }];
    
    UIButton* buttonClasses = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.scrollButton addSubview:buttonClasses];
    [buttonClasses setImage:[UIImage imageNamed:@"ketang"] forState:UIControlStateNormal];
    [buttonClasses mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonStar).with.offset(-8);
        make.top.equalTo(buttonStar).with.offset(HEIGHT*0.09);
        make.width.mas_equalTo(HEIGHT*0.06);
        make.height.mas_equalTo(HEIGHT*0.06);
    }];
    UILabel* labelClasses = [[UILabel alloc] init];
    labelClasses.text = @"小课堂";
    [self.scrollButton addSubview:labelClasses];
    [labelClasses mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonClasses).with.offset(3);
        make.top.equalTo(buttonClasses).with.offset(HEIGHT*0.04);
        make.width.mas_equalTo(HEIGHT*0.1);
        make.height.mas_equalTo(HEIGHT*0.05);
    }];
    
    UIButton* buttonHome = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.scrollButton addSubview:buttonHome];
    [buttonHome setImage:[UIImage imageNamed:@"home"] forState:UIControlStateNormal];
    [buttonHome mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonStar).with.offset(HEIGHT*0.05+(WIDTH-HEIGHT*0.05*4)/5);
        make.top.equalTo(self.scrollButton).with.offset(HEIGHT*0.02);
        make.width.mas_equalTo(HEIGHT*0.05);
        make.height.mas_equalTo(HEIGHT*0.05);
    }];
    UILabel* labelHome = [[UILabel alloc] init];
    labelHome.text = @"幸福家园";
    [self.scrollButton addSubview:labelHome];
    [labelHome mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonHome).with.offset(-11);
        make.top.equalTo(buttonHome).with.offset(HEIGHT*0.04);
        make.width.mas_equalTo(HEIGHT*0.1);
        make.height.mas_equalTo(HEIGHT*0.05);
    }];
    
    
    
    UIButton* buttonLikes = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.scrollButton addSubview:buttonLikes];
    [buttonLikes setImage:[UIImage imageNamed:@"jiangbei"] forState:UIControlStateNormal];
    [buttonLikes mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonHome).with.offset(0);
        make.top.equalTo(buttonHome).with.offset(HEIGHT*0.1);
        make.width.mas_equalTo(HEIGHT*0.04);
        make.height.mas_equalTo(HEIGHT*0.04);
    }];
    UILabel* labelLikes = [[UILabel alloc] init];
    labelLikes.text = @"爱心榜";
    [self.scrollButton addSubview:labelLikes];
    [labelLikes mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonLikes).with.offset(-4);
        make.top.equalTo(buttonLikes).with.offset(HEIGHT*0.03);
        make.width.mas_equalTo(HEIGHT*0.1);
        make.height.mas_equalTo(HEIGHT*0.05);
    }];
    
    
    
    UIButton* buttonFlower = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.scrollButton addSubview:buttonFlower];
    [buttonFlower setImage:[UIImage imageNamed:@"meigui"] forState:UIControlStateNormal];
    [buttonFlower mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonHome).with.offset(HEIGHT*0.05+(WIDTH-HEIGHT*0.05*4)/5);
        make.top.equalTo(self.scrollButton).with.offset(HEIGHT*0.02);
        make.width.mas_equalTo(HEIGHT*0.05);
        make.height.mas_equalTo(HEIGHT*0.05);
    }];
    UILabel* labelFlowers = [[UILabel alloc] init];
    labelFlowers.text = @"信用分";
    [self.scrollButton addSubview:labelFlowers];
    [labelFlowers mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonFlower).with.offset(0);
        make.top.equalTo(buttonFlower).with.offset(HEIGHT*0.04);
        make.width.mas_equalTo(HEIGHT*0.1);
        make.height.mas_equalTo(HEIGHT*0.05);
    }];
    
    
    
    UIButton* buttonCat = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.scrollButton addSubview:buttonCat];
    [buttonCat setImage:[UIImage imageNamed:@"maomi"] forState:UIControlStateNormal];
    [buttonCat mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonFlower).with.offset(0);
        make.top.equalTo(buttonFlower).with.offset(HEIGHT*0.09);
        make.width.mas_equalTo(HEIGHT*0.05);
        make.height.mas_equalTo(HEIGHT*0.05);
    }];
    UILabel* labelCat = [[UILabel alloc] init];
    labelCat.text = @"低碳公益";
    [self.scrollButton addSubview:labelCat];
    [labelCat mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonCat).with.offset(-11);
        make.top.equalTo(buttonCat).with.offset(HEIGHT*0.04);
        make.width.mas_equalTo(HEIGHT*0.1);
        make.height.mas_equalTo(HEIGHT*0.05);
    }];
//    UIButton* buttonHome = [UIButton buttonWithType:UIButtonTypeCustom];
//    [self addSubview:buttonHome];
//    [buttonHome setImage:[UIImage imageNamed:@"home"] forState:UIControlStateNormal];
//    [buttonHome mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.scrollButton).with.offset((WIDTH-HEIGHT*0.05*1)/5*4);
//        make.top.equalTo(self.scrollButton).with.offset(HEIGHT*0.02);
//        make.width.mas_equalTo(HEIGHT*0.05);
//        make.height.mas_equalTo(HEIGHT*0.05);
//    }];
    
}
- (void)pressLoactionButton:(UIButton*)buttonLocation{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pressLocationButton" object:nil];
}
- (void)pressSearchButton: (UIButton*)buttonSearch{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pressSearchButton" object:nil];
}
- (void)pressScanButton: (UIButton*)buttonScan{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pressScanButton" object:nil];
}
- (void)pressNewsButton:(UIButton*)buttonNews{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pressNewsButton" object:nil];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
