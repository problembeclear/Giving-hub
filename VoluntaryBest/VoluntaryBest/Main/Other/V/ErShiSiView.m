//
//  ErShiSiView.m
//  VoluntaryBest
//
//  Created by 王璐 on 2023/2/25.
//

#import "ErShiSiView.h"
#import "Masonry.h"
#import "WebKit/WebKit.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height


@implementation ErShiSiView
- (void)initView {
    
    
    self.backgroundColor = [UIColor colorWithRed:112/255.0 green:0/255.0 blue:255/255.0 alpha:1];
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
    
    UILabel* labelName = [[UILabel alloc] init];
    labelName.text = @"                今日快讯";
    [self addSubview:labelName];
    //labelName.textAlignment = NSTextAlignmentCenter;
    labelName.font = [UIFont systemFontOfSize:25];
    [labelName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonReturnMain).with.offset(50);
        make.top.equalTo(buttonReturnMain).with.offset(0);
        make.width.mas_equalTo(HEIGHT - 60);
        make.height.mas_equalTo(50);

    }];
    UIImageView* preView = [[UIImageView alloc] init] ;
    
    preView.image = [UIImage imageNamed:@"22222.jpeg"] ;
    
    preView.frame = CGRectMake(0, 100, WIDTH, HEIGHT);
    
    [self addSubview:preView];
    
//    UILabel* label = [[UILabel alloc] init];
//    label.text = @"精选名言";
//    [self addSubview:label];
//    label.textAlignment = NSTextAlignmentCenter;
//    label.font = [UIFont systemFontOfSize:28];
//    [label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(buttonReturnMain).with.offset(30);
//        make.top.equalTo(self).with.offset(34);
//        make.width.mas_equalTo(WIDTH - 90);
//        make.height.mas_equalTo(30);
//
//    }];
    //self.backgroundColor = [UIColor whiteColor];
