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
    [self initExactScrollViewRecommend];
    
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
        buttonCity.tag = i;
        [buttonCity addTarget:self action:@selector(pressCityButton:) forControlEvents:UIControlEventTouchUpInside];
        buttonCity.backgroundColor = [UIColor colorWithRed:216.0/255 green:216.0/255 blue:216.0/255 alpha:0.8];
        if (i==0) {
            buttonCity.backgroundColor = [UIColor whiteColor];
        }
    }
}
- (void)pressCityButton:(UIButton*)button {
    button.selected = !button.selected;
    if (button.selected == YES) {
        button.backgroundColor = [UIColor whiteColor];
        if (button.tag == 1) {
            [self initExactScrollViewBeijing];
        }
    } else {
        button.backgroundColor = [UIColor colorWithRed:216.0/255 green:216.0/255 blue:216.0/255 alpha:0.8];
    }
}
- (void)initExactScrollViewBeijing {
    [self.exactScrollView removeFromSuperview];
    
}
- (void) initExactScrollViewRecommend {
    
    
    
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
    [buttonRecently addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventValueChanged];
    
    
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
    
    
    
    
    self.recommendArray = [[NSMutableArray alloc] init];
    self.recommendArray = [NSMutableArray arrayWithObjects:@"杭州市", @"上海市", @"北京市", @"武汉市", @"天津市", @"西安市", @"石家庄市", @"兰州市", @"合肥市", @"海口市", @"成都市", @"济南市", @"乌鲁木齐", @"拉萨市", @"郑州市", @"长沙市", @"福州市", @"沈阳市", @"太原市", @"呼和浩特", @"银川市", @"西宁市", @"昆明市", @"长春市", @"哈尔滨市", @"南京", @"南宁市", @"广州市", @"南昌", @"贵阳市", @"嘉兴市", @"湖州市", @"绍兴市", @"金华市", @"衢州市", @"舟山市",  @"台州市", @"丽水市", @"宁波市", @"温州市", nil];
    for (int i = 0, j = 0; i < self.recommendArray.count - 1; i = i + 3, j++) {
        UIButton* buttonHotOne = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.exactScrollView addSubview:buttonHotOne];
        [buttonHotOne mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(labelHot).with.offset(0);
                make.top.equalTo(labelHot).with.offset(HEIGHT*0.05 + HEIGHT*0.04*j);
                make.width.mas_equalTo(WIDTH*0.2);
                make.height.mas_equalTo(HEIGHT*0.03);
        }];
        buttonHotOne.layer.cornerRadius = HEIGHT*0.01;
        buttonHotOne.layer.masksToBounds = YES;
        buttonHotOne.layer.borderColor = [[UIColor grayColor] CGColor];
        buttonHotOne.layer.borderWidth = 1;
        [buttonHotOne setTitle:self.recommendArray[i] forState:UIControlStateNormal];
        [buttonHotOne setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
        buttonHotOne.tag = i;
        [buttonHotOne addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
        
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
        [buttonHotTwo setTitle:self.recommendArray[i + 1] forState:UIControlStateNormal];
        [buttonHotTwo setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        buttonHotTwo.tag = i+1;
        [buttonHotTwo addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
        
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
        [buttonHotThree setTitle:self.recommendArray[i + 2] forState:UIControlStateNormal];
        [buttonHotThree setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        buttonHotThree.tag = i + 2;
        [buttonHotThree addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    UIButton* buttonHotThree = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.exactScrollView addSubview:buttonHotThree];
    [buttonHotThree mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(labelHot).with.offset(0);
            make.top.equalTo(labelHot).with.offset(HEIGHT*0.05 + HEIGHT*0.04*13);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.03);
    }];
    buttonHotThree.layer.cornerRadius = HEIGHT*0.01;
    buttonHotThree.layer.masksToBounds = YES;
    buttonHotThree.layer.borderColor = [[UIColor grayColor] CGColor];
    buttonHotThree.layer.borderWidth = 1;
    [buttonHotThree setTitle:@"温州市" forState:UIControlStateNormal];
    [buttonHotThree setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    buttonHotThree.tag = self.recommendArray.count - 1;
    [buttonHotThree addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    
    
}
- (void)pressButton: (UIButton*)button{
    button.selected = !button.selected;
    if (button.selected == YES) {
        button.backgroundColor = [UIColor grayColor];
    } else {
        button.backgroundColor = [UIColor whiteColor];
    }
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
