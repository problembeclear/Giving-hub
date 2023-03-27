//
//  SignController.m
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/1/5.
//

#import "SignController.h"
#import "SignView.h"
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
  
}

@end
