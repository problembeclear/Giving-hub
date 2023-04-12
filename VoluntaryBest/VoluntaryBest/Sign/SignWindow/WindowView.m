//
//  WindowView.m
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/4/12.
//

#import "WindowView.h"
#import "Masonry.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@implementation WindowView

- (void) LayoutSelf {
    self.clipsToBounds = YES;
    self.layer.cornerRadius = 30;
    
    self.backgroundColor = [UIColor whiteColor];
    
    UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tanchuangbeijing.jpg"]];
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(0);
        make.right.equalTo(self).with.offset(0);
        make.top.equalTo(self).with.offset(0);
        make.height.mas_equalTo(170);
    }];
    
    
    UIButton* buttonLeft = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonLeft setTitleColor:[UIColor systemBlueColor] forState:UIControlStateNormal];
    [buttonLeft setTitle:@"取消" forState:UIControlStateNormal];
    buttonLeft.layer.borderColor = [UIColor grayColor].CGColor;
    buttonLeft.layer.borderWidth = 0.2;
    [self addSubview:buttonLeft];
    [buttonLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(0);
        make.bottom.equalTo(self.mas_bottom).with.offset(0);
        make.width.mas_equalTo((WIDTH-200)/2);
        make.height.mas_equalTo(50);
    }];
    
    
    
    UIButton* buttonRight = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonRight setTitleColor:[UIColor systemBlueColor] forState:UIControlStateNormal];
    [buttonRight setTitle:@"签到" forState:UIControlStateNormal];
    buttonRight.layer.borderColor = [UIColor grayColor].CGColor;
    buttonRight.layer.borderWidth = 0.2;
    [self addSubview:buttonRight];
    [buttonRight mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonLeft.mas_right).with.offset(0);
        make.bottom.equalTo(self.mas_bottom).with.offset(0);
        make.width.mas_equalTo((WIDTH-200)/2);
        make.height.mas_equalTo(50);
    }];
    
    [buttonLeft addTarget:self action:@selector(sendToWindowController) forControlEvents:UIControlEventTouchUpInside];
    [buttonRight addTarget:self action:@selector(getInSign) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    UILabel* labelDelegate = [[UILabel alloc] init];
    labelDelegate.text = @"点击“签到”即代表您已同意协议内容";
    [labelDelegate setLineBreakMode:NSLineBreakByWordWrapping];
    labelDelegate.numberOfLines = 0;
    labelDelegate.font = [UIFont systemFontOfSize:20];
    [self addSubview:labelDelegate];
    [labelDelegate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(14);
        make.width.mas_equalTo(200);
        make.top.equalTo(imageView.mas_bottom).with.offset(10);
        make.height.mas_equalTo(80);
    }];
    
}


- (void) sendToWindowController {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"sendToWindowController" object:nil];
}

- (void) getInSign {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"getInSign" object:nil];
}
@end
