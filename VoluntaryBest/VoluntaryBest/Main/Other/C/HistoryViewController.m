//
//  HistoryViewController.m
//  VoluntaryBest
//
//  Created by 王璐 on 2023/2/26.
//

#import "HistoryViewController.h"
#import "Masonry.h"
#import "HistoryView.h"
#import "ManagerTwo.h"
#import "ModelTwo.h"
@interface HistoryViewController ()

@end

@implementation HistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.historyView = [[HistoryView alloc] init];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    //[self.historyView initView];
    self.historyView.dictionaryHistory = [[NSDictionary alloc] init];
    [[ManagerTwo shareManger]makeData:^(ModelTwo * _Nonnull ViewModel) {
        NSDictionary* dic = [[NSDictionary alloc] init];
        dic = [ViewModel toDictionary];
        self.historyView.dictionaryHistory = dic;
        //self.dic = [ViewModel toDictionary];
        //[self.viewSays.array addObject:self.dic];
        dispatch_async(dispatch_get_main_queue(), ^{
//            self.dic = [ViewModel toDictionary];
//            [self.viewSays.array addObject:self.dic];
            [self.historyView initView];
        });
    } error:^(NSError * _Nonnull error) {
        NSLog(@"请求失败!");
    }];
//    [[ManagerTwo shareManger]makeData:^(ModelTwo * _Nonnull ViewModel) {
//        NSDictionary* dic = [[NSDictionary alloc] init];
//        dic = [ViewModel toDictionary];
//        self.historyView.dictionaryHistory = dic;
//        //NSLog(@"%@", historyView.dictionaryHistory);
//    } error:^(NSError * _Nonnull error) {
//        NSLog(@"请求失败!");
//    }];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mainView) name:@"returnMain" object:nil];
    
    
    
    [self.historyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.view.frame.size);
    }];
    [self.view addSubview:self.historyView];
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
