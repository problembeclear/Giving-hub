//
//  RubbishView.m
//  VoluntaryBest
//
//  Created by 王璐 on 2023/3/31.
//

#import "RubbishView.h"
#import "Masonry.h"
#import "ModelThree.h"
#import "ManagerThree.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@implementation RubbishView
- (void)initView {
    self.backgroundColor = [UIColor whiteColor];
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
    
    
    self.rubbishDictionary = [[NSDictionary alloc] init];
    
    UILabel* label = [[UILabel alloc] init];
    label.text = @"垃圾分类";
    [self addSubview:label];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:40];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonReturnMain).with.offset(30);
        make.top.equalTo(self).with.offset(40);
        make.width.mas_equalTo(WIDTH - 90);
        make.height.mas_equalTo(50);
    }];
    
    
    self.textField = [[UITextField alloc] init];
    self.textField.frame = CGRectMake(50, 100, WIDTH - 130, 40);
    self.textField.backgroundColor = [UIColor systemGray2Color];
    self.textField.textColor = [UIColor systemGray6Color];
    self.textField.text = @"请输入要查询的垃圾名称";
    [self addSubview:self.textField];
    
    
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeSystem];
    [self addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.textField).with.offset(WIDTH - 110);
        make.top.equalTo(self.textField).with.offset(0);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    [button setImage:[UIImage imageNamed:@"sousuo"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pressButton) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.frame = CGRectMake(0, 150, WIDTH, HEIGHT - 100);
    self.tableView.backgroundColor = [UIColor systemGray4Color];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"111"];
    [self addSubview:self.tableView];
}
- (void)pressButton {
    [self.label removeFromSuperview];
    [[ManagerThree shareManger]makeData:^(ModelThree * _Nonnull ViewModel) {
        NSDictionary* dict = [ViewModel toDictionary];
        self.rubbishDictionary = dict;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self initTableview];
        });
    } error:^(NSError * _Nonnull error) {
        NSLog(@"请求失败!");
    } andText:(NSString*) self.textField.text];

    
    
    
}
- (void) initTableview {
    if ([self.rubbishDictionary[@"code"] isEqualToString:@"1"]) {
        NSLog(@"%@", self.rubbishDictionary);
        
        
        
        self.label = [[UILabel alloc] init];
        [self.tableView addSubview:self.label];
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.tableView).with.offset(40);
            make.top.equalTo(self.tableView).with.offset(0);
            make.width.mas_equalTo(130);
            make.height.mas_equalTo(40);
        }];
        self.label.text = @"查询名称：";
        self.label.font = [UIFont systemFontOfSize:25];
        self.label.textAlignment = NSTextAlignmentLeft;
        
        
        UILabel* labelNameGoods = [[UILabel alloc] init];
        [self.tableView addSubview:labelNameGoods];
        [labelNameGoods mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.label).with.offset(130);
            make.top.equalTo(self.label).with.offset(0);
            make.width.mas_equalTo(WIDTH - 100);
            make.height.mas_equalTo(40);
        }];
        labelNameGoods.text = self.rubbishDictionary[@"data"][@"aim"][@"goodsName"];
        labelNameGoods.font = [UIFont systemFontOfSize:25];
        labelNameGoods.textAlignment = NSTextAlignmentLeft;
        
        
        UILabel* labelType = [[UILabel alloc] init];
        [self.tableView addSubview:labelType];
        [labelType mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.label).with.offset(0);
            make.top.equalTo(self.label).with.offset(40);
            make.width.mas_equalTo(130);
            make.height.mas_equalTo(40);
        }];
        labelType.text = @"垃圾类型：";
        labelType.font = [UIFont systemFontOfSize:25];
        labelType.textAlignment = NSTextAlignmentLeft;
        
        
        UILabel* labelNameType = [[UILabel alloc] init];
        [self.tableView addSubview:labelNameType];
        [labelNameType mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(labelType).with.offset(130);
            make.top.equalTo(labelType).with.offset(0);
            make.width.mas_equalTo(WIDTH - 100);
            make.height.mas_equalTo(40);
        }];
        labelNameType.text = self.rubbishDictionary[@"data"][@"aim"][@"goodsType"];
        labelNameType.font = [UIFont systemFontOfSize:25];
        labelNameType.textAlignment = NSTextAlignmentLeft;

        
        
        UILabel* labelOther = [[UILabel alloc] init];
        [self.tableView addSubview:labelOther];
        [labelOther mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(labelType).with.offset(0);
            make.top.equalTo(labelType).with.offset(80);
            make.width.mas_equalTo(130);
            make.height.mas_equalTo(40);
        }];
        labelOther.text = @"相关垃圾:";
        labelOther.font = [UIFont systemFontOfSize:25];
        labelOther.textAlignment = NSTextAlignmentLeft;
        
        for (int i = 0; i < [self.rubbishDictionary[@"data"][@"recommendList"] count]; i++) {
            
            
            UILabel* labelGoodsTypeOne = [[UILabel alloc] init];
            [self.tableView addSubview:labelGoodsTypeOne];
            [labelGoodsTypeOne mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(labelOther).with.offset(0);
                make.top.equalTo(labelOther).with.offset(80 * i + 40);
                make.width.mas_equalTo(130);
                make.height.mas_equalTo(40);
            }];
            labelGoodsTypeOne.text = @"垃圾名称：";
            labelGoodsTypeOne.font = [UIFont systemFontOfSize:25];
            labelGoodsTypeOne.textAlignment = NSTextAlignmentLeft;
            
            
            
            UILabel* labelGoodsType = [[UILabel alloc] init];
            [self.tableView addSubview:labelGoodsType];
            [labelGoodsType mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(labelGoodsTypeOne).with.offset(0);
                make.top.equalTo(labelGoodsTypeOne).with.offset(40);
                make.width.mas_equalTo(130);
                make.height.mas_equalTo(40);
            }];
            labelGoodsType.text = @"垃圾类型：";
            labelGoodsType.font = [UIFont systemFontOfSize:25];
            labelGoodsType.textAlignment = NSTextAlignmentLeft;
            
            
            
            UILabel* labelGoodsName = [[UILabel alloc] init];
            [self.tableView addSubview:labelGoodsName];
            [labelGoodsName mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(labelGoodsTypeOne).with.offset(130);
                make.top.equalTo(labelGoodsTypeOne).with.offset(0);
                make.width.mas_equalTo(WIDTH - 100);
                make.height.mas_equalTo(40);
            }];
            labelGoodsName.text = self.rubbishDictionary[@"data"][@"recommendList"][i][@"goodsName"];
            labelGoodsName.font = [UIFont systemFontOfSize:25];
            labelGoodsName.textAlignment = NSTextAlignmentLeft;
            
            
            
            UILabel* labelGoodsTypeTwo = [[UILabel alloc] init];
            [self.tableView addSubview:labelGoodsTypeTwo];
            [labelGoodsTypeTwo mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(labelGoodsType).with.offset(130);
                make.top.equalTo(labelGoodsType).with.offset(0);
                make.width.mas_equalTo(WIDTH - 100);
                make.height.mas_equalTo(40);
            }];
            labelGoodsTypeTwo.text = self.rubbishDictionary[@"data"][@"recommendList"][i][@"goodsType"];
            labelGoodsTypeTwo.font = [UIFont systemFontOfSize:25];
            labelGoodsTypeTwo.textAlignment = NSTextAlignmentLeft;
            
            
            [self addSubview:self.tableView];
        }
    } else {
        self.label = [[UILabel alloc] init];
        [self.tableView addSubview:self.label];
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.tableView).with.offset(40);
            make.top.equalTo(self.tableView).with.offset(0);
            make.width.mas_equalTo(WIDTH - 40);
            make.height.mas_equalTo(40);
        }];
        self.label.text = @"查找失败！请重新输入";
        self.label.font = [UIFont systemFontOfSize:25];
        self.label.textAlignment = NSTextAlignmentLeft;
        [self addSubview:self.tableView];
    }
    
    
}
//注意.m文件里一定实现这几个函数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
   return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.rubbishDictionary[@"recommList"] count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0){
        return 100;
    }else{
        return 60;
    }
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"111"];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"111"];
    }
    return cell;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    //使虚拟键盘回收
    [self.textField resignFirstResponder];
}
- (void)returnMian{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"returnMain" object:nil];
    
}
@end
