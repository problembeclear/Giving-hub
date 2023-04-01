//
//  ErShiSiViewController.m
//  VoluntaryBest
//
//  Created by 王璐 on 2023/2/25.
//

#import "ErShiSiViewController.h"
#import "ErShiSiView.h"
#import "Masonry.h"
@interface ErShiSiViewController ()

@end

@implementation ErShiSiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    ErShiSiView* erShiSiView = [[ErShiSiView alloc] init];
    
    [self.view addSubview:erShiSiView];
    
    [erShiSiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.view.frame.size);
    }];
    
    
    [erShiSiView initView];
    
    
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
