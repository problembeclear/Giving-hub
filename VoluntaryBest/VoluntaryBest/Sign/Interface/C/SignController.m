//
//  SignController.m
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/1/5.
//

#import "SignController.h"
#import "SignView.h"
#import "WindowViewController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@interface SignController () 


@end

@implementation SignController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden  = YES;
    
    SignView* view = [[SignView alloc]init];
    [view initView];
    view.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    [self.view addSubview:view];
    // Do any additional setup after loading the view.
//    [self mapView];
//    [self manager];
//    //请求允许访问位置
//    [self.manager requestAlwaysAuthorization];
//    [self.manager startUpdatingLocation];
    
//    AlertSignViewController* alertWindow = [AlertSignViewController alertControllerWithTitle:@"签到" message:@"dad" preferredStyle:UIAlertControllerStyleAlert];
//    [self presentViewController:alertWindow animated:YES completion:nil];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(PopSignWindow) name:@"callMyWindow" object:nil];

}


//点击绿色签到按钮
- (void) PopSignWindow {
    WindowViewController* WController = [[WindowViewController alloc] init];
    WController.modalPresentationStyle = UIModalPresentationPopover;
    [self presentViewController:WController animated:YES completion:nil];
}

@end
