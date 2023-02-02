//
//  SearchView.m
//  VoluntaryBest
//
//  Created by 王璐 on 2023/1/15.
//
#import "SearchView.h"
#import "Masonry.h"
#import "ResultSearchViewController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@implementation SearchView {
    UITextField* searchTextField;
}
- (void)initView{
    
    self.backgroundColor = [UIColor colorWithRed:230.0/255 green:230.0/255 blue:230.0/255 alpha:1];
    
    
    
    UILabel* labelBack = [[UILabel alloc] init];
    labelBack.backgroundColor = [UIColor whiteColor];
    [self addSubview:labelBack];
    [labelBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(0);
        make.top.equalTo(self).with.offset(0);
        make.width.mas_equalTo(WIDTH);
        make.height.mas_equalTo(70);
    }];
    
    
    UIButton* buttonReturnMain = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonReturnMain setImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    [self addSubview:buttonReturnMain];
    buttonReturnMain.titleLabel.font = [UIFont systemFontOfSize:50];
    [buttonReturnMain setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonReturnMain mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(labelBack).with.offset(15);
        make.top.equalTo(labelBack).with.offset(34);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
        
    }];
    [buttonReturnMain addTarget:self action:@selector(returnMian) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    self.buttonTitleArray = [NSMutableArray arrayWithObjects:@"活动", @"文章", @"组织", nil];
    
    
    
    self.buttonOpen = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.buttonOpen];
    [self.buttonOpen mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(50);
        make.top.equalTo(self).with.offset(39);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(20);
    }];
    [self.buttonOpen setTitle:@"活动" forState:UIControlStateNormal];
    [self.buttonOpen setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.buttonOpen addTarget:self action:@selector(pressOpenButton) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    self.buttonTableView = [[UITableView alloc] init];
    self.buttonTableView.frame = self.buttonOpen.frame;
    self.buttonTableView.delegate = self;
    self.buttonTableView.dataSource = self;
    [self addSubview:self.buttonTableView];
    [self.buttonTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"111"];
    
    
    
    searchTextField = [[UITextField alloc] init];
    [self addSubview:searchTextField];
    [searchTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(110);
        make.top.equalTo(self).with.offset(35);
        make.width.mas_equalTo(WIDTH - 200);
        make.height.mas_equalTo(30);
    }];
    searchTextField.text = @"搜索相关内容";
    searchTextField.textColor = [UIColor grayColor];
    searchTextField.layer.cornerRadius = 5;
    searchTextField.layer.masksToBounds = YES;
    searchTextField.backgroundColor = [UIColor colorWithRed:220.0/255 green:220.0/255 blue:220.0/255 alpha:1];
    
    
    
    
    UIButton* buttonSearch = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonSearch setTitle:@"搜索" forState:UIControlStateNormal];
    [buttonSearch setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:buttonSearch];
    buttonSearch.layer.cornerRadius = 5;
    buttonSearch.layer.masksToBounds = YES;
    buttonSearch.layer.borderColor = [[UIColor colorWithRed:220.0/255 green:220.0/255 blue:220.0/255 alpha:1] CGColor];
    buttonSearch.layer.borderWidth = 1;
    [buttonSearch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(searchTextField).with.offset(WIDTH - 190);
        make.top.equalTo(searchTextField).with.offset(0);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(30);
    }];
    [buttonSearch addTarget:self action:@selector(pressSearchButton) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel* labelOld = [[UILabel alloc] init];
    [self addSubview:labelOld];
    labelOld.text = @"历史记录";
    labelOld.textColor = [UIColor grayColor];
    labelOld.textAlignment = NSTextAlignmentLeft;
    [labelOld mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonReturnMain).with.offset(0);
        make.top.equalTo(buttonReturnMain).with.offset(35);
        make.width.mas_equalTo(90);
        make.height.mas_equalTo(30);
    }];
    
    
}

- (void)returnMian{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"returnMain" object:nil];
    
}
- (void)pressOpenButton {
    if (self.buttonOpen.selected == NO){
            [self.buttonTableView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self).with.offset(70);
                make.top.equalTo(self).with.offset(39);
                make.width.mas_equalTo(50);
                make.height.mas_equalTo(20*3);
            }];
            self.buttonOpen.selected = YES;
        } else{
            [self.buttonTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).with.offset(70);
            make.top.equalTo(self).with.offset(39);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(20);
        }];
            self.buttonOpen.selected = NO;
        }
        [self.buttonTableView reloadData];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.buttonOpen.selected == NO){
        return 1;
    } else{
        return 3;
    }
}
//cell的行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 20;
}
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"111"];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"111"];
    }
    
    cell.textLabel.text = self.buttonTitleArray[indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentLeft;
    cell.textLabel.font = [UIFont systemFontOfSize:8];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.buttonOpen removeFromSuperview];
    self.buttonOpen = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.buttonOpen];
    [self.buttonOpen mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(50);
        make.top.equalTo(self).with.offset(39);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(20);
    }];
    [self.buttonOpen setTitle:self.buttonTitleArray[indexPath.row] forState:UIControlStateNormal];
    [self.buttonOpen setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.buttonOpen addTarget:self action:@selector(pressOpenButton) forControlEvents:UIControlEventTouchUpInside];
    self.buttonOpen.backgroundColor = [UIColor whiteColor];
    self.buttonOpen.selected = NO;
    
    
    
    [self.buttonTableView removeFromSuperview];
    self.buttonTableView = [[UITableView alloc] init];
    self.buttonTableView.frame = self.buttonOpen.frame;
    self.buttonTableView.delegate = self;
    self.buttonTableView.dataSource = self;
    [self addSubview:self.buttonTableView];
    [self.buttonTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"111"];
}
- (void)pressSearchButton {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"resultViewController" object:nil ];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
