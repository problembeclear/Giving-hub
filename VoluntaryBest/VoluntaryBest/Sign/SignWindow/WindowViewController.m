//
//  WindowViewController.m
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/4/12.
//

#import "WindowViewController.h"
#import "WindowView.h"
#import "OperationViewController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@interface WindowViewController ()

@end

@implementation WindowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    WindowView* WView = [[WindowView alloc] init];
    [WView LayoutSelf];
    WView.frame = CGRectMake(100, 300, WIDTH - 200, HEIGHT - 600);
    [self.view addSubview:WView];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismissToSignController) name:@"sendToWindowController" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(presentSign) name:@"getInSign" object:nil];
}

- (void) dismissToSignController {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void) presentSign {
    OperationViewController* OperationController = [[OperationViewController alloc] init];
    [self presentViewController:OperationController animated:YES completion:nil];


}
@end