//    WKWebView* webView = [[WKWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    NSString* str = @"https://zj.v.api.aa1.cn/api/60s/";
//    NSURL* url = [NSURL URLWithString:str];
//    webView.frame = CGRectMake(0, 105, WIDTH, HEIGHT);
//    NSURLRequest* request = [NSURLRequest requestWithURL:url];
//    [webView loadRequest:request];
//    [self addSubview:webView];
//
//    UILabel* labelLocation = [[UILabel alloc] init];
//    [self addSubview:labelLocation];
//    labelLocation.text = @"二十四节气";
//    labelLocation.font = [UIFont systemFontOfSize:30];
//    labelLocation.textAlignment = NSTextAlignmentCenter;
//    [labelLocation mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(buttonReturnMain).with.offset(10);
//        make.top.equalTo(buttonReturnMain).with.offset(0);
//        make.width.mas_equalTo(WIDTH - 45);
//        make.height.mas_equalTo(HEIGHT*0.03);
//    }];
//
//    self.chooseArray = [[NSMutableArray alloc] init];
//    self.chooseArray = [NSMutableArray arrayWithObjects:@"立春", @"雨水", @"惊蛰", @"春分", @"清明", @"谷雨", @"立夏", @"小满", @"芒种", @"夏至", @"小暑", @"大暑", @"立秋", @"处暑", @"白露", @"秋分", @"寒露", @"霜降", @"立冬", @"小雪", @"大雪", @"冬至", @"小寒", @"大寒",  nil];
//    [self initChooseScrollView];
//    [self initExactScrollView];
}
//- (void)initChooseScrollView {
//    self.chooseScrollView = [[UIScrollView alloc] init];
//    self.chooseScrollView.contentSize = CGSizeMake(WIDTH*0.3, HEIGHT*0.05*(self.chooseArray.count + 1));
//    [self addSubview:self.chooseScrollView];
//    self.chooseScrollView.scrollEnabled = YES;
//    self.chooseScrollView.pagingEnabled = YES;
//    [self.chooseScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self).with.offset(0);
//            make.top.equalTo(self).with.offset(HEIGHT*0.05 + 20);
//            make.width.mas_equalTo(WIDTH*0.3);
//            make.height.mas_equalTo(HEIGHT);
//    }];
//    //self.chooseScrollView.backgroundColor  = [UIColor redColor];
//
//    for (int i = 0; i < self.chooseArray.count; i++) {
//        UIButton* buttonCity = [UIButton buttonWithType:UIButtonTypeCustom];
//        [self.chooseScrollView addSubview:buttonCity];
//        [buttonCity setTitle:self.chooseArray[i] forState:UIControlStateNormal];
//        [buttonCity setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [buttonCity mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.chooseScrollView).with.offset(0);
//            make.top.equalTo(self.chooseScrollView).with.offset(HEIGHT*0.05*i);
//            make.width.mas_equalTo(WIDTH*0.3);
//            make.height.mas_equalTo(HEIGHT*0.05);
//        }];
//        buttonCity.tag = i;
//        [buttonCity addTarget:self action:@selector(pressCityButton:) forControlEvents:UIControlEventTouchUpInside];
//        buttonCity.backgroundColor = [UIColor systemGray6Color];
//        if (i==0) {
//            buttonCity.backgroundColor = [UIColor whiteColor];
//        }
//    }
//    //[self addSubview:self.chooseScrollView];
//}
//- (void)pressCityButton:(UIButton *)button {
//
//
//    [self.buttonCity removeFromSuperview];
//    self.buttonCity = [UIButton buttonWithType:UIButtonTypeCustom];
//    self.buttonCity.frame = button.frame;
//    self.buttonCity.backgroundColor = [UIColor whiteColor];
//    [self.buttonCity setTitle:button.titleLabel.text forState:UIControlStateNormal];
//    [self.buttonCity setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [self.chooseScrollView addSubview:self.buttonCity];
//    self.buttonCity.tag = button.tag;
//
//
//
//    self.cityArray = [[NSMutableArray alloc] init];
//    if (self.buttonCity.selected == NO) {
//        //self.buttonCity.backgroundColor = [UIColor whiteColor];
//        if (self.buttonCity.tag == 0) {
//            self.cityArray = [NSMutableArray arrayWithObjects:@"3月19-22日", @"二月初八", @"春分古时又被称为:日中,日夜分,仲春之月。春分时节，中国民间有妇孺争放风筝的风俗，民谚也有:吃了荠菜，百蔬不鲜的说法。在岭南地区，春分,有吃春菜的风俗。在中国还有:春分到，蛋儿俏。的民间说法。每到春分这一天，世界各地都会有数以千万计的人在做:竖蛋。游戏试验。", nil];
//
//        } else if (self.buttonCity.tag == 1) {
//            self.cityArray = [NSMutableArray arrayWithObjects:@"春分", nil];
//        } else if (self.buttonCity.tag == 2) {
//            self.cityArray = [NSMutableArray arrayWithObjects:@"春分", nil];
//        } else if (self.buttonCity.tag == 3) {
//            self.cityArray = [NSMutableArray arrayWithObjects:@"春分", nil];
//        } else if (self.buttonCity.tag == 4) {
//            self.cityArray = [NSMutableArray arrayWithObjects:@"春分", nil];
//        } else if (self.buttonCity.tag == 5) {
//            self.cityArray = [NSMutableArray arrayWithObjects:@"春分", nil];
//        } else if (self.buttonCity.tag == 6) {
//            self.cityArray = [NSMutableArray arrayWithObjects:@"春分", nil];
//        } else if (self.buttonCity.tag == 7) {
//            self.cityArray = [NSMutableArray arrayWithObjects:@"春分", nil];
//        } else if (self.buttonCity.tag == 8) {
//            self.cityArray = [NSMutableArray arrayWithObjects:@"春分", nil];
//        } else if (self.buttonCity.tag == 9) {
//            self.cityArray = [NSMutableArray arrayWithObjects:@"春分", nil];
//        } else if (self.buttonCity.tag == 10) {
//            self.cityArray = [NSMutableArray arrayWithObjects:@"春分", nil];
//        } else if (self.buttonCity.tag == 11) {
//            self.cityArray = [NSMutableArray arrayWithObjects:@"春分", nil];
//        } else if (self.buttonCity.tag == 12) {
//            self.cityArray = [NSMutableArray arrayWithObjects:@"春分", nil];
//        } else if (self.buttonCity.tag == 13) {
//            self.cityArray = [NSMutableArray arrayWithObjects:@"春分", nil];
//        } else if (self.buttonCity.tag == 14) {
//            self.cityArray = [NSMutableArray arrayWithObjects:@"春分", nil];
//        } else if (self.buttonCity.tag == 15) {
//            self.cityArray = [NSMutableArray arrayWithObjects:@"春分", nil];
//        } else if (self.buttonCity.tag == 16) {
//            self.cityArray = [NSMutableArray arrayWithObjects:@"春分", nil];
//        } else if (self.buttonCity.tag == 17) {
//            self.cityArray = [NSMutableArray arrayWithObjects:@"春分", nil];
//        } else if (self.buttonCity.tag == 18) {
//            self.cityArray = [NSMutableArray arrayWithObjects:@"春分", nil];
//        } else if (self.buttonCity.tag == 19) {
//            self.cityArray = [NSMutableArray arrayWithObjects:@"春分", nil];
//        } else if (self.buttonCity.tag == 20) {
//            self.cityArray = [NSMutableArray arrayWithObjects:@"春分", nil];
//        } else if (self.buttonCity.tag == 21) {
//            self.cityArray = [NSMutableArray arrayWithObjects:@"春分", nil];
//        } else if (self.buttonCity.tag == 22) {
//            self.cityArray = [NSMutableArray arrayWithObjects:@"春分", nil];
//        } else if (self.buttonCity.tag == 23) {
//            self.cityArray = [NSMutableArray arrayWithObjects:@"春分", nil];
//        } else if (self.buttonCity.tag == 24) {
//            self.cityArray = [NSMutableArray arrayWithObjects:@"春分", nil];
//        } else {
//            button.backgroundColor = [UIColor colorWithRed:216.0/255 green:216.0/255 blue:216.0/255 alpha:0.8];
//        }
//    }
//}
//- (void)initExactScrollView {
//
//
//    self.exactScrollView = [[UIScrollView alloc] init];
//    self.exactScrollView.contentSize = CGSizeMake(WIDTH*0.7, HEIGHT*0.05*(self.chooseArray.count + 1));
//    [self addSubview:self.exactScrollView];
//    //self.exactScrollView.backgroundColor = [UIColor redColor];
//    self.exactScrollView.scrollEnabled = YES;
//    self.exactScrollView.pagingEnabled = YES;
//    [self.exactScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self).with.offset(WIDTH*0.3);
//            make.top.equalTo(self).with.offset(HEIGHT*0.05 + 20);
//            make.width.mas_equalTo(WIDTH*0.7);
//            make.height.mas_equalTo(HEIGHT);
//    }];
//    UILabel* labelName = [[UILabel alloc] init];
//    labelName.text = @"春分";
//    labelName.font = [UIFont systemFontOfSize:25];
//    [self addSubview:labelName];
//    [labelName mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.exactScrollView).with.offset(WIDTH*0.05);
//            make.top.equalTo(self).with.offset(100);
//            make.width.mas_equalTo(WIDTH*0.3);
//            make.height.mas_equalTo(30);
//    }];
//    UILabel* labelDateOne = [[UILabel alloc] init];
//    labelDateOne.text = @"公历日期:";
//    labelDateOne.font = [UIFont systemFontOfSize:18];
//    [self addSubview:labelDateOne];
//    [labelDateOne mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(labelName).with.offset(0);
//            make.top.equalTo(labelName).with.offset(40);
//            make.width.mas_equalTo(WIDTH*0.3);
//            make.height.mas_equalTo(30);
//    }];
//    UILabel* labelDateTwo = [[UILabel alloc] init];
//    labelDateTwo.text = @"农历日期:";
//    labelDateTwo.font = [UIFont systemFontOfSize:18];
//    [self addSubview:labelDateTwo];
//    [labelDateTwo mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(labelDateOne).with.offset(0);
//            make.top.equalTo(labelDateOne).with.offset(40);
//            make.width.mas_equalTo(WIDTH*0.3);
//            make.height.mas_equalTo(30);
//    }];
//
//
//    UILabel* labelThree = [[UILabel alloc] init];
//    labelThree.text = @"节气由来:";
//    labelThree.font = [UIFont systemFontOfSize:18];
//    [self addSubview:labelThree];
//    [labelThree mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(labelDateTwo).with.offset(0);
//            make.top.equalTo(labelDateTwo).with.offset(40);
//            make.width.mas_equalTo(WIDTH*0.3);
//            make.height.mas_equalTo(30);
//    }];
//
//
//
//    UILabel* labelFour = [[UILabel alloc] init];
//    labelFour.text = @"节气简介:";
//    labelFour.font = [UIFont systemFontOfSize:18];
//    [self addSubview:labelFour];
//    [labelFour mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(labelThree).with.offset(0);
//            make.top.equalTo(labelThree).with.offset(40);
//            make.width.mas_equalTo(WIDTH*0.3);
//            make.height.mas_equalTo(30);
//    }];
//
//
//    UILabel* labelFive = [[UILabel alloc] init];
//    labelFive.text = @"节气习俗:";
//    labelFive.font = [UIFont systemFontOfSize:18];
//    [self addSubview:labelFive];
//    [labelFive mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(labelFour).with.offset(0);
//            make.top.equalTo(labelFour).with.offset(40);
//            make.width.mas_equalTo(WIDTH*0.3);
//            make.height.mas_equalTo(30);
//    }];
//
//
//    UILabel* labelSix = [[UILabel alloc] init];
//    labelSix.text = @"节气养生建议:";
//    labelSix.font = [UIFont systemFontOfSize:18];
//    [self addSubview:labelSix];
//    [labelSix mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(labelFive).with.offset(0);
//            make.top.equalTo(labelFive).with.offset(40);
//            make.width.mas_equalTo(WIDTH*0.3);
//            make.height.mas_equalTo(30);
//    }];
//}
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

#import "WebKit/WebKit.h"
