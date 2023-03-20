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
    
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"pressSaysButton" object:nil];
    self.backgroundColor = [UIColor colorWithRed:48.0/255 green:200.0/255 blue:149.0/255 alpha:1];
    [self initScrollActivity];
    [self initScrollBack];
    //[self initScrollerButton];
    [self initCollctionView];
    
    //地区选择
    self.locationButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.locationButton setTitle:@"杭州市" forState:UIControlStateNormal];
    [self.scrollBack addSubview:self.locationButton];
    [self.locationButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.locationButton.titleLabel.font = [UIFont boldSystemFontOfSize:26];
    [self.locationButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(0);
        make.top.equalTo(self).with.offset(34);
        make.width.mas_equalTo(WIDTH*0.3);
        make.height.mas_equalTo(HEIGHT*0.05);
        
    }];
    [self.locationButton addTarget:self action:@selector(pressLoactionButton:) forControlEvents:UIControlEventTouchUpInside];
    //locationButton.backgroundColor = [UIColor yellowColor];
    
    //志愿者人数标签
    UILabel* lablePeople = [[UILabel alloc] init];
    lablePeople.text = @"1,101,708";
    lablePeople.font = [UIFont systemFontOfSize:26];
    [self.scrollBack addSubview:lablePeople];
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
    [self.scrollBack addSubview:lablePeopleNum];
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
    [self.scrollBack addSubview:searchButton];
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
    [self.scrollBack addSubview:scanButton];
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
    [self.scrollBack addSubview:newsButton];
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
    self.textFieldItem.frame = CGRectMake(70, HEIGHT*0.05, WIDTH - 80 - HEIGHT*0.05, HEIGHT*0.05);
    self.textFieldItem.backgroundColor = [UIColor colorWithRed:240.0/255 green:240.0/255 blue:240.0/255 alpha:0.6];
    self.textFieldItem.text = @"志愿汇";
    [self.scrollBack addSubview:self.textFieldItem];
    
    
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
    labelDataOne.frame = CGRectMake(30, HEIGHT*0.05, 40, HEIGHT*0.025);
    labelDataOne.backgroundColor = [UIColor whiteColor];
    labelDataOne.text = dateStr;
    [self.scrollBack addSubview:labelDataOne];
    labelDataOne.backgroundColor = [UIColor colorWithRed:240.0/255 green:240.0/255 blue:240.0/255 alpha:0.6];
    
    UILabel* labelDataTwo = [[UILabel alloc] init];
    labelDataTwo.frame = CGRectMake(30, HEIGHT*0.075, 40, HEIGHT*0.025);
    labelDataTwo.backgroundColor = [UIColor whiteColor];
    labelDataTwo.text = [NSString stringWithFormat:@"%@月", dateStrTwo];
    [self.scrollBack addSubview:labelDataTwo];
    labelDataTwo.backgroundColor = [UIColor colorWithRed:240.0/255 green:240.0/255 blue:240.0/255 alpha:0.6];
    
    
    UIButton* buttonMore = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonMore.frame = CGRectMake(WIDTH - 25 - HEIGHT*0.05, HEIGHT*0.1, HEIGHT*0.05, HEIGHT*0.05);
    buttonMore.backgroundColor = [UIColor whiteColor];
    [buttonMore setImage:[UIImage imageNamed:@"liebiao"] forState:UIControlStateNormal];
    [self.scrollBack addSubview:buttonMore];
    buttonMore.backgroundColor = [UIColor colorWithRed:240.0/255 green:240.0/255 blue:240.0/255 alpha:0.6];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addLocationText:) name:@"postLocationtext" object:nil];


    
    [self addButton];
}
- (void)addLocationText:(NSNotification*)sender{
    [self.locationButton removeFromSuperview];
    
    self.locationButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.locationButton setTitle:sender.userInfo[@"111"] forState:UIControlStateNormal];
    [self.scrollBack addSubview:self.locationButton];
    [self.locationButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.locationButton.titleLabel.font = [UIFont boldSystemFontOfSize:26];
    [self.locationButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(0);
        make.top.equalTo(self).with.offset(34);
        make.width.mas_equalTo(WIDTH*0.3);
        make.height.mas_equalTo(HEIGHT*0.05);
        
    }];
    [self.locationButton addTarget:self action:@selector(pressLoactionButton:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"postLocationtext" object:nil];
}
- (void)addButton{
    UIButton* buttonSearch = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.scrollBack addSubview:buttonSearch];
    [buttonSearch setImage:[UIImage imageNamed:@"chazhao-"] forState:UIControlStateNormal];
    [buttonSearch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.textFieldItem).with.offset(-50);
        make.top.equalTo(self.textFieldItem).with.offset(60);
        make.width.mas_equalTo(HEIGHT*0.07);
        make.height.mas_equalTo(HEIGHT*0.07);
    }];
    buttonSearch.layer.cornerRadius = HEIGHT*0.01;
    buttonSearch.layer.masksToBounds = YES;
    buttonSearch.backgroundColor = [UIColor colorWithRed:95.0/255 green:198.0/255 blue:167.0/255 alpha:0.4];
    UILabel* labelsearch = [[UILabel alloc] init];
    labelsearch.text = @"找活动";
    [self.scrollBack addSubview:labelsearch];
    [labelsearch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonSearch).with.offset(8);
        make.top.equalTo(buttonSearch).with.offset(HEIGHT*0.07);
        make.width.mas_equalTo(HEIGHT*0.1);
        make.height.mas_equalTo(HEIGHT*0.05);
    }];
    
    UIButton* buttonSays = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.scrollBack addSubview:buttonSays];
    [buttonSays setImage:[UIImage imageNamed:@"shequpinglun"] forState:UIControlStateNormal];
    [buttonSays mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(labelsearch).with.offset(0);
        make.top.equalTo(self.textFieldItem).with.offset(HEIGHT*0.2);
        make.width.mas_equalTo(HEIGHT*0.07);
        make.height.mas_equalTo(HEIGHT*0.07);
    }];
    [buttonSays addTarget:self action:@selector(pressSays) forControlEvents:UIControlEventTouchUpInside];
    UILabel* labelSays = [[UILabel alloc] init];
    labelSays.text = @"精选名句";
    [self.scrollBack addSubview:labelSays];
    [labelSays mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonSays).with.offset(0);
        make.top.equalTo(buttonSays).with.offset(HEIGHT*0.07);
        make.width.mas_equalTo(HEIGHT*0.1);
        make.height.mas_equalTo(HEIGHT*0.05);
    }];
    
    
    
    
    UIButton* buttonOrg = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.scrollBack addSubview:buttonOrg];
    [buttonOrg setImage:[UIImage imageNamed:@"qizhi"] forState:UIControlStateNormal];
    [buttonOrg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonSearch).with.offset((WIDTH - 40 - HEIGHT*0.07*4)/3  + HEIGHT*0.07);
        make.top.equalTo(self.textFieldItem).with.offset(60);
        make.width.mas_equalTo(HEIGHT*0.07);
        make.height.mas_equalTo(HEIGHT*0.07);
    }];
    buttonOrg.backgroundColor = [UIColor colorWithRed:103.0/255 green:152.0/255 blue:239.0/255 alpha:0.4];
    UILabel* labelOrg = [[UILabel alloc] init];
    labelOrg.text = @"找组织";
    buttonOrg.layer.cornerRadius = HEIGHT*0.01;
    buttonOrg.layer.masksToBounds = YES;
    [self.scrollBack addSubview:labelOrg];
    [labelOrg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonOrg).with.offset(8);
        make.top.equalTo(buttonOrg).with.offset(HEIGHT*0.07);
        make.width.mas_equalTo(HEIGHT*0.1);
        make.height.mas_equalTo(HEIGHT*0.05);
    }];
    
    
    
    
    UIButton* buttonTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.scrollBack addSubview:buttonTwo];
    [buttonTwo setImage:[UIImage imageNamed:@"ershisijieqi"] forState:UIControlStateNormal];
    [buttonTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(labelOrg).with.offset(0);
        make.top.equalTo(self.textFieldItem).with.offset(HEIGHT*0.2);
        make.width.mas_equalTo(HEIGHT*0.07);
        make.height.mas_equalTo(HEIGHT*0.07);
    }];
    [buttonTwo addTarget:self action:@selector(pressErshisi) forControlEvents:UIControlEventTouchUpInside];
    UILabel* labelTwo = [[UILabel alloc] init];
    labelTwo.text = @"今日快讯";
    [self.scrollBack addSubview:labelTwo];
    labelTwo.textAlignment = NSTextAlignmentCenter;
    [labelTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonTwo).with.offset(-10);
        make.top.equalTo(buttonTwo).with.offset(HEIGHT*0.07);
        make.width.mas_equalTo(HEIGHT*0.1);
        make.height.mas_equalTo(HEIGHT*0.05);
    }];
    
    UIButton* buttonBenefit = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.scrollBack addSubview:buttonBenefit];
    [buttonBenefit setImage:[UIImage imageNamed:@"gongyi"] forState:UIControlStateNormal];
    [buttonBenefit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonOrg).with.offset((WIDTH - 40 - HEIGHT*0.07*4)/3  + HEIGHT*0.07);
        make.top.equalTo(self.textFieldItem).with.offset(60);
        make.width.mas_equalTo(HEIGHT*0.07);
        make.height.mas_equalTo(HEIGHT*0.07);
    }];
    buttonBenefit.backgroundColor = [UIColor colorWithRed:239.0/255 green:181.0/255 blue:64.0/255 alpha:0.4];
    UILabel* labelBenefit = [[UILabel alloc] init];
    labelBenefit.text = @"身边公益";
    buttonBenefit.layer.cornerRadius = HEIGHT*0.01;
    buttonBenefit.layer.masksToBounds = YES;
    [self.scrollBack addSubview:labelBenefit];
    [labelBenefit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonBenefit).with.offset(0);
        make.top.equalTo(buttonBenefit).with.offset(HEIGHT*0.07);
        make.width.mas_equalTo(HEIGHT*0.1);
        make.height.mas_equalTo(HEIGHT*0.05);
    }];
    
    
    
    UIButton* buttonThree = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.scrollBack addSubview:buttonThree];
    [buttonThree setImage:[UIImage imageNamed:@"lishi"] forState:UIControlStateNormal];
    [buttonThree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(labelBenefit).with.offset(0);
        make.top.equalTo(self.textFieldItem).with.offset(HEIGHT*0.2);
        make.width.mas_equalTo(HEIGHT*0.07);
        make.height.mas_equalTo(HEIGHT*0.07);
    }];
    [buttonThree addTarget:self action:@selector(pressHistory) forControlEvents:UIControlEventTouchUpInside];
    UILabel* labelThree = [[UILabel alloc] init];
    labelThree.text = @"历史今日";
    [self.scrollBack addSubview:labelThree];
    [labelThree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonThree).with.offset(0);
        make.top.equalTo(buttonThree).with.offset(HEIGHT*0.07);
        make.width.mas_equalTo(HEIGHT*0.1);
        make.height.mas_equalTo(HEIGHT*0.05);
    }];
    
    
    
    UIButton* buttonFriends = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.scrollBack addSubview:buttonFriends];
    [buttonFriends setImage:[UIImage imageNamed:@"yaoqing"] forState:UIControlStateNormal];
    [buttonFriends mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonBenefit).with.offset((WIDTH - 40 - HEIGHT*0.07*4)/3  + HEIGHT*0.07);
        make.top.equalTo(self.textFieldItem).with.offset(60);
        make.width.mas_equalTo(HEIGHT*0.07);
        make.height.mas_equalTo(HEIGHT*0.07);
    }];
    buttonFriends.backgroundColor = [UIColor colorWithRed:163.0/255 green:146.0/255 blue:241.0/255 alpha:0.4];
    UILabel* labelFriends = [[UILabel alloc] init];
    labelFriends.text = @"邀请朋友";
    buttonFriends.layer.cornerRadius = HEIGHT*0.01;
    buttonFriends.layer.masksToBounds = YES;
    [self.scrollBack addSubview:labelFriends];
    [labelFriends mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonFriends).with.offset(0);
        make.top.equalTo(buttonFriends).with.offset(HEIGHT*0.07);
        make.width.mas_equalTo(HEIGHT*0.1);
        make.height.mas_equalTo(HEIGHT*0.05);
    }];
    
    UIButton* buttonFour = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.scrollBack addSubview:buttonFour];
    [buttonFour setImage:[UIImage imageNamed:@"wenzhang"] forState:UIControlStateNormal];
    [buttonFour mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(labelFriends).with.offset(0);
        make.top.equalTo(self.textFieldItem).with.offset(HEIGHT*0.2);
        make.width.mas_equalTo(HEIGHT*0.07);
        make.height.mas_equalTo(HEIGHT*0.07);
    }];
    UILabel* labelFive = [[UILabel alloc] init];
    labelFive.text = @"精选美文";
    [self.scrollBack addSubview:labelFive];
    [labelFive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonFour).with.offset(0);
        make.top.equalTo(buttonFour).with.offset(HEIGHT*0.07);
        make.width.mas_equalTo(HEIGHT*0.1);
        make.height.mas_equalTo(HEIGHT*0.05);
    }];
    
    
    
    
    UILabel* labelGoodActivity = [[UILabel alloc] init];
    labelGoodActivity.text = @"精选活动";
    [self.scrollBack addSubview:labelGoodActivity];
    [labelGoodActivity mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(20);
        make.top.equalTo(labelFive).with.offset(HEIGHT*0.05);
        make.width.mas_equalTo(HEIGHT*0.12);
        make.height.mas_equalTo(HEIGHT*0.06);
    }];
    labelGoodActivity.backgroundColor = [UIColor colorWithRed:180.0/255 green:180.0/255 blue:180.0/255 alpha:0.85];
    labelGoodActivity.font = [UIFont systemFontOfSize:25];
    labelGoodActivity.textAlignment = NSTextAlignmentCenter;
    labelGoodActivity.layer.cornerRadius = 10;
    labelGoodActivity.layer.masksToBounds = YES;
}
- (void)pressErshisi {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pressErShiSIiButton" object:nil];
}
- (void)pressHistory {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pressHistoryButton" object:nil];
}
- (void)initScrollBack {
    self.scrollBack = [[UIScrollView  alloc] init];
    self.scrollBack.contentSize = CGSizeMake(WIDTH, HEIGHT*2.1);
    [self addSubview:self.scrollBack];
    self.scrollBack.backgroundColor = [UIColor clearColor];
    self.scrollBack.pagingEnabled = NO;
    self.scrollBack.scrollEnabled = YES;
    self.scrollBack.showsVerticalScrollIndicator = NO;
    self.scrollBack.showsHorizontalScrollIndicator = NO;
    [self.scrollBack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.scrollActivity).with.offset(0);
            make.top.equalTo(self.scrollActivity).with.offset(0);
            make.width.mas_equalTo(WIDTH);
            make.height.mas_equalTo(HEIGHT);
    }];
    [self addSubview:self.scrollBack];
}
- (void)pressSays {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pressSaysButton" object:nil];
}
- (void)initScrollActivity{
    self.scrollActivity = [[UIScrollView  alloc] init];
    self.scrollActivity.contentSize = CGSizeMake(WIDTH*3, 0);
    [self addSubview:self.scrollActivity];
    self.scrollActivity.showsVerticalScrollIndicator = NO;
    self.scrollActivity.showsHorizontalScrollIndicator = NO;
    self.scrollActivity.scrollEnabled = NO;
    self.scrollActivity.pagingEnabled = NO;
    [self.scrollActivity mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).with.offset(0);
            make.top.equalTo(self).with.offset(-50);
            make.width.mas_equalTo(WIDTH);
            make.height.mas_equalTo(HEIGHT);
    }];
    for(int i = 0; i < 3; i++){
            NSString* strName = [NSString stringWithFormat:@"Main%d.jpeg",i+1];
            UIImage* image = [UIImage imageNamed:strName];
            UIImageView* iView = [[UIImageView alloc]initWithImage:image];
            iView.frame = CGRectMake(WIDTH*i, 0, WIDTH, HEIGHT);
            [self.scrollActivity addSubview:iView];
        }
    NSTimer* timer = [[NSTimer alloc] init];
    timer = [NSTimer scheduledTimerWithTimeInterval:6 target:self selector:@selector(timer) userInfo:nil repeats:YES];
    //[self initCollctionView];
}
- (void)timer {
    int dir = self.scrollActivity.contentOffset.x/WIDTH;
    if(dir != 2){
        [self.scrollActivity setContentOffset:CGPointMake(WIDTH * (dir % 3 + 1), 0) animated:YES];
    } else {
        self.scrollActivity.contentOffset = CGPointMake(0, 0);
    }
}
- (void)initCollctionView {
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.flowLayout.itemSize = CGSizeMake(WIDTH/2 - 5, HEIGHT / 3 - 25);
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, HEIGHT*0.45, WIDTH, HEIGHT*3) collectionViewLayout:self.flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"111"];
    self.collectionView.backgroundColor = [UIColor clearColor];
    [self.scrollBack addSubview:self.collectionView];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}
