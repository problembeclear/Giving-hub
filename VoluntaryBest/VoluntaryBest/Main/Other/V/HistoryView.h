//
//  HistoryView.h
//  VoluntaryBest
//
//  Created by 王璐 on 2023/2/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HistoryView : UIView
- (void)initView;
@property (nonatomic, copy) NSDictionary* dictionaryHistory;
@property (nonatomic, strong) UIScrollView* scrollViewBack;
@end

NS_ASSUME_NONNULL_END
