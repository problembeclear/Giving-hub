//
//  MainController.m
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/1/5.
//

#import "MainController.h"
#import "MainView.h"
#import "Masonry.h"
#import "LocationViewController.h"
#import "NewsViewController.h"
#import "ScanviewController.h"
#import "SearchViewController.h"
@interface MainController ()

@end

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];
    //隐藏导航栏
    self.navigationController.navigationBarHidden = YES;
    
    
    //添加view
    MainView* mainView = [[MainView alloc] init];
    [self.view addSubview:mainView];
    [mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.view.frame.size);
    }];
    [mainView initView];
    
    
    //通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(locationView) name:@"pressLocationButton" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(searchView) name:@"pressSearchButton" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(scanView) name:@"pressScanButton" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(newsView) name:@"pressNewsButton" object:nil];
    // Do any additional setup after loading the view.
}
- (void)locationView{
    LocationViewController* pickerController = [[LocationViewController alloc] init];
    pickerController.modalPresentationStyle = UIModalPresentationFullScreen;
    pickerController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:pickerController animated:YES completion:nil];
}
- (void)searchView{
    SearchViewController* pickerController = [[SearchViewController alloc] init];
    pickerController.modalPresentationStyle = UIModalPresentationFullScreen;
    pickerController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:pickerController animated:YES completion:nil];
    
}
- (void)scanView{
    ScanViewController* pickerController = [[ScanViewController alloc] init];
    pickerController.modalPresentationStyle = UIModalPresentationFullScreen;
    pickerController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:pickerController animated:YES completion:nil];
    
}
- (void)newsView{
    NewsViewController* pickerController = [[NewsViewController alloc] init];
    pickerController.modalPresentationStyle = UIModalPresentationFullScreen;
    pickerController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:pickerController animated:YES completion:nil];
    
}
- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"pressSearchButton" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"pressLocationButton" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"pressScanButton" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"pressNewsButton" object:nil];

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
