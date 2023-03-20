//
//  Manager.m
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/3/19.
//

#import "ManagerA.h"

static ManagerA* managerTest = nil;

@implementation ManagerA
+ (instancetype)shareManage {
    if (!managerTest) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            managerTest = [ManagerA new];
        });
    }
    return managerTest;
}



@end
