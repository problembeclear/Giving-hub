//
//  TabViewController.m
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/2/15.
//

#import "TabViewController.h"
#import "MainController.h"
#import "AssistanceController.h"
#import "SignController.h"
#import "ForumController.h"
#import "SettingsController.h"
#import "FMDB.h"
#import "Masonry.h"
@interface TabViewController ()

@end

@implementation TabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    
    UIImageView* preView = [[UIImageView alloc] init] ;
    
    preView.image = [UIImage imageNamed:@"qidongtu.jpg"] ;
    
    preView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [self.view addSubview:preView] ;

    //计时器来添加加载事件
    NSTimer* preTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(startMainView) userInfo:nil repeats:NO] ;
    [[NSRunLoop currentRunLoop] addTimer:preTimer forMode:NSDefaultRunLoopMode] ;
    
    
}

- (void) startMainView {
    //在初始的控制器创建五个控制器并组成分栏控制器
    MainController* controllerForMain = [[MainController alloc] init];
    AssistanceController* controllerForAssistance = [[AssistanceController alloc] init];
    SignController* controllerForSign = [[SignController alloc] init];
    ForumController* controllerForForum = [[ForumController alloc] init];
    SettingsController* controllerForSettings = [[SettingsController alloc] init];
    
    controllerForMain.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[[UIImage imageNamed:@"shouye-3"]imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:
        @"shouye-4"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    controllerForAssistance.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"video" image:[[UIImage imageNamed:@"video-6.png"]imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:
        @"video-4.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    controllerForSign.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"签到" image:[[UIImage imageNamed:@"dingwei"]imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:
        @"dingwei-2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    controllerForForum.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"公益圈" image:[[UIImage imageNamed:@"friends"]imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:
        @"friends-2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    controllerForSettings.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[[UIImage imageNamed:@"wode"]imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:
        @"wode-2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    

    
    UINavigationController* navMain = [[UINavigationController alloc] initWithRootViewController:controllerForMain];
    UINavigationController* navAssistance = [[UINavigationController alloc] initWithRootViewController:controllerForAssistance];
    UINavigationController* navSign = [[UINavigationController alloc] initWithRootViewController:controllerForSign];
    UINavigationController* navForum = [[UINavigationController alloc] initWithRootViewController:controllerForForum];
    UINavigationController* navSettings = [[UINavigationController alloc] initWithRootViewController:controllerForSettings];
    
    //使导航栏上方不留白，并设置颜色
    UINavigationBarAppearance* appear = [[UINavigationBarAppearance alloc] init];
    [appear configureWithOpaqueBackground];
    appear.backgroundColor = [UIColor greenColor];
    appear.shadowColor = [UIColor clearColor];
    
    navMain.navigationBar.standardAppearance = appear;
    navMain.navigationBar.scrollEdgeAppearance = appear;
    
    navAssistance.navigationBar.standardAppearance = appear;
    navAssistance.navigationBar.scrollEdgeAppearance = appear;
    
    navSign.navigationBar.standardAppearance = appear;
    navSign.navigationBar.scrollEdgeAppearance = appear;
    
    navForum.navigationBar.standardAppearance = appear;
    navForum.navigationBar.scrollEdgeAppearance = appear;
    
    navSettings.navigationBar.standardAppearance = appear;
    navSettings.navigationBar.scrollEdgeAppearance = appear;
    
    //准备用来初始化tabBarController的array
    NSArray* arrayForTabBarController = @[navMain, navAssistance, navSign, navForum, navSettings];
    //初始化分栏控制器
    UITabBarController* tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = arrayForTabBarController;
    //背景色
    tabBarController.tabBar.backgroundColor = [UIColor systemGray6Color];
    //透明度
    tabBarController.tabBar.translucent = NO;
    //呈现风格
    tabBarController.modalPresentationStyle = UIModalPresentationFullScreen;
    //初始所在界面
    tabBarController.selectedIndex = 0;
    
    [self presentViewController:tabBarController animated:NO completion:nil];
}



@end
