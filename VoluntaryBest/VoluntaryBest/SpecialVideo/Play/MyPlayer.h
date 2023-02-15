//
//  MyPlayer.h
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/2/15.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface MyPlayer : NSObject
+ (MyPlayer*) Player;
- (void) playWithVideoWithUrl: (NSString*) videoUrl attachView: (UIView*) attachView;
@end

NS_ASSUME_NONNULL_END
