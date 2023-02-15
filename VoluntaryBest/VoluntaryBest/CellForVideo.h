//
//  CellForVideo.h
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/2/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CellForVideo : UITableViewCell
- (void) layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl ;
@end

NS_ASSUME_NONNULL_END
