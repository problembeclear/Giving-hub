//
//  AssistanceController.m
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/1/5.
//

#import "AssistanceController.h"
#import "ViewForVideo.h"

@interface AssistanceController ()

@end

@implementation AssistanceController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBarHidden = YES;
    
    
    ViewForVideo* viewForVideo = [[ViewForVideo alloc] init];
    
    [viewForVideo initSelf];
    
    [self.view addSubview:viewForVideo];
    
    viewForVideo.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    
}



@end
