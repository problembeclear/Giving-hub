//
//  SearchViewController.m
//  VoluntaryBest
//
//  Created by 王璐 on 2023/1/15.
//

#import "SearchViewController.h"
#import "SearchView.h"
#import "Masonry.h"
@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SearchView* searchView = [[SearchView alloc] init];
    
    [self.view addSubview:searchView];
    
    [searchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.view.frame.size);
    }];
    
    
    [searchView initView];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mainView) name:@"returnMain" object:nil];
    // Do any additional setup after loading the view.
}
- (void)mainView{
    [self dismissViewControllerAnimated:YES completion:nil];
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
