//
//  SettingsController.m
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/1/5.
//

#import "SettingsController.h"
#import "SettingsView.h"
#import "Masonry.h"
#import "LoginViewController.h"
@interface SettingsController ()

@end

@implementation SettingsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(buildLoginInterface) name:@"pressImage" object:nil];
    
    SettingsView* myView = [[SettingsView alloc] init];
    
    [self.view addSubview:myView];
    
    [myView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.view.frame.size);
    }];
    
    [myView LayoutSelf];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void) buildLoginInterface {
    LoginViewController* loginViewController = [[LoginViewController alloc] init];
    loginViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:loginViewController animated:NO completion:nil];
    
}
@end
