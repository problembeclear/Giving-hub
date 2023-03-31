//
//  RubbishViewController.m
//  VoluntaryBest
//
//  Created by 王璐 on 2023/3/31.
//

#import "RubbishViewController.h"
#import "RubbishView.h"
#import "Masonry.h"
@interface RubbishViewController ()

@end

@implementation RubbishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    RubbishView* rubbishView = [[RubbishView alloc] init];
    
    
    [self.view addSubview:rubbishView];
    
    [rubbishView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.view.frame.size);
    }];
    [rubbishView initView];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mainView) name:@"returnMain" object:nil];
    
    // Do any additional setup after loading the view.
}
- (void)mainView{
    [self dismissViewControllerAnimated:NO completion:nil];
}
- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"returnMain" object:nil];
    
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
