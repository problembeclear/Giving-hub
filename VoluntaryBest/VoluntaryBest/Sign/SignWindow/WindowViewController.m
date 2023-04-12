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
@property (nonatomic, strong) WindowView* WView;
@end

@implementation WindowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _WView = [[WindowView alloc] init];
    [_WView LayoutSelf];
    _WView.frame = CGRectMake(70, 200, WIDTH - 140, HEIGHT - 600);
    [self.view addSubview:_WView];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dismissToSignController) name:@"sendToWindowController" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(presentSign) name:@"getInSign" object:nil];
}

- (void) dismissToSignController {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void) presentSign {
    
    OperationViewController* OperationController = [[OperationViewController alloc] init];
//    OperationController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:OperationController animated:YES completion:nil];
}
@end
