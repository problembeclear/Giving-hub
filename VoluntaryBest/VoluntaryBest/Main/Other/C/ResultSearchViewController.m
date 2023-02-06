//
//  ResultSearchViewController.m
//  VoluntaryBest
//
//  Created by 王璐 on 2023/2/3.
//

#import "ResultSearchViewController.h"
#import "ResultSearchView.h"
#import "Masonry.h"
@interface ResultSearchViewController ()

@end

@implementation ResultSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ResultSearchView* resultView = [[ResultSearchView alloc] init];
    
    [self.view addSubview:resultView];
    
    [resultView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.view.frame.size);
    }];
    
    
    [resultView initView];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(searchView) name:@"returnSearch" object:nil];
    // Do any additional setup after loading the view.
}
- (void)searchView {
    [self dismissViewControllerAnimated:NO completion:nil];
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
