//
//  ManagerTwo.m
//  VoluntaryBest
//
//  Created by 王璐 on 2023/2/26.
//

#import "ManagerTwo.h"

static ManagerTwo* manager = nil;
@implementation ManagerTwo
+ (instancetype) shareManger {
    if (!manager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [[ManagerTwo alloc] init];
        });
    }
    return manager;
}
- (void)makeData:(TestSucceedBlock)succeedBlock error:(ErrorBlock)errorBlock {
    NSString *json = @"https://api.asilu.com/today";
        json = [json stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        NSURL *testUrl = [NSURL URLWithString:json];
        NSURLRequest *testRequest = [NSURLRequest requestWithURL:testUrl];
        NSURLSession *testSession = [NSURLSession sharedSession];
        NSURLSessionDataTask *testDataTask = [testSession dataTaskWithRequest:testRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (error == nil) {
                ModelTwo* JsonModelX = [[ModelTwo alloc] initWithData:data error:nil];
                succeedBlock(JsonModelX);
            } else {
                errorBlock(error);
            }
        }];
        [testDataTask resume];
}
@end
