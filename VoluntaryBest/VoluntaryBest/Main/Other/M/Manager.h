//
//  Manager.h
//  VoluntaryBest
//
//  Created by 王璐 on 2023/2/5.
//

#import <Foundation/Foundation.h>
#import "Model.h"
NS_ASSUME_NONNULL_BEGIN


typedef void (^TestSucceedBlock) (Model* ViewModel);
typedef void (^ErrorBlock) (NSError* error);
@interface Manager : NSObject
+ (instancetype) shareManger;
- (void) makeData:(TestSucceedBlock) succeedBlock error:(ErrorBlock) errorBlock;
@end

NS_ASSUME_NONNULL_END
