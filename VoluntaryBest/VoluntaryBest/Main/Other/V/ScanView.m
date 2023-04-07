//
//  ScanView.m
//  VoluntaryBest
//
//  Created by 王璐 on 2023/1/15.
//

#import "ScanView.h"
#import "Masonry.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define kDeviceVersion [[UIDevice currentDevice].systemVersion floatValue]

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kNavbarHeight ((kDeviceVersion>=7.0)? 64 :44 )

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define kSCREEN_MAX_LENGTH (MAX(kScreenWidth, kScreenHeight))
#define kSCREEN_MIN_LENGTH (MIN(kScreenWidth, kScreenHeight))

#define IS_IPHONE4 (IS_IPHONE && kSCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE5 (IS_IPHONE && kSCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE6 (IS_IPHONE && kSCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE6P (IS_IPHONE && kSCREEN_MAX_LENGTH == 736.0)

@implementation ScanView
- (void)initView{
    
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
    label.text = @"扫一扫";
    [self addSubview:label];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:28];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonReturnMain).with.offset(30);
        make.top.equalTo(self).with.offset(40);
        make.width.mas_equalTo(WIDTH - 90);
        make.height.mas_equalTo(30);
    }];


    UIImageView* preView = [[UIImageView alloc] init] ;
    
    preView.image = [UIImage imageNamed:@"1111.jpeg"] ;
    
    preView.frame = CGRectMake(0, 100, WIDTH, HEIGHT);
    
    [self addSubview:preView];
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
