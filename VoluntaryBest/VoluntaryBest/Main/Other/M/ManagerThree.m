//
//  ManagerThree.m
//  VoluntaryBest
//
//  Created by 王璐 on 2023/3/31.
//

#import "ManagerThree.h"

static ManagerThree* manager = nil;
@implementation ManagerThree
+ (instancetype) shareManger {
    if (!manager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [[ManagerThree alloc] init];
        });
    }
    return manager;
}
- (void)makeData:(TestSucceedBlock)succeedBlock error:(ErrorBlock)errorBlock andText:(NSString*)text{
    
    NSString* str = [NSString stringWithFormat:@"https://www.mxnzp.com/api/rubbish/type?name=%@&app_id=rgihdrm0kslojqvm&app_secret=WnhrK251TWlUUThqaVFWbG5OeGQwdz09", text];
    NSString *json = str;
    json = [json stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *testUrl = [NSURL URLWithString:json];
    NSURLRequest *testRequest = [NSURLRequest requestWithURL:testUrl];
    NSURLSession *testSession = [NSURLSession sharedSession];
    NSURLSessionDataTask *testDataTask = [testSession dataTaskWithRequest:testRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary*dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        if (error == nil) {
            ModelThree* JsonModelX = [[ModelThree alloc] initWithData:data error:nil];
        //    NSLog(@"11111%@", JsonModelX);
            succeedBlock(JsonModelX);
        } else {
            errorBlock(error);
        }
    }];
    [testDataTask resume];
}
@end
