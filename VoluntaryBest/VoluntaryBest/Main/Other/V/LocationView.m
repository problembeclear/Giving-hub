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
    self.searchTextField.backgroundColor = [UIColor grayColor];
    
    
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
