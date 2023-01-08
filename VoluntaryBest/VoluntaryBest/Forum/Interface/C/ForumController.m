//
//  ForumController.m
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/1/5.
//

#import "ForumController.h"
#import "ForumView.h"
#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
@interface ForumController ()

@end

@implementation ForumController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = YES;

    ForumView* forumView = [[ForumView alloc] init];
    [self.view addSubview:forumView];
    forumView.frame = CGRectMake(0, 0, Width, Height);
    [forumView LayoutSelf];
    
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
