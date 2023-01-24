//
//  LocationView.m
//  VoluntaryBest
//
//  Created by 王璐 on 2023/1/23.
//

#import "LocationView.h"
#import "Masonry.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@implementation LocationView
- (void) initView {
    self.backgroundColor = [UIColor whiteColor];
    
    UIButton* buttonReturnMain = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonReturnMain setTitle:@"<" forState:UIControlStateNormal];
    [self addSubview:buttonReturnMain];
    buttonReturnMain.titleLabel.font = [UIFont systemFontOfSize:50];
    [buttonReturnMain setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonReturnMain mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(0);
        make.top.equalTo(self).with.offset(34);
        make.width.mas_equalTo(WIDTH*0.1);
        make.height.mas_equalTo(HEIGHT*0.03);
        
    }];
    [buttonReturnMain addTarget:self action:@selector(returnMian) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel* labelLocation = [[UILabel alloc] init];
    [self addSubview:labelLocation];
    labelLocation.text = @"地区选择";
    labelLocation.font = [UIFont systemFontOfSize:30];
    labelLocation.textAlignment = NSTextAlignmentCenter;
    [labelLocation mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonReturnMain).with.offset(WIDTH*0.1);
        make.top.equalTo(buttonReturnMain).with.offset(HEIGHT*0.01);
        make.width.mas_equalTo(WIDTH*0.8);
        make.height.mas_equalTo(HEIGHT*0.03);
    }];
    
    
    self.searchTextField = [[UITextField alloc] init];
    [self addSubview:self.searchTextField];
    [self.searchTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonReturnMain).with.offset(0);
        make.top.equalTo(buttonReturnMain).with.offset(HEIGHT*0.05);
        make.width.mas_equalTo(WIDTH);
        make.height.mas_equalTo(HEIGHT*0.05);
    }];
    self.searchTextField.text = @"🔍搜索附近位置";
    self.searchTextField.textAlignment = NSTextAlignmentCenter;
    self.searchTextField.backgroundColor = [UIColor colorWithRed:200.0/255 green:200.0/255 blue:200.0/255 alpha:1];
    
    
    
    
    self.cityArray = [[NSMutableArray alloc] init];
    self.cityArray = [NSMutableArray arrayWithObjects:@"推荐", @"北京", @"上海", @"天津", @"重庆", @"河北", @"山西", @"内蒙古", @"辽宁", @"吉林", @"黑龙江", @"江苏", @"浙江", @"安徽", @"福建", @"江西", @"山东", @"河南", @"湖北", @"广东", @"广西", @"海南", @"四川", @"贵州", @"云南", @"西藏", @"陕西", @"甘肃", @"青海", @"宁夏", @"新疆", @"建设兵团", @"台湾", @"香港", @"澳门",  nil];
    
    
    
    [self initCityScrollView];
    [self initExactScrollView];
    
}
- (void) initCityScrollView {
    self.cityScrollView = [[UIScrollView  alloc] init];
    self.cityScrollView.contentSize = CGSizeMake(WIDTH*0.3, HEIGHT*0.05*(self.cityArray.count + 2));
    [self addSubview:self.cityScrollView];
    self.cityScrollView.scrollEnabled = YES;
    self.cityScrollView.pagingEnabled = YES;
    [self.cityScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.searchTextField).with.offset(0);
            make.top.equalTo(self.searchTextField).with.offset(HEIGHT*0.05);
            make.width.mas_equalTo(WIDTH*0.3);
            make.height.mas_equalTo(HEIGHT);
    }];
    self.cityScrollView.backgroundColor = [UIColor colorWithRed:216.0/255 green:216.0/255 blue:216.0/255 alpha:0.8];

    for (int i = 0; i < self.cityArray.count ; i++) {
        UIButton* buttonCity = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.cityScrollView addSubview:buttonCity];
        [buttonCity setTitle:self.cityArray[i] forState:UIControlStateNormal];
        [buttonCity setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [buttonCity mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.cityScrollView).with.offset(0);
            make.top.equalTo(self.cityScrollView).with.offset(HEIGHT*0.05*i);
            make.width.mas_equalTo(WIDTH*0.3);
            make.height.mas_equalTo(HEIGHT*0.05);
        }];
    }
}
- (void) initExactScrollView {
    self.exactScrollView = [[UIScrollView  alloc] init];
    self.exactScrollView.contentSize = CGSizeMake(WIDTH*0.7, HEIGHT);
    [self addSubview:self.exactScrollView];
    self.exactScrollView.scrollEnabled = YES;
    self.exactScrollView.pagingEnabled = YES;
    [self.exactScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.searchTextField).with.offset(WIDTH*0.3);
            make.top.equalTo(self.searchTextField).with.offset(HEIGHT*0.05);
            make.width.mas_equalTo(WIDTH*0.7);
            make.height.mas_equalTo(HEIGHT);
    }];
    
    
    
    
    UILabel* labelNow = [[UILabel alloc] init];
    [self.exactScrollView addSubview:labelNow];
    [labelNow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.exactScrollView).with.offset(WIDTH*0.05);
            make.top.equalTo(self.exactScrollView).with.offset(0);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.05);
    }];
    labelNow.textColor = [UIColor grayColor];
    labelNow.text = @"当前定位";
    
    
    UIImageView* imageViewLocation = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dingwei"]];
    [self.exactScrollView addSubview:imageViewLocation];
    [imageViewLocation mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(labelNow).with.offset(0);
        make.top.equalTo(labelNow).with.offset(HEIGHT*0.05);
        make.width.mas_equalTo(WIDTH*0.08);
        make.height.mas_equalTo(WIDTH*0.08);
    }];
    
    
    
    UILabel* location = [[UILabel alloc] init];
    [self.exactScrollView addSubview:location];
    [location mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageViewLocation).with.offset(WIDTH*0.1);
            make.top.equalTo(labelNow).with.offset(HEIGHT*0.045);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.05);
    }];
    location.text = @"西安市";
    location.font = [UIFont systemFontOfSize:25];
    
    
    
    
    UILabel* lableGPS = [[UILabel alloc] init];
    [self.exactScrollView addSubview:lableGPS];
    [lableGPS mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(location).with.offset(WIDTH*0.2 - 5);
            make.top.equalTo(location).with.offset(4);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.05);
    }];
    lableGPS.text = @"GPS定位";
    lableGPS.textColor = [UIColor grayColor];
    
    
    
    UILabel* labelLine = [[UILabel alloc] init];
    [self.exactScrollView addSubview:labelLine];
    labelLine.backgroundColor = [UIColor grayColor];
    [labelLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageViewLocation).with.offset(0);
        make.top.equalTo(imageViewLocation).with.offset(WIDTH*0.1);
        make.width.mas_equalTo(WIDTH*0.6);
        make.height.mas_equalTo(1);
    }];
    
    
    
    UILabel* labelRecently = [[UILabel alloc] init];
    [self.exactScrollView addSubview:labelRecently];
    [labelRecently mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageViewLocation).with.offset(0);
            make.top.equalTo(imageViewLocation).with.offset(WIDTH*0.1);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.05);
    }];
    labelRecently.textColor = [UIColor grayColor];
    labelRecently.text = @"最近访问";
    
    
    UIButton* buttonRecently = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonRecently];
    [buttonRecently mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(labelRecently).with.offset(0);
            make.top.equalTo(labelRecently).with.offset(HEIGHT*0.05);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonRecently.layer.cornerRadius = HEIGHT*0.01;
    buttonRecently.layer.masksToBounds = YES;
    buttonRecently.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonRecently.layer.borderWidth = 1;
    [buttonRecently setTitle:@"西安市" forState:UIControlStateNormal];
    [buttonRecently setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    
    UILabel* labelHot = [[UILabel alloc] init];
    [self.exactScrollView addSubview:labelHot];
    [labelHot mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonRecently).with.offset(0);
            make.top.equalTo(buttonRecently).with.offset(WIDTH*0.1);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.05);
    }];
    labelHot.textColor = [UIColor grayColor];
    labelHot.text = @"热门地区";
    
    
    UIButton* buttonHotOne = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonHotOne];
    [buttonHotOne mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(labelHot).with.offset(0);
            make.top.equalTo(labelHot).with.offset(HEIGHT*0.05);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonHotOne.layer.cornerRadius = HEIGHT*0.01;
    buttonHotOne.layer.masksToBounds = YES;
    buttonHotOne.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonHotOne.layer.borderWidth = 1;
    [buttonHotOne setTitle:@"杭州市" forState:UIControlStateNormal];
    [buttonHotOne setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    
    UIButton* buttonHotTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonHotTwo];
    [buttonHotTwo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonHotOne).with.offset(WIDTH*0.21);
            make.top.equalTo(buttonHotOne).with.offset(0);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonHotTwo.layer.cornerRadius = HEIGHT*0.01;
    buttonHotTwo.layer.masksToBounds = YES;
    buttonHotTwo.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonHotTwo.layer.borderWidth = 1;
    [buttonHotTwo setTitle:@"上海市" forState:UIControlStateNormal];
    [buttonHotTwo setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIButton* buttonHotThree = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonHotThree];
    [buttonHotThree mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonHotTwo).with.offset(WIDTH*0.21);
            make.top.equalTo(buttonHotTwo).with.offset(0);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonHotThree.layer.cornerRadius = HEIGHT*0.01;
    buttonHotThree.layer.masksToBounds = YES;
    buttonHotThree.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonHotThree.layer.borderWidth = 1;
    [buttonHotThree setTitle:@"北京市" forState:UIControlStateNormal];
    [buttonHotThree setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    
    UIButton* buttonHotFour = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonHotFour];
    [buttonHotFour mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonHotOne).with.offset(0);
            make.top.equalTo(buttonHotOne).with.offset(HEIGHT*0.04);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonHotFour.layer.cornerRadius = HEIGHT*0.01;
    buttonHotFour.layer.masksToBounds = YES;
    buttonHotFour.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonHotFour.layer.borderWidth = 1;
    [buttonHotFour setTitle:@"武汉市" forState:UIControlStateNormal];
    [buttonHotFour setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    
    UIButton* buttonHotFive = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonHotFive];
    [buttonHotFive mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonHotFour).with.offset(WIDTH*0.21);
            make.top.equalTo(buttonHotFour).with.offset(0);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonHotFive.layer.cornerRadius = HEIGHT*0.01;
    buttonHotFive.layer.masksToBounds = YES;
    buttonHotFive.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonHotFive.layer.borderWidth = 1;
    [buttonHotFive setTitle:@"天津市" forState:UIControlStateNormal];
    [buttonHotFive setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIButton* buttonXian = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonXian];
    [buttonXian mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonHotFive).with.offset(WIDTH*0.21);
            make.top.equalTo(buttonHotFive).with.offset(0);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonXian.layer.cornerRadius = HEIGHT*0.01;
    buttonXian.layer.masksToBounds = YES;
    buttonXian.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonXian.layer.borderWidth = 1;
    [buttonXian setTitle:@"西安市" forState:UIControlStateNormal];
    [buttonXian setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    UIButton* buttonShijiazhuang = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonShijiazhuang];
    [buttonShijiazhuang mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonHotFour).with.offset(0);
            make.top.equalTo(buttonHotFour).with.offset(HEIGHT*0.04);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonShijiazhuang.layer.cornerRadius = HEIGHT*0.01;
    buttonShijiazhuang.layer.masksToBounds = YES;
    buttonShijiazhuang.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonShijiazhuang.layer.borderWidth = 1;
    [buttonShijiazhuang setTitle:@"石家庄市" forState:UIControlStateNormal];
    [buttonShijiazhuang setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    
    UIButton* buttonLanzhou = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonLanzhou];
    [buttonLanzhou mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonShijiazhuang).with.offset(WIDTH*0.21);
            make.top.equalTo(buttonShijiazhuang).with.offset(0);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonLanzhou.layer.cornerRadius = HEIGHT*0.01;
    buttonLanzhou.layer.masksToBounds = YES;
    buttonLanzhou.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonLanzhou.layer.borderWidth = 1;
    [buttonLanzhou setTitle:@"兰州市" forState:UIControlStateNormal];
    [buttonLanzhou setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIButton* buttonHefei = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonHefei];
    [buttonHefei mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonLanzhou).with.offset(WIDTH*0.21);
            make.top.equalTo(buttonLanzhou).with.offset(0);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonHefei.layer.cornerRadius = HEIGHT*0.01;
    buttonHefei.layer.masksToBounds = YES;
    buttonHefei.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonHefei.layer.borderWidth = 1;
    [buttonHefei setTitle:@"合肥市" forState:UIControlStateNormal];
    [buttonHefei setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    UIButton* buttonHaikou = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonHaikou];
    [buttonHaikou mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonShijiazhuang).with.offset(0);
            make.top.equalTo(buttonShijiazhuang).with.offset(HEIGHT*0.04);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonHaikou.layer.cornerRadius = HEIGHT*0.01;
    buttonHaikou.layer.masksToBounds = YES;
    buttonHaikou.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonHaikou.layer.borderWidth = 1;
    [buttonHaikou setTitle:@"海口市" forState:UIControlStateNormal];
    [buttonHaikou setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    
    UIButton* buttonChengdu = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonChengdu];
    [buttonChengdu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonHaikou).with.offset(WIDTH*0.21);
            make.top.equalTo(buttonHaikou).with.offset(0);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonChengdu.layer.cornerRadius = HEIGHT*0.01;
    buttonChengdu.layer.masksToBounds = YES;
    buttonChengdu.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonChengdu.layer.borderWidth = 1;
    [buttonChengdu setTitle:@"成都市" forState:UIControlStateNormal];
    [buttonChengdu setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIButton* buttonJinan = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonJinan];
    [buttonJinan mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonChengdu).with.offset(WIDTH*0.21);
            make.top.equalTo(buttonChengdu).with.offset(0);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonJinan.layer.cornerRadius = HEIGHT*0.01;
    buttonJinan.layer.masksToBounds = YES;
    buttonJinan.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonJinan.layer.borderWidth = 1;
    [buttonJinan setTitle:@"济南市" forState:UIControlStateNormal];
    [buttonJinan setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    UIButton* buttonWulumuqi = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonWulumuqi];
    [buttonWulumuqi mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonHaikou).with.offset(0);
            make.top.equalTo(buttonHaikou).with.offset(HEIGHT*0.04);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonWulumuqi.layer.cornerRadius = HEIGHT*0.01;
    buttonWulumuqi.layer.masksToBounds = YES;
    buttonWulumuqi.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonWulumuqi.layer.borderWidth = 1;
    [buttonWulumuqi setTitle:@"乌鲁木齐" forState:UIControlStateNormal];
    [buttonWulumuqi setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    
    UIButton* buttonLasa = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonLasa];
    [buttonLasa mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonWulumuqi).with.offset(WIDTH*0.21);
            make.top.equalTo(buttonWulumuqi).with.offset(0);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonLasa.layer.cornerRadius = HEIGHT*0.01;
    buttonLasa.layer.masksToBounds = YES;
    buttonLasa.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonLasa.layer.borderWidth = 1;
    [buttonLasa setTitle:@"拉萨市" forState:UIControlStateNormal];
    [buttonLasa setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIButton* buttonZhengzhou = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonZhengzhou];
    [buttonZhengzhou mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonLasa).with.offset(WIDTH*0.21);
            make.top.equalTo(buttonLasa).with.offset(0);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonZhengzhou.layer.cornerRadius = HEIGHT*0.01;
    buttonZhengzhou.layer.masksToBounds = YES;
    buttonZhengzhou.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonZhengzhou.layer.borderWidth = 1;
    [buttonZhengzhou setTitle:@"郑州市" forState:UIControlStateNormal];
    [buttonZhengzhou setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    
    UIButton* buttonChangsha = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonChangsha];
    [buttonChangsha mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonWulumuqi).with.offset(0);
            make.top.equalTo(buttonWulumuqi).with.offset(HEIGHT*0.04);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonChangsha.layer.cornerRadius = HEIGHT*0.01;
    buttonChangsha.layer.masksToBounds = YES;
    buttonChangsha.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonChangsha.layer.borderWidth = 1;
    [buttonChangsha setTitle:@"长沙市" forState:UIControlStateNormal];
    [buttonChangsha setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    
    UIButton* buttonFuzhou = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonFuzhou];
    [buttonFuzhou mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonChangsha).with.offset(WIDTH*0.21);
            make.top.equalTo(buttonChangsha).with.offset(0);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonFuzhou.layer.cornerRadius = HEIGHT*0.01;
    buttonFuzhou.layer.masksToBounds = YES;
    buttonFuzhou.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonFuzhou.layer.borderWidth = 1;
    [buttonFuzhou setTitle:@"福州市" forState:UIControlStateNormal];
    [buttonFuzhou setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIButton* buttonShenyang = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonShenyang];
    [buttonShenyang mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonFuzhou).with.offset(WIDTH*0.21);
            make.top.equalTo(buttonFuzhou).with.offset(0);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonShenyang.layer.cornerRadius = HEIGHT*0.01;
    buttonShenyang.layer.masksToBounds = YES;
    buttonShenyang.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonShenyang.layer.borderWidth = 1;
    [buttonShenyang setTitle:@"沈阳市" forState:UIControlStateNormal];
    [buttonShenyang setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    
    UIButton* buttonTaiyuan = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonTaiyuan];
    [buttonTaiyuan mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonChangsha).with.offset(0);
            make.top.equalTo(buttonChangsha).with.offset(HEIGHT*0.04);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonTaiyuan.layer.cornerRadius = HEIGHT*0.01;
    buttonTaiyuan.layer.masksToBounds = YES;
    buttonTaiyuan.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonTaiyuan.layer.borderWidth = 1;
    [buttonTaiyuan setTitle:@"太原市" forState:UIControlStateNormal];
    [buttonTaiyuan setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    
    UIButton* buttonHuhehaote = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonHuhehaote];
    [buttonHuhehaote mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonTaiyuan).with.offset(WIDTH*0.21);
            make.top.equalTo(buttonTaiyuan).with.offset(0);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonHuhehaote.layer.cornerRadius = HEIGHT*0.01;
    buttonHuhehaote.layer.masksToBounds = YES;
    buttonHuhehaote.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonHuhehaote.layer.borderWidth = 1;
    [buttonHuhehaote setTitle:@"呼和浩特" forState:UIControlStateNormal];
    [buttonHuhehaote setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIButton* buttonYinchuan = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonYinchuan];
    [buttonYinchuan mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonHuhehaote).with.offset(WIDTH*0.21);
            make.top.equalTo(buttonHuhehaote).with.offset(0);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonYinchuan.layer.cornerRadius = HEIGHT*0.01;
    buttonYinchuan.layer.masksToBounds = YES;
    buttonYinchuan.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonYinchuan.layer.borderWidth = 1;
    [buttonYinchuan setTitle:@"银川市" forState:UIControlStateNormal];
    [buttonYinchuan setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    
    UIButton* buttonXining = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonXining];
    [buttonXining mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonTaiyuan).with.offset(0);
            make.top.equalTo(buttonTaiyuan).with.offset(HEIGHT*0.04);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonXining.layer.cornerRadius = HEIGHT*0.01;
    buttonXining.layer.masksToBounds = YES;
    buttonXining.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonXining.layer.borderWidth = 1;
    [buttonXining setTitle:@"西宁市" forState:UIControlStateNormal];
    [buttonXining setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    
    UIButton* buttonKunming = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonKunming];
    [buttonKunming mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonXining).with.offset(WIDTH*0.21);
            make.top.equalTo(buttonXining).with.offset(0);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonKunming.layer.cornerRadius = HEIGHT*0.01;
    buttonKunming.layer.masksToBounds = YES;
    buttonKunming.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonKunming.layer.borderWidth = 1;
    [buttonKunming setTitle:@"昆明市" forState:UIControlStateNormal];
    [buttonKunming setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    UIButton* buttonChangchun = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonChangchun];
    [buttonChangchun mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonKunming).with.offset(WIDTH*0.21);
            make.top.equalTo(buttonKunming).with.offset(0);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonChangchun.layer.cornerRadius = HEIGHT*0.01;
    buttonChangchun.layer.masksToBounds = YES;
    buttonChangchun.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonChangchun.layer.borderWidth = 1;
    [buttonChangchun setTitle:@"长春市" forState:UIControlStateNormal];
    [buttonChangchun setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];



    UIButton* buttonHaerbin = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonHaerbin];
    [buttonHaerbin mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonXining).with.offset(0);
            make.top.equalTo(buttonXining).with.offset(HEIGHT*0.04);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonHaerbin.layer.cornerRadius = HEIGHT*0.01;
    buttonHaerbin.layer.masksToBounds = YES;
    buttonHaerbin.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonHaerbin.layer.borderWidth = 1;
    [buttonHaerbin setTitle:@"哈尔滨市" forState:UIControlStateNormal];
    [buttonHaerbin setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];



    UIButton* buttonNanjing = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonNanjing];
    [buttonNanjing mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonHaerbin).with.offset(WIDTH*0.21);
            make.top.equalTo(buttonHaerbin).with.offset(0);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonNanjing.layer.cornerRadius = HEIGHT*0.01;
    buttonNanjing.layer.masksToBounds = YES;
    buttonNanjing.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonNanjing.layer.borderWidth = 1;
    [buttonNanjing setTitle:@"南京" forState:UIControlStateNormal];
    [buttonNanjing setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    UIButton* buttonNanning = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonNanning];
    [buttonNanning mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonNanjing).with.offset(WIDTH*0.21);
            make.top.equalTo(buttonNanjing).with.offset(0);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonNanning.layer.cornerRadius = HEIGHT*0.01;
    buttonNanning.layer.masksToBounds = YES;
    buttonNanning.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonNanning.layer.borderWidth = 1;
    [buttonNanning setTitle:@"南宁市" forState:UIControlStateNormal];
    [buttonNanning setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];



    UIButton* buttonGuangzhou = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonGuangzhou];
    [buttonGuangzhou mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonHaerbin).with.offset(0);
            make.top.equalTo(buttonHaerbin).with.offset(HEIGHT*0.04);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonGuangzhou.layer.cornerRadius = HEIGHT*0.01;
    buttonGuangzhou.layer.masksToBounds = YES;
    buttonGuangzhou.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonGuangzhou.layer.borderWidth = 1;
    [buttonGuangzhou setTitle:@"广州市" forState:UIControlStateNormal];
    [buttonGuangzhou setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];



    UIButton* buttonNanchang = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonNanchang];
    [buttonNanchang mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonGuangzhou).with.offset(WIDTH*0.21);
            make.top.equalTo(buttonGuangzhou).with.offset(0);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonNanchang.layer.cornerRadius = HEIGHT*0.01;
    buttonNanchang.layer.masksToBounds = YES;
    buttonNanchang.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonNanchang.layer.borderWidth = 1;
    [buttonNanchang setTitle:@"南昌" forState:UIControlStateNormal];
    [buttonNanchang setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    UIButton* buttonGuiyang = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonGuiyang];
    [buttonGuiyang mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonNanchang).with.offset(WIDTH*0.21);
            make.top.equalTo(buttonNanchang).with.offset(0);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonGuiyang.layer.cornerRadius = HEIGHT*0.01;
    buttonGuiyang.layer.masksToBounds = YES;
    buttonGuiyang.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonGuiyang.layer.borderWidth = 1;
    [buttonGuiyang setTitle:@"贵阳市" forState:UIControlStateNormal];
    [buttonGuiyang setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];



    UIButton* buttonJiaxing = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonJiaxing];
    [buttonJiaxing mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonGuangzhou).with.offset(0);
            make.top.equalTo(buttonGuangzhou).with.offset(HEIGHT*0.04);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonJiaxing.layer.cornerRadius = HEIGHT*0.01;
    buttonJiaxing.layer.masksToBounds = YES;
    buttonJiaxing.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonJiaxing.layer.borderWidth = 1;
    [buttonJiaxing setTitle:@"嘉兴市" forState:UIControlStateNormal];
    [buttonJiaxing setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];



    UIButton* buttonHuzhou = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonHuzhou];
    [buttonHuzhou mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonJiaxing).with.offset(WIDTH*0.21);
            make.top.equalTo(buttonJiaxing).with.offset(0);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonHuzhou.layer.cornerRadius = HEIGHT*0.01;
    buttonHuzhou.layer.masksToBounds = YES;
    buttonHuzhou.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonHuzhou.layer.borderWidth = 1;
    [buttonHuzhou setTitle:@"湖州市" forState:UIControlStateNormal];
    [buttonHuzhou setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    UIButton* buttonShaoxing = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonShaoxing];
    [buttonShaoxing mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonHuzhou).with.offset(WIDTH*0.21);
            make.top.equalTo(buttonHuzhou).with.offset(0);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonShaoxing.layer.cornerRadius = HEIGHT*0.01;
    buttonShaoxing.layer.masksToBounds = YES;
    buttonShaoxing.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonShaoxing.layer.borderWidth = 1;
    [buttonShaoxing setTitle:@"绍兴市" forState:UIControlStateNormal];
    [buttonShaoxing setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];


    UIButton* buttonJinhua = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonJinhua];
    [buttonJinhua mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonJiaxing).with.offset(0);
            make.top.equalTo(buttonJiaxing).with.offset(HEIGHT*0.04);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonJinhua.layer.cornerRadius = HEIGHT*0.01;
    buttonJinhua.layer.masksToBounds = YES;
    buttonJinhua.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonJinhua.layer.borderWidth = 1;
    [buttonJinhua setTitle:@"金华市" forState:UIControlStateNormal];
    [buttonJinhua setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];



    UIButton* buttonQvzhou = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonQvzhou];
    [buttonQvzhou mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonJinhua).with.offset(WIDTH*0.21);
            make.top.equalTo(buttonJinhua).with.offset(0);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonQvzhou.layer.cornerRadius = HEIGHT*0.01;
    buttonQvzhou.layer.masksToBounds = YES;
    buttonQvzhou.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonQvzhou.layer.borderWidth = 1;
    [buttonQvzhou setTitle:@"衢州市" forState:UIControlStateNormal];
    [buttonQvzhou setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    UIButton* buttonZhoushan = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonZhoushan];
    [buttonZhoushan mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonQvzhou).with.offset(WIDTH*0.21);
            make.top.equalTo(buttonQvzhou).with.offset(0);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonZhoushan.layer.cornerRadius = HEIGHT*0.01;
    buttonZhoushan.layer.masksToBounds = YES;
    buttonZhoushan.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonZhoushan.layer.borderWidth = 1;
    [buttonZhoushan setTitle:@"舟山市" forState:UIControlStateNormal];
    [buttonZhoushan setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];



    UIButton* buttonTaizhou = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonTaizhou];
    [buttonTaizhou mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonJinhua).with.offset(0);
            make.top.equalTo(buttonJinhua).with.offset(HEIGHT*0.04);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonTaizhou.layer.cornerRadius = HEIGHT*0.01;
    buttonTaizhou.layer.masksToBounds = YES;
    buttonTaizhou.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonTaizhou.layer.borderWidth = 1;
    [buttonTaizhou setTitle:@"台州市" forState:UIControlStateNormal];
    [buttonTaizhou setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];



    UIButton* buttonLishui = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonLishui];
    [buttonLishui mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonTaizhou).with.offset(WIDTH*0.21);
            make.top.equalTo(buttonTaizhou).with.offset(0);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonLishui.layer.cornerRadius = HEIGHT*0.01;
    buttonLishui.layer.masksToBounds = YES;
    buttonLishui.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonLishui.layer.borderWidth = 1;
    [buttonLishui setTitle:@"丽水市" forState:UIControlStateNormal];
    [buttonLishui setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIButton* buttonNingbo = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonNingbo];
    [buttonNingbo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonLishui).with.offset(WIDTH*0.21);
            make.top.equalTo(buttonLishui).with.offset(0);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonNingbo.layer.cornerRadius = HEIGHT*0.01;
    buttonNingbo.layer.masksToBounds = YES;
    buttonNingbo.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonNingbo.layer.borderWidth = 1;
    [buttonNingbo setTitle:@"宁波市" forState:UIControlStateNormal];
    [buttonNingbo setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    
    
    
    UIButton* buttonWenzhou = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonWenzhou];
    [buttonWenzhou mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(buttonTaizhou).with.offset(0);
            make.top.equalTo(buttonTaizhou).with.offset(HEIGHT*0.04);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonWenzhou.layer.cornerRadius = HEIGHT*0.01;
    buttonWenzhou.layer.masksToBounds = YES;
    buttonWenzhou.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonWenzhou.layer.borderWidth = 1;
    [buttonWenzhou setTitle:@"温州市" forState:UIControlStateNormal];
    [buttonWenzhou setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
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
