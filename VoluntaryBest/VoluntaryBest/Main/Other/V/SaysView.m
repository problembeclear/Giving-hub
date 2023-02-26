//
//  SaysView.m
//  VoluntaryBest
//
//  Created by 王璐 on 2023/2/5.
//

#import "SaysView.h"
#import "Model.h"
#import "Manager.h"

@implementation SaysView
- (void)initView{
    
    
    
    
    
    
    self.backgroundColor = [UIColor yellowColor];
    UIImageView* preView = [[UIImageView alloc] init] ;
    
    preView.image = [UIImage imageNamed:@"SaysBack.jpeg"] ;
    
    preView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    
    [self addSubview:preView] ;
    
    
    
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
    
    
    UILabel* label = [[UILabel alloc] init];
    label.text = @"精选名言";
    [self addSubview:label];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:28];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonReturnMain).with.offset(30);
        make.top.equalTo(self).with.offset(34);
        make.width.mas_equalTo(WIDTH - 90);
        make.height.mas_equalTo(30);
        
    }];
    
    
    
    
//    self.tableView = [[UITableView alloc] init];
//    self.tableView.frame = CGRectMake(0, 65, WIDTH, HEIGHT);
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
    //[self addSubview:self.tableView];
    
    
    UILabel* labelText = [[UILabel alloc] init];
    labelText.text = self.array[0][@"text"];
    [self addSubview:labelText];
    [labelText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(30);
        make.top.equalTo(label).with.offset(65);
        make.width.mas_equalTo(WIDTH - 60);
        make.height.mas_equalTo(HEIGHT - 105);
    }];
    labelText.font = [UIFont systemFontOfSize:30];
    labelText.numberOfLines = 5;
    labelText.textAlignment = NSTextAlignmentCenter;
}

//- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSString* str = [NSString stringWithFormat:@"%ld",indexPath.row];
//    NSLog(@"%@", str);
//    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:str];
//    if (cell == nil){
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"111"];
//    }
//    UILabel* label = [[UILabel alloc] init];
//    [cell addSubview:label];
//    label.text = self.array[indexPath.row][@"text"];
//    label.numberOfLines = 3;
//    label.font = [UIFont systemFontOfSize:20];
//    label.frame = CGRectMake(20, 20, WIDTH - 40, 60);
//    return cell;
//}
- (void)returnMian{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"returnMain" object:nil];

}
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//   return 1;
//}
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return 8;
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 100;
//}


@end
