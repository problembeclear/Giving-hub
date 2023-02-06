//
//  Manager.m
//  VoluntaryBest
//
//  Created by 王璐 on 2023/2/5.
//

#import "Manager.h"
static Manager* manager = nil;
@implementation Manager
+ (instancetype) shareManger {
    if (!manager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [[Manager alloc] init];
        });
    }
    return manager;
}
- (void)makeData:(TestSucceedBlock)succeedBlock error:(ErrorBlock)errorBlock {
    NSString *json = @"https://v.api.aa1.cn/api/api-wenan-yingwen/index.php?type=json";
        json = [json stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        NSURL *testUrl = [NSURL URLWithString:json];
        NSURLRequest *testRequest = [NSURLRequest requestWithURL:testUrl];
        NSURLSession *testSession = [NSURLSession sharedSession];
        NSURLSessionDataTask *testDataTask = [testSession dataTaskWithRequest:testRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (error == nil) {
                Model* JsonModelX = [[Model alloc] initWithData:data error:nil];
                succeedBlock(JsonModelX);
            } else {
                errorBlock(error);
            }
        }];
        [testDataTask resume];
}
@end
