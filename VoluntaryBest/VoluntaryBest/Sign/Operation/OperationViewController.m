//
//  OperationViewController.m
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/4/12.
//

#import "OperationViewController.h"

@interface OperationViewController ()

@end

@implementation OperationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton* buttonBack = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonBack addTarget:self action:@selector(pressBack) forControlEvents:UIControlEventTouchUpInside];
    buttonBack.frame = CGRectMake(378, 10, 40, 40);
    [buttonBack setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
    [self.view addSubview:buttonBack];
    
}


- (void) pressBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
