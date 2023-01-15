//
//  MainPickerViewController.m
//  VoluntaryBest
//
//  Created by 王璐 on 2023/1/9.
//

#import "MainPickerViewController.h"
#import "MainPickerView.h"
#import "Masonry.h"
@interface MainPickerViewController ()

@end

@implementation MainPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MainPickerView* pickerView = [[MainPickerView alloc] init];
    
    [self.view addSubview:pickerView];
    
    [pickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.view.frame.size);
    }];
    
    
    [pickerView initView];
    
    
    
    
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
