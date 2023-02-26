//
//  ManagerTwo.h
//  VoluntaryBest
//
//  Created by 王璐 on 2023/2/26.
//

#import <Foundation/Foundation.h>
#import "ModelTwo.h"
NS_ASSUME_NONNULL_BEGIN

typedef void (^TestSucceedBlock) (ModelTwo* ViewModel);
typedef void (^ErrorBlock) (NSError* error);
@interface ManagerTwo : NSObject
+ (instancetype) shareManger;
- (void) makeData:(TestSucceedBlock) succeedBlock error:(ErrorBlock) errorBlock;

@end

NS_ASSUME_NONNULL_END
