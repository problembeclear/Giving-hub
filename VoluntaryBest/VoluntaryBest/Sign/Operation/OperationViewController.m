//
//  OperationViewController.m
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/4/12.
//

#import "OperationViewController.h"
#import "Masonry.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@interface OperationViewController ()
@property (nonatomic, strong) UITextField* textField;
@end

@implementation OperationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView* backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
    backgroundImage.frame = CGRectMake(0, 140, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view addSubview:backgroundImage];
    
    UIButton* buttonBack = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonBack addTarget:self action:@selector(pressBack) forControlEvents:UIControlEventTouchUpInside];
    buttonBack.frame = CGRectMake(378, 10, 40, 40);
    [buttonBack setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
    [self.view addSubview:buttonBack];
    
    UILabel* labelTitle = [[UILabel alloc] init];
    labelTitle.text = @"请输入活动签到码";
    labelTitle.font = [UIFont systemFontOfSize:30];
    labelTitle.frame = CGRectMake(80, 0, WIDTH - 160, 60);
    [self.view addSubview:labelTitle];
    
    
    self.textField = [[UITextField alloc] init];
    [self.view addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelTitle.mas_bottom).with.offset(10);
        make.height.mas_equalTo(50);
        make.left.equalTo(self.view).with.offset(30);
        make.right.equalTo(self.view.mas_right).with.offset(-30);
    }];
    self.textField.backgroundColor = [UIColor systemGray6Color];
    self.textField.textColor = [UIColor greenColor];
    self.textField.placeholder = @"请输入六位签到码数字";
    
    
}

//使用KVO来监听textField
- (void) textFieldChanged {
    
}



- (void) pressBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
