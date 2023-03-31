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
#import "SaysViewController.h"
#import "ErShiSiViewController.h"
#import "HistoryViewController.h"
#import "RubbishViewController.h"
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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saysView) name:@"pressSaysButton" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(erShiSiView) name:@"pressErShiSIiButton" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(historyView) name:@"pressHistoryButton" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(rubbishButton) name:@"pressRubbishButton" object:nil];
    
    // Do any additional setup after loading the view.
}
- (void)saysView {
    self.saysViewController = [[SaysViewController alloc] init];
    self.saysViewController.modalPresentationStyle = UIModalPresentationFullScreen;
    self.saysViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:self.saysViewController animated:NO completion:nil];
}
- (void)locationView{
    LocationViewController* pickerController = [[LocationViewController alloc] init];
    pickerController.modalPresentationStyle = UIModalPresentationFullScreen;
    pickerController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:pickerController animated:NO completion:nil];
}
- (void)searchView{
    SearchViewController* pickerController = [[SearchViewController alloc] init];
    pickerController.modalPresentationStyle = UIModalPresentationFullScreen;
    pickerController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:pickerController animated:NO completion:nil];
    
}
- (void)scanView{
    ScanViewController* pickerController = [[ScanViewController alloc] init];
    pickerController.modalPresentationStyle = UIModalPresentationFullScreen;
    pickerController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:pickerController animated:NO completion:nil];
    
}
- (void)newsView{
    NewsViewController* pickerController = [[NewsViewController alloc] init];
    pickerController.modalPresentationStyle = UIModalPresentationFullScreen;
    pickerController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:pickerController animated:NO completion:nil];
    
}
- (void)erShiSiView{
    ErShiSiViewController* pickerController = [[ErShiSiViewController alloc] init];
    pickerController.modalPresentationStyle = UIModalPresentationFullScreen;
    pickerController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:pickerController animated:NO completion:nil];
    
}
- (void)historyView {
    
    HistoryViewController* pickerController = [[HistoryViewController alloc] init];
    pickerController.modalPresentationStyle = UIModalPresentationFullScreen;
    pickerController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:pickerController animated:NO completion:nil];
}
- (void)rubbishButton {
    
    RubbishViewController* pickerController = [[RubbishViewController alloc] init];
    pickerController.modalPresentationStyle = UIModalPresentationFullScreen;
    pickerController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:pickerController animated:NO completion:nil];
}
- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"pressSearchButton" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"pressLocationButton" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"pressScanButton" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"pressNewsButton" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"pressSaysButton" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"pressErShiSIiButton" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"pressHistoryButton" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"pressRubbishButton" object:nil];
    
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