- (UICollectionViewCell*)collectionView:(UICollectionView*)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"111" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:200.0/255 green:200.0/255 blue:200.0/255 alpha:0.85];
    if (indexPath.row == 0) {
        UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CollectionView1.jpeg"]];
        [cell addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(cell).with.offset(10);
            make.top.equalTo(cell).with.offset(10);
            make.width.mas_equalTo(WIDTH/2 - 30);
            make.height.mas_equalTo(WIDTH/2 - 30);
        }];
        UILabel* labelText = [[UILabel alloc] init];
        labelText.text = @"您的捐发申请已通过！这里是您的捐发步骤";
        [cell addSubview:labelText];
        labelText.font = [UIFont systemFontOfSize:19];
        labelText.numberOfLines = 3;
        [labelText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageView).with.offset(0);
            make.top.equalTo(imageView).with.offset(WIDTH/2 - 80);
            make.width.mas_equalTo(WIDTH/2 - 30);
            make.height.mas_equalTo(WIDTH/2 - 30);
        }];
    } else if (indexPath.row == 1) {
        UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CollectionView2.jpeg"]];
        [cell addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(cell).with.offset(10);
            make.top.equalTo(cell).with.offset(10);
            make.width.mas_equalTo(WIDTH/2 - 30);
            make.height.mas_equalTo(WIDTH/2 - 30);
        }];
        UILabel* labelText = [[UILabel alloc] init];
        labelText.text = @"助学、筑梦、铸人！贫困儿童资助活动";
        [cell addSubview:labelText];
        labelText.font = [UIFont systemFontOfSize:19];
        labelText.numberOfLines = 3;
        [labelText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageView).with.offset(0);
            make.top.equalTo(imageView).with.offset(WIDTH/2 - 80);
            make.width.mas_equalTo(WIDTH/2 - 30);
            make.height.mas_equalTo(WIDTH/2 - 30);
        }];
    } else if (indexPath.row == 2) {
        UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CollectionView9.jpeg"]];
        [cell addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(cell).with.offset(10);
            make.top.equalTo(cell).with.offset(10);
            make.width.mas_equalTo(WIDTH/2 - 30);
            make.height.mas_equalTo(WIDTH/2 - 30);
        }];
        UILabel* labelText = [[UILabel alloc] init];
        labelText.text = @"禁毒有你，绝不毒行！禁毒知识讲解会。";
        [cell addSubview:labelText];
        labelText.font = [UIFont systemFontOfSize:19];
        labelText.numberOfLines = 3;
        [labelText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageView).with.offset(0);
            make.top.equalTo(imageView).with.offset(WIDTH/2 - 80);
            make.width.mas_equalTo(WIDTH/2 - 30);
            make.height.mas_equalTo(WIDTH/2 - 30);
        }];
    } else if (indexPath.row == 3) {
        UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CollectionView4.jpeg"]];
        [cell addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(cell).with.offset(10);
            make.top.equalTo(cell).with.offset(10);
            make.width.mas_equalTo(WIDTH/2 - 30);
            make.height.mas_equalTo(WIDTH/2 - 30);
        }];
        UILabel* labelText = [[UILabel alloc] init];
        labelText.text = @"清岭行动，绿色小公民在行动！";
        [cell addSubview:labelText];
        labelText.font = [UIFont systemFontOfSize:19];
        labelText.numberOfLines = 3;
        [labelText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageView).with.offset(0);
            make.top.equalTo(imageView).with.offset(WIDTH/2 - 80);
            make.width.mas_equalTo(WIDTH/2 - 30);
            make.height.mas_equalTo(WIDTH/2 - 30);
        }];
    } else if (indexPath.row == 4) {
        UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CollectionView5.jpeg"]];
        [cell addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(cell).with.offset(10);
            make.top.equalTo(cell).with.offset(10);
            make.width.mas_equalTo(WIDTH/2 - 30);
            make.height.mas_equalTo(WIDTH/2 - 30);
        }];
        UILabel* labelText = [[UILabel alloc] init];
        labelText.text = @"尊老，爱老，敬老，助老。孤寡老人陪伴活动。";
        [cell addSubview:labelText];
        labelText.font = [UIFont systemFontOfSize:19];
        labelText.numberOfLines = 3;
        [labelText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageView).with.offset(0);
            make.top.equalTo(imageView).with.offset(WIDTH/2 - 80);
            make.width.mas_equalTo(WIDTH/2 - 30);
            make.height.mas_equalTo(WIDTH/2 - 30);
        }];
    } else if (indexPath.row == 5) {
        UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CollectionView7.jpeg"]];
        [cell addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(cell).with.offset(10);
            make.top.equalTo(cell).with.offset(10);
            make.width.mas_equalTo(WIDTH/2 - 30);
            make.height.mas_equalTo(WIDTH/2 - 30);
        }];
        UILabel* labelText = [[UILabel alloc] init];
        labelText.text = @"为你点灯，筑梦启航。山区支教志愿者招聘！";
        [cell addSubview:labelText];
        labelText.font = [UIFont systemFontOfSize:19];
        labelText.numberOfLines = 3;
        [labelText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageView).with.offset(0);
            make.top.equalTo(imageView).with.offset(WIDTH/2 - 80);
            make.width.mas_equalTo(WIDTH/2 - 30);
            make.height.mas_equalTo(WIDTH/2 - 30);
        }];
    } else if (indexPath.row == 6) {
        UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CollectionView6.jpeg"]];
        [cell addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(cell).with.offset(10);
            make.top.equalTo(cell).with.offset(10);
            make.width.mas_equalTo(WIDTH/2 - 30);
            make.height.mas_equalTo(WIDTH/2 - 30);
        }];
        UILabel* labelText = [[UILabel alloc] init];
        labelText.text = @"愿爱融化孤独。为自闭症儿童送温暖。";
        [cell addSubview:labelText];
        labelText.font = [UIFont systemFontOfSize:19];
        labelText.numberOfLines = 3;
        [labelText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageView).with.offset(0);
            make.top.equalTo(imageView).with.offset(WIDTH/2 - 80);
            make.width.mas_equalTo(WIDTH/2 - 30);
            make.height.mas_equalTo(WIDTH/2 - 30);
        }];
    } else if (indexPath.row == 7) {
        UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CollectionView3.jpeg"]];
        [cell addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(cell).with.offset(10);
            make.top.equalTo(cell).with.offset(10);
            make.width.mas_equalTo(WIDTH/2 - 30);
            make.height.mas_equalTo(WIDTH/2 - 30);
        }];
        UILabel* labelText = [[UILabel alloc] init];
        labelText.text = @"志愿者在行动！西安图书馆志愿者招聘！";
        [cell addSubview:labelText];
        labelText.font = [UIFont systemFontOfSize:19];
        labelText.numberOfLines = 3;
        [labelText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageView).with.offset(0);
            make.top.equalTo(imageView).with.offset(WIDTH/2 - 80);
            make.width.mas_equalTo(WIDTH/2 - 30);
            make.height.mas_equalTo(WIDTH/2 - 30);
        }];
    } else if (indexPath.row == 8) {
        UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CollectionView10.jpeg"]];
        [cell addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(cell).with.offset(10);
            make.top.equalTo(cell).with.offset(10);
            make.width.mas_equalTo(WIDTH/2 - 30);
            make.height.mas_equalTo(WIDTH/2 - 30);
        }];
        UILabel* labelText = [[UILabel alloc] init];
        labelText.text = @"时光正佳，好好爱她。母亲节送温暖活动";
        [cell addSubview:labelText];
        labelText.font = [UIFont systemFontOfSize:19];
        labelText.numberOfLines = 3;
        [labelText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageView).with.offset(0);
            make.top.equalTo(imageView).with.offset(WIDTH/2 - 80);
            make.width.mas_equalTo(WIDTH/2 - 30);
            make.height.mas_equalTo(WIDTH/2 - 30);
        }];
    } else if (indexPath.row == 9) {
        UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CollectionView8.jpeg"]];
        [cell addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(cell).with.offset(10);
            make.top.equalTo(cell).with.offset(10);
            make.width.mas_equalTo(WIDTH/2 - 30);
            make.height.mas_equalTo(WIDTH/2 - 30);
        }];
        UILabel* labelText = [[UILabel alloc] init];
        labelText.text = @"以爱防爱，健康平等。预防艾滋病知识宣讲。";
        [cell addSubview:labelText];
        labelText.font = [UIFont systemFontOfSize:19];
        labelText.numberOfLines = 3;
        [labelText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageView).with.offset(0);
            make.top.equalTo(imageView).with.offset(WIDTH/2 - 80);
            make.width.mas_equalTo(WIDTH/2 - 30);
            make.height.mas_equalTo(WIDTH/2 - 30);
        }];
    }
    return cell;
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
