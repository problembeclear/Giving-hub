//
//  LoginViewController.m
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/1/15.
//

#import "LoginViewController.h"
#import "LoginView.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(returnToSettingsView) name:@"pressReturn" object:nil];
    
    LoginView* login = [[LoginView alloc] init];
    [login LayoutSelf];
    [self.view addSubview:login];
    login.frame = self.view.bounds;
    
    
    
}

- (void) returnToSettingsView {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
