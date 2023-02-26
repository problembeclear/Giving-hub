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
    [buttonReturnMain setImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    [self addSubview:buttonReturnMain];
    buttonReturnMain.titleLabel.font = [UIFont systemFontOfSize:50];
    [buttonReturnMain setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonReturnMain mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(30);
        make.top.equalTo(self).with.offset(34);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
        
    }];
    [buttonReturnMain addTarget:self action:@selector(returnMian) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel* labelLocation = [[UILabel alloc] init];
    [self addSubview:labelLocation];
    labelLocation.text = @"地区选择";
    labelLocation.font = [UIFont systemFontOfSize:30];
    labelLocation.textAlignment = NSTextAlignmentCenter;
    [labelLocation mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonReturnMain).with.offset(WIDTH*0.1 - 30);
        make.top.equalTo(buttonReturnMain).with.offset(0);
        make.width.mas_equalTo(WIDTH*0.8);
        make.height.mas_equalTo(HEIGHT*0.03);
    }];
    
    
    self.searchTextField = [[UITextField alloc] init];
    [self addSubview:self.searchTextField];
    [self.searchTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonReturnMain).with.offset(-30);
        make.top.equalTo(buttonReturnMain).with.offset(HEIGHT*0.05);
        make.width.mas_equalTo(WIDTH);
        make.height.mas_equalTo(HEIGHT*0.05);
    }];
    self.searchTextField.text = @"🔍搜索附近位置";
    self.searchTextField.textAlignment = NSTextAlignmentCenter;
    self.searchTextField.backgroundColor = [UIColor colorWithRed:216.0/255 green:216.0/255 blue:216.0/255 alpha:0.8];
    
    
    
    
    self.cityArray = [[NSMutableArray alloc] init];
    self.cityArray = [NSMutableArray arrayWithObjects:@"推荐", @"北京", @"上海", @"天津", @"重庆", @"河北", @"山西", @"内蒙古", @"辽宁", @"吉林", @"黑龙江", @"江苏", @"浙江", @"安徽", @"福建", @"江西", @"山东", @"河南", @"湖北", @"湖南", @"广东", @"广西", @"海南", @"四川", @"贵州", @"云南", @"西藏", @"陕西", @"甘肃", @"青海", @"宁夏", @"新疆", @"建设兵团", @"台湾", @"香港", @"澳门",  nil];
    
    
    
    [self initCityScrollView];
    [self initExactScrollViewRecommend];
    
}
- (void) initCityScrollView {
    self.cityScrollView = [[UIScrollView  alloc] init];
    self.cityScrollView.contentSize = CGSizeMake(WIDTH*0.3, HEIGHT*0.05*(self.cityArray.count + 2));
    [self addSubview:self.cityScrollView];
    self.cityScrollView.scrollEnabled = YES;
    self.cityScrollView.pagingEnabled = NO;
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
        buttonCity.backgroundColor = [UIColor systemGray6Color];
        if (i==0) {
            buttonCity.backgroundColor = [UIColor whiteColor];
        }
    }
}
- (void)pressCityButton:(UIButton*)button {
    
    [self.buttonCity removeFromSuperview];
    self.buttonCity = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonCity.frame = button.frame;
    self.buttonCity.backgroundColor = [UIColor whiteColor];
    [self.buttonCity setTitle:button.titleLabel.text forState:UIControlStateNormal];
    [self.buttonCity setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.cityScrollView addSubview:self.buttonCity];
    self.buttonCity.tag = button.tag;
    self.buttonCityExact.selected = !self.buttonCityExact.selected;
    
    
    self.otherCityArray = [[NSMutableArray alloc] init];
    if (self.buttonCity.selected == NO) {
        //self.buttonCity.backgroundColor = [UIColor whiteColor];
        if (self.buttonCity.tag == 0) {
            [self initExactScrollViewRecommend];
        } else if (self.buttonCity.tag == 1) {
            self.otherCityArray = [NSMutableArray arrayWithObjects:@"北京市", nil];
            [self initExactScrollViewOthers];
        } else if (self.buttonCity.tag == 2) {
            self.otherCityArray = [NSMutableArray arrayWithObjects:@"上海市", nil];
            [self initExactScrollViewOthers];
        } else if (self.buttonCity.tag == 3) {
            self.otherCityArray = [NSMutableArray arrayWithObjects:@"天津市", nil];
            [self initExactScrollViewOthers];
        } else if (self.buttonCity.tag == 4) {
            self.otherCityArray = [NSMutableArray arrayWithObjects:@"重庆市", nil];
            [self initExactScrollViewOthers];
        } else if (self.buttonCity.tag == 5) {
            self.otherCityArray = [NSMutableArray arrayWithObjects:@"石家庄市", @"秦皇岛市", @"邯郸市", @"邢台市", @"保定市", @"张家口市", @"承德市", @"沧州市", @"廊坊市", @"衡水市", @"唐山市", @"雄安新区", nil];
            [self initExactScrollViewOthers];
        } else if (self.buttonCity.tag == 6) {
            self.otherCityArray = [NSMutableArray arrayWithObjects:@"太原市", @"大同市", @"阳泉市", @"长治市", @"晋城市", @"朔州市", @"晋中市", @"运城市", @"忻州市", @"临汾市", @"吕梁市", nil];
            [self initExactScrollViewOthers];
        } else if (self.buttonCity.tag == 7) {
            self.otherCityArray = [NSMutableArray arrayWithObjects:@"呼和浩特", @"乌海市", @"赤峰市", @"通辽市", @"鄂尔多市", @"呼伦贝尔", @"巴彦淖尔", @"乌兰察布", @"兴安盟", @"锡林郭勒", @"阿拉善盟", @"包头市",  @"满洲里市", @"二连浩特",nil];
            [self initExactScrollViewOthers];
        } else if (self.buttonCity.tag == 8) {
            self.otherCityArray = [NSMutableArray arrayWithObjects:@"沈阳市", @"大连市", @"鞍山市", @"抚顺市", @"本溪市", @"丹东市", @"锦州市", @"营口市", @"阜新市", @"辽阳市", @"盘锦市", @"铁岭市",  @"朝阳市", @"葫芦岛市",nil];
            [self initExactScrollViewOthers];
        } else if (self.buttonCity.tag == 9) {
            self.otherCityArray = [NSMutableArray arrayWithObjects:@"长春市", @"吉林市", @"四平市", @"辽源市", @"通化市", @"白山市", @"松源市", @"白城市", @"朝鲜自治区", @"梅河口市", @"公主岭市", nil];
            [self initExactScrollViewOthers];
        } else if (self.buttonCity.tag == 10) {
            self.otherCityArray = [NSMutableArray arrayWithObjects:@"哈尔滨市", @"鹤岗市", @"双鸭山市", @"大庆市", @"伊春市", @"佳木斯市", @"七台河市", @"牡丹江市", @"黑河市", @"绥化市", @"大兴安岭", @"齐齐哈尔", @"鸡西市", nil];
            [self initExactScrollViewOthers];
        } else if (self.buttonCity.tag == 11) {
            self.otherCityArray = [NSMutableArray arrayWithObjects:@"南京市", @"无锡市", @"徐州市", @"常州市", @"苏州市", @"南通市", @"连云港市", @"淮安市", @"盐城市", @"扬州市", @"镇江市", @"泰州市", @"宿迁市", nil];
            [self initExactScrollViewOthers];
        } else if (self.buttonCity.tag == 12) {
            self.otherCityArray = [NSMutableArray arrayWithObjects:@"杭州市", @"嘉兴市", @"湖州市", @"绍兴市", @"金华市", @"衢州市", @"舟山市", @"台州市", @"丽水市", @"宁波市", @"温州市", @"瑞安市", @"德清市", @"建德市", @"龙游县", nil];
            [self initExactScrollViewOthers];
        } else if (self.buttonCity.tag == 13) {
            self.otherCityArray = [NSMutableArray arrayWithObjects:@"合肥市", @"滁州市", @"阜阳市", @"宿州市", @"六安市", @"豪州市", @"池州市", @"宣城市", @"芜湖市", @"蛙埠市", @"淮南市", @"马鞍山市", @"淮北市", @"铜陵市", @"安庆市", @"黄山市", nil];
        } else if (self.buttonCity.tag == 14) {
            self.otherCityArray = [NSMutableArray arrayWithObjects:@"福州市", @"厦门市", @"莆田市", @"三明市", @"泉州市", @"漳州市", @"南平市", @"龙岩市", @"宁德市", @"平潭区", nil];
            [self initExactScrollViewOthers];
            
        } else if (self.buttonCity.tag == 15) {
            self.otherCityArray = [NSMutableArray arrayWithObjects:@"南昌市", @"景德镇市", @"萍乡市", @"九江市", @"新余市", @"鹰潭市", @"赣州市", @"吉安市", @"宜春市", @"抚州市", @"上饶市", nil];
            [self initExactScrollViewOthers];
        } else if (self.buttonCity.tag == 16) {
            self.otherCityArray = [NSMutableArray arrayWithObjects:@"山东市", @"青岛市", @"淄博市", @"枣庄市", @"东营市", @"烟台市", @"淮坊市", @"济宁市", @"泰安市", @"威海市", @"日照市", @"济南市", @"滨州市", @"德州市", @"聊城市", @"临沂市", @"菏泽市",nil];
            [self initExactScrollViewOthers];
        } else if (self.buttonCity.tag == 17) {
            self.otherCityArray = [NSMutableArray arrayWithObjects:@"郑州市", @"开封市", @"洛阳市", @"平顶山市", @"安阳市", @"鹤壁市", @"新乡市", @"焦作市", @"濮阳市", @"许昌市", @"漯河市", @"三门峡市", @"南阳市", @"商丘市", @"信阳市", @"周口市", @"驻马店市", @"行政区", nil];
            [self initExactScrollViewOthers];
        } else if (self.buttonCity.tag == 18) {
            self.otherCityArray = [NSMutableArray arrayWithObjects:@"武汉市", @"湖北市", @"黄石市", @"十堰市", @"宜昌市", @"襄阳市", @"鄂州市", @"志愿荆门", @"孝感市", @"荆州市", @"黄冈市", @"咸宁市", @"随州市", @"苗族自治区", @"仙桃市",  @"潜江市", @"天门市", @"神农架林", @"嘉鱼县",nil];
            [self initExactScrollViewOthers];
        } else if (self.buttonCity.tag == 19) {
            self.otherCityArray = [NSMutableArray arrayWithObjects:@"长沙市", @"怀化市", @"娄底市", @"土家自治区", @"株洲市", @"湘潭市", @"衡阳市", @"邵阳市", @"岳阳市", @"常德市", @"张家界市", @"益阳市", @"郴州市", @"永州市", @"冷水滩区", nil];
            [self initExactScrollViewOthers];
        } else if (self.buttonCity.tag == 20) {
            self.otherCityArray = [NSMutableArray arrayWithObjects:@"广州市", @"韶关市", @"深圳市", @"珠海市", @"汕头市", @"佛山市", @"江门市", @"湛江市", @"茂名市", @"肇庆市", @"惠州市", @"梅州市", @"汕头市", @"河源市", @"阳江县",  @"清远市", @"东莞市", @"中山市", @"潮州市", @"揭阳市", @"云浮市", nil];
            [self initExactScrollViewOthers];
        } else if (self.buttonCity.tag == 21) {
            self.otherCityArray = [NSMutableArray arrayWithObjects:@"南宁市", @"柳州市", @"桂林市", @"梧州市", @"北海市", @"防城港市", @"钦州市", @"贵港市", @"玉林市", @"百色市", @"贺州市", @"河池市", @"来宾市", @"崇左市", nil];
            [self initExactScrollViewOthers];
        } else if (self.buttonCity.tag == 22) {
            self.otherCityArray = [NSMutableArray arrayWithObjects:@"海口市", @"三亚市", @"直辖县", @"儋州市", @"三沙市", nil];
            [self initExactScrollViewOthers];
        } else if (self.buttonCity.tag == 23) {
            self.otherCityArray = [NSMutableArray arrayWithObjects:@"成都市", @"自贡市", @"攀枝花市", @"泸州市", @"彝族自治区", @"德阳市", @"绵阳市", @"广元市", @"遂宁市", @"内江市", @"乐山市", @"南充市", @"眉山市", @"宜宾市", @"广安市", @"达州市", @"雅安市", @"巴中市", @"资阳市", @"藏族自治区", @"峨眉山市", nil];
            [self initExactScrollViewOthers];
        } else if (self.buttonCity.tag == 24) {
            self.otherCityArray = [NSMutableArray arrayWithObjects:@"贵阳市", @"六盘水市", @"遵义市", @"安顺市", @"铜仁市", @"苗族自治区", @"安顺市", @"侗族自治区", nil];
            [self initExactScrollViewOthers];
        } else if (self.buttonCity.tag == 25) {
            self.otherCityArray = [NSMutableArray arrayWithObjects:@"昆明市", @"曲靖市", @"玉溪市", @"保山市", @"邵通市", @"丽江市", @"普洱市", @"临沧市", @"彝族自治区市", @"苗族自治区", @"傣族自治区市", @"白族自治区", @"僳族自治区", @"藏族自治区", nil];
            [self initExactScrollViewOthers];
        } else if (self.buttonCity.tag == 26) {
            self.otherCityArray = [NSMutableArray arrayWithObjects:@"拉萨市", @"昌都市", @"山南市", @"日喀则市", @"那曲地区", @"阿里地区", @"林芝市", nil];
            [self initExactScrollViewOthers];
        } else if (self.buttonCity.tag == 27) {
            self.otherCityArray = [NSMutableArray arrayWithObjects:@"西安市", @"铜川市", @"宝鸡市", @"咸阳市", @"渭南市", @"延安", @"汉中市", @"榆林市", @"安康市", @"商洛市", nil];
            [self initExactScrollViewOthers];
        } else if (self.buttonCity.tag == 28) {
            self.otherCityArray = [NSMutableArray arrayWithObjects:@"兰州市", @"嘉峪关市", @"金昌市", @"白银市", @"天水市", @"武威市", @"张掖市", @"平凉市", @"酒泉市", @"庆阳市", @"定西市", @"隆南市", @"回族自治区", @"藏族自治区",nil];
            [self initExactScrollViewOthers];
        } else if (self.buttonCity.tag == 29) {
            self.otherCityArray = [NSMutableArray arrayWithObjects:@"西宁市", @"海东市", @"藏族自治区", nil];
            [self initExactScrollViewOthers];
        } else if (self.buttonCity.tag == 30) {
            self.otherCityArray = [NSMutableArray arrayWithObjects:@"银川市", @"石嘴山市", @"吴忠市", @"固原市", @"中卫市", nil];
            [self initExactScrollViewOthers];
        } else if (self.buttonCity.tag == 31) {
            self.otherCityArray = [NSMutableArray arrayWithObjects:@"乌鲁木齐", @"和田地区", @"哈萨克州", @"塔城地区", @"阿勒泰", @"克拉玛依", @"吐鲁番", @"哈密市", @"回族自治州", @"蒙古族自治区",  @"阿克苏", @"喀什地区",  @"克孜勒苏柯尔克孜", nil];
            [self initExactScrollViewOthers];
        } else if (self.buttonCity.tag == 32) {
            self.otherCityArray = [NSMutableArray arrayWithObjects:@"兵团本级", @"第一师阿拉尔市", @"第二师铁门关市", @"第三师图木舒克市", @"第四师可克达拉市", @"第五师双河市", @"第六师五家渠市", @"第七师胡杨河市", @"第八师石河子市", @"第九师", @"第十师北屯市", @"第十一师", @"第十二师", @"第十三师新星市", @"第十四师", @"高校", nil];
            [self initExactScrollViewOthers];
        } else if (self.buttonCity.tag == 33) {
            self.otherCityArray = [NSMutableArray arrayWithObjects:@"台湾省", nil];
            [self initExactScrollViewOthers];
        } else if (self.buttonCity.tag == 34) {
            self.otherCityArray = [NSMutableArray arrayWithObjects:@"香港特别行政区", nil];
            [self initExactScrollViewOthers];
        } else if (self.buttonCity.tag == 35) {
            self.otherCityArray = [NSMutableArray arrayWithObjects:@"澳门特别行政区", nil];
            [self initExactScrollViewOthers];
        }
    } else {
        
        button.backgroundColor = [UIColor colorWithRed:216.0/255 green:216.0/255 blue:216.0/255 alpha:0.8];
    }
}
- (void) initExactScrollViewOthers {
    [self.exactScrollView removeFromSuperview];
    [self.othersScrollView removeFromSuperview];
    self.othersScrollView = [[UIScrollView  alloc] init];
    self.othersScrollView.contentSize = CGSizeMake(WIDTH*0.7, HEIGHT);
    [self addSubview:self.othersScrollView];
    self.othersScrollView.scrollEnabled = YES;
    self.othersScrollView.pagingEnabled = YES;
    [self.othersScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.searchTextField).with.offset(WIDTH*0.3);
            make.top.equalTo(self.searchTextField).with.offset(HEIGHT*0.05);
            make.width.mas_equalTo(WIDTH*0.7);
            make.height.mas_equalTo(HEIGHT);
    }];
    UILabel* labelLocation = [[UILabel alloc] init];
    [self.othersScrollView addSubview:labelLocation];
    [labelLocation mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.othersScrollView).with.offset(WIDTH*0.05);
            make.top.equalTo(self.othersScrollView).with.offset(0);
            make.width.mas_equalTo(WIDTH*0.2);
            make.height.mas_equalTo(HEIGHT*0.05);
    }];
    labelLocation.textColor = [UIColor grayColor];
    labelLocation.text = @"所有地区";
    
    
    for (int i = 0; i < self.otherCityArray.count; i++) {

        if (i % 3 == 0) {
            UIButton* buttonOne = [UIButton buttonWithType:UIButtonTypeCustom];
            [self.othersScrollView addSubview:buttonOne];
            [buttonOne mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(labelLocation).with.offset(0);
                    make.top.equalTo(labelLocation).with.offset(HEIGHT * 0.05 + HEIGHT * 0.04 * (i / 3));
                    make.width.mas_equalTo(WIDTH* 0.2);
                    make.height.mas_equalTo(HEIGHT*0.03);
            }];
            buttonOne.layer.cornerRadius = HEIGHT*0.01;
            buttonOne.layer.masksToBounds = YES;
            buttonOne.layer.borderColor = [[UIColor grayColor] CGColor];
            buttonOne.layer.borderWidth = 1;
            [buttonOne setTitle:self.otherCityArray[i] forState:UIControlStateNormal];
            [buttonOne setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
            buttonOne.tag = i;
            [buttonOne addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
        } else if (i % 3 == 1) {
            UIButton* buttonTwo = [UIButton buttonWithType:UIButtonTypeCustom];
            [self.othersScrollView addSubview:buttonTwo];
            [buttonTwo mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(labelLocation).with.offset(WIDTH * 0.21 );
                    make.top.equalTo(labelLocation).with.offset(HEIGHT * 0.05 + HEIGHT * 0.04 * ( i / 3));
                    make.width.mas_equalTo(WIDTH*0.2);
                    make.height.mas_equalTo(HEIGHT*0.03);
                }];
            buttonTwo.layer.cornerRadius = HEIGHT*0.01;
            buttonTwo.layer.masksToBounds = YES;
            buttonTwo.layer.borderColor = [[UIColor grayColor] CGColor];
            buttonTwo.layer.borderWidth = 1;
            [buttonTwo setTitle:self.otherCityArray[i] forState:UIControlStateNormal];
            [buttonTwo setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            buttonTwo.tag = i;
            [buttonTwo addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
        } else if (i % 3 == 2) {
            UIButton* buttonThree = [UIButton buttonWithType:UIButtonTypeCustom];
            [self.othersScrollView addSubview:buttonThree];
            [buttonThree mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(labelLocation).with.offset(WIDTH * 0.21 * (i % 3));
                    make.top.equalTo(labelLocation).with.offset(HEIGHT * 0.05 + HEIGHT * 0.04 * (i / 3));
                    make.width.mas_equalTo(WIDTH*0.2);
                    make.height.mas_equalTo(HEIGHT*0.03);
                }];
            buttonThree.layer.cornerRadius = HEIGHT*0.01;
            buttonThree.layer.masksToBounds = YES;
            buttonThree.layer.borderColor = [[UIColor grayColor] CGColor];
            buttonThree.layer.borderWidth = 1;
            [buttonThree setTitle:self.otherCityArray[i] forState:UIControlStateNormal];
            [buttonThree setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            buttonThree.tag = i;
            [buttonThree addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
        }
    }

}
- (void) initExactScrollViewRecommend {
    [self.othersScrollView removeFromSuperview];
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
        buttonHotOne.tag = 10000 + i;
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
        buttonHotTwo.tag = 10000 + i+1;
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
        buttonHotThree.tag = 10000+ i + 2;
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
    [self.buttonCityExact removeFromSuperview];
    self.buttonCityExact = [UIButton buttonWithType:UIButtonTypeCustom];
    self.buttonCityExact.tag = button.tag;
    if (self.buttonCityExact.tag / 10000 == 1){
        [self.exactScrollView addSubview:self.buttonCityExact];
    } else {
        [self.othersScrollView addSubview:self.buttonCityExact];
    }
    self.buttonCityExact.frame = button.frame;
    self.buttonCityExact.backgroundColor = [UIColor grayColor];
    self.buttonCityExact.layer.cornerRadius = HEIGHT*0.01;
    self.buttonCityExact.layer.masksToBounds = YES;
    self.buttonCityExact.layer.borderColor = [[UIColor grayColor] CGColor];
    self.buttonCityExact.layer.borderWidth = 1;
    [self.buttonCityExact setTitle:button.titleLabel.text forState:UIControlStateNormal];
    [self.buttonCityExact setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    self.buttonCityExact.selected = !self.buttonCityExact.selected;
    if (self.buttonCityExact.selected == YES) {
        //self.buttonCityExact.backgroundColor = [UIColor grayColor];
    } else {
        self.buttonCityExact.backgroundColor = [UIColor whiteColor];
    }

    NSDictionary* dictionary = [NSDictionary dictionaryWithObjectsAndKeys:self.buttonCityExact.titleLabel.text, @"111", nil];
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"postLocationtext" object:nil userInfo:dictionary];


    NSLog(@"1111%@", dictionary);

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
