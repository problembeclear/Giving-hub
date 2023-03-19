//
//  Manager.m
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/3/19.
//

#import "Manager.h"

static Manager* managerTest = nil;

@implementation Manager
+ (instancetype)shareManage {
    if (!managerTest) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            managerTest = [Manager new];
        });
    }
    return managerTest;
}



@end
