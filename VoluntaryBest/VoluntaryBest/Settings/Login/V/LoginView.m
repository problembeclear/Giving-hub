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
    
    
    
    
    UIImageView* preView = [[UIImageView alloc] init] ;
    preView.image = [UIImage imageNamed:@"LogInBack.jpeg"] ;
    preView.frame = CGRectMake(0, 0, Width, Height);
    [self addSubview:preView];
    
    
    
    //self.backgroundColor = [UIColor whiteColor];
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
    [buttonReturnMain addTarget:self action:@selector(returnByPressButton) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    

    
    
    
    
//    UIImageView* logoViewInLogin = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"denglu.png"]];
//    [self addSubview:logoViewInLogin];
//    [logoViewInLogin mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self).with.offset(Width*0.3);
//        make.width.mas_equalTo(Width*0.4);
//        make.top.equalTo(self).with.offset(Height*0.2);
//        make.height.mas_equalTo(Height*0.1);
//    }];
    
    //账号栏
    self.countField = [[UITextField alloc] init];
    [preView addSubview:self.countField];
    [self.countField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(Width*0.25);
        make.width.mas_equalTo(Width*0.6);
        make.top.equalTo(preView.mas_bottom).with.offset(30);
        make.height.mas_equalTo(40);
    }];
    self.countField.backgroundColor = [UIColor whiteColor];
    self.countField.placeholder = @"输入手机号或邮箱";
    self.countField.layer.cornerRadius = 10;
    self.countField.layer.masksToBounds = YES;
    //账号图标
    UIImageView* countImage = [[UIImageView alloc] init];
    countImage.image = [UIImage imageNamed:@"zhanghao.png"];
    [preView addSubview:countImage];
    [countImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.countField.mas_left).with.offset(-5);
        make.width.mas_equalTo(40);
        make.top.equalTo(self.countField).with.offset(0);
        make.height.mas_equalTo(40);
    }];
    
    
    //密码栏
    self.passwordField = [[UITextField alloc] init];
    [preView addSubview:self.passwordField];
    [self.passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(Width*0.25);
        make.width.mas_equalTo(Width*0.6);
        make.top.equalTo(self.countField.mas_bottom).with.offset(20);
        make.height.mas_equalTo(40);
    }];
    
    self.passwordField.backgroundColor = [UIColor whiteColor];
    self.passwordField.placeholder = @"输入密码";
    self.passwordField.layer.cornerRadius = 10;
    self.passwordField.layer.masksToBounds = YES;
    //密码图标
    UIImageView* passwordImage = [[UIImageView alloc] init];
    passwordImage.image = [UIImage imageNamed:@"mima.png"];
    [preView addSubview:passwordImage];
    [passwordImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.passwordField.mas_left).with.offset(-5);
        make.width.mas_equalTo(40);
        make.top.equalTo(self.passwordField).with.offset(0);
        make.height.mas_equalTo(40);
    }];
    
    
    //登录按钮
    UIButton* loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    loginButton.tintColor = [UIColor whiteColor];
    [loginButton addTarget:self action:@selector(pressLogin) forControlEvents:UIControlEventTouchUpInside];
    [preView addSubview:loginButton];
    [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(countImage).with.offset(0);
        make.top.equalTo(self.passwordField.mas_bottom).with.offset(20);
        make.width.mas_equalTo(Width*0.2);
        make.height.mas_equalTo(40);
    }];
    
    loginButton.layer.borderWidth = 1;
    loginButton.layer.borderColor = [UIColor whiteColor].CGColor;
    //注册按钮
    UIButton* SignUpButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [SignUpButton setTitle:@"注册" forState:UIControlStateNormal];
    SignUpButton.tintColor = [UIColor whiteColor];
    [SignUpButton addTarget:self action:@selector(pressSignUp) forControlEvents:UIControlEventTouchUpInside];
    [preView addSubview:SignUpButton];
    [SignUpButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.passwordField).with.offset(0);
        make.top.equalTo(self.passwordField.mas_bottom).with.offset(20);
        make.width.mas_equalTo(Width*0.2);
        make.height.mas_equalTo(40);
    }];
    SignUpButton.layer.borderWidth = 1;
    SignUpButton.layer.borderColor = [UIColor whiteColor].CGColor;
}

- (void) returnByPressButton {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"pressReturn" object:nil];
}
//登录判断
- (void) pressLogin {
    NSLog(@"222");
}
//按下注册按钮
- (void) pressSignUp {
    
}

@end
