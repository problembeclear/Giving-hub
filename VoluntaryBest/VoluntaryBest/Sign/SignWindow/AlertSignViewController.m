//
//  AlertSignViewController.m
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/4/12.
//

#import "AlertSignViewController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@interface AlertSignViewController ()

@end

@implementation AlertSignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIAlertAction* define = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
   [self addAction:define];

    
}



@end
