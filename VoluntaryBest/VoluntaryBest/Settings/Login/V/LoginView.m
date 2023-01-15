//
//  LoginView.m
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/1/15.
//

#import "LoginView.h"
#import "Masonry.h"

#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
@implementation LoginView


- (void) LayoutSelf {
    self.backgroundColor = [UIColor systemBlueColor];
    UIButton* buttonReturn = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonReturn setImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    [self addSubview:buttonReturn];
    [buttonReturn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(Width*0.05);
        make.top.equalTo(self).with.offset(Height*0.05);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
    }];
    [buttonReturn addTarget:self action:@selector(returnByPressButton) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void) returnByPressButton {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pressReturn" object:nil];
}
@end
