//
//  ForumTableViewCell.h
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/1/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ForumTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView* headImage;
@property (nonatomic, strong) UILabel* labelName;
@property (nonatomic, strong) UILabel* labelTime;
@property (nonatomic, strong) UIButton* buttonMore;
@property (nonatomic, strong) UILabel* content;
@property (nonatomic, strong) UIView* viewForImage;
@property (nonatomic, strong) UILabel* labelLocation;
@property (nonatomic ,strong) UIButton* buttonLike;
@property (nonatomic, strong) UIButton* buttonComment;
@end

NS_ASSUME_NONNULL_END
