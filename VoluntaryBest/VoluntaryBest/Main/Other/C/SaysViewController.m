//
//  SaysViewController.m
//  VoluntaryBest
//
//  Created by 王璐 on 2023/2/5.
//

#import "SaysViewController.h"
#import "Model.h"
#import "Manager.h"
#import "Masonry.h"
#import "SaysView.h"
@interface SaysViewController ()

@end

@implementation SaysViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewSays = [[SaysView alloc] init];
    self.array = [[NSMutableArray alloc] init];
    self.viewSays.array = [[NSMutableArray alloc] init];
    self.dic = [[NSDictionary alloc] init];
    
    [[Manager shareManger]makeData:^(Model * _Nonnull ViewModel) {
        self.dic = [ViewModel toDictionary];
        [self.viewSays.array addObject:self.dic];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.dic = [ViewModel toDictionary];
            [self.viewSays.array addObject:self.dic];
            [self.viewSays initView];
        });
    } error:^(NSError * _Nonnull error) {
        NSLog(@"请求失败!");
    }];
    
    
//    [[Manager shareManger]makeData:^(Model * _Nonnull ViewModel) {
//        self.dic = [ViewModel toDictionary];
//        [self.viewSays.array addObject:self.dic];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.dic = [ViewModel toDictionary];
//            [self.viewSays.array addObject:self.dic];
//            [self.viewSays initView];
//        });
//    } error:^(NSError * _Nonnull error) {
//        NSLog(@"请求失败!");
//    }];
//    [[Manager shareManger]makeData:^(Model * _Nonnull ViewModel) {
//        self.dic = [ViewModel toDictionary];
//        [self.viewSays.array addObject:self.dic];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.dic = [ViewModel toDictionary];
//            [self.viewSays.array addObject:self.dic];
//            [self.viewSays initView];
//        });
//    } error:^(NSError * _Nonnull error) {
//        NSLog(@"请求失败!");
//    }];
//    [[Manager shareManger]makeData:^(Model * _Nonnull ViewModel) {
//        self.dic = [ViewModel toDictionary];
//        [self.viewSays.array addObject:self.dic];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.dic = [ViewModel toDictionary];
//            [self.viewSays.array addObject:self.dic];
//            [self.viewSays initView];
//        });
//    } error:^(NSError * _Nonnull error) {
//        NSLog(@"请求失败!");
//    }];
//    [[Manager shareManger]makeData:^(Model * _Nonnull ViewModel) {
//        self.dic = [ViewModel toDictionary];
//        [self.viewSays.array addObject:self.dic];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.dic = [ViewModel toDictionary];
//            [self.viewSays.array addObject:self.dic];
//            [self.viewSays initView];
//        });
//    } error:^(NSError * _Nonnull error) {
//        NSLog(@"请求失败!");
//    }];
//    [[Manager shareManger]makeData:^(Model * _Nonnull ViewModel) {
//        self.dic = [ViewModel toDictionary];
//        [self.viewSays.array addObject:self.dic];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.dic = [ViewModel toDictionary];
//            [self.viewSays.array addObject:self.dic];
//            [self.viewSays initView];
//        });
//    } error:^(NSError * _Nonnull error) {
//        NSLog(@"请求失败!");
//    }];
//    [[Manager shareManger]makeData:^(Model * _Nonnull ViewModel) {
//        self.dic = [ViewModel toDictionary];
//        [self.viewSays.array addObject:self.dic];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.dic = [ViewModel toDictionary];
//            [self.viewSays.array addObject:self.dic];
//            [self.viewSays initView];
//        });
//    } error:^(NSError * _Nonnull error) {
//        NSLog(@"请求失败!");
//    }];
//    [[Manager shareManger]makeData:^(Model * _Nonnull ViewModel) {
//        self.dic = [ViewModel toDictionary];
//        [self.viewSays.array addObject:self.dic];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.dic = [ViewModel toDictionary];
//            [self.viewSays.array addObject:self.dic];
//            [self.viewSays initView];
//        });
//    } error:^(NSError * _Nonnull error) {
//        NSLog(@"请求失败!");
//    }];
//    [[Manager shareManger]makeData:^(Model * _Nonnull ViewModel) {
//        self.dic = [ViewModel toDictionary];
//        [self.viewSays.array addObject:self.dic];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.dic = [ViewModel toDictionary];
//            [self.viewSays.array addObject:self.dic];
//            [self.viewSays initView];
//        });
//    } error:^(NSError * _Nonnull error) {
//        NSLog(@"请求失败!");
//    }];
//    [[Manager shareManger]makeData:^(Model * _Nonnull ViewModel) {
//        self.dic = [ViewModel toDictionary];
//        [self.viewSays.array addObject:self.dic];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.dic = [ViewModel toDictionary];
//            [self.viewSays.array addObject:self.dic];
//            [self.viewSays initView];
//        });
//    } error:^(NSError * _Nonnull error) {
//        NSLog(@"请求失败!");
//    }];

    //self.viewSays.array = self.array;
    [self.view addSubview:self.viewSays];
    [self.viewSays mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.view.frame.size);
    }];
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
