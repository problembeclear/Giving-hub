//
//  ManagerThree.h
//  VoluntaryBest
//
//  Created by 王璐 on 2023/3/31.
//

#import <Foundation/Foundation.h>
#import "ModelThree.h"
NS_ASSUME_NONNULL_BEGIN

typedef void (^TestSucceedBlock) (ModelThree* ViewModel);
typedef void (^ErrorBlock) (NSError* error);
@interface ManagerThree : NSObject
+ (instancetype) shareManger;
- (void) makeData:(TestSucceedBlock) succeedBlock error:(ErrorBlock) errorBlock andText:(NSString*)text;
@end

NS_ASSUME_NONNULL_END
