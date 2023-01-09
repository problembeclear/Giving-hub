//
//  MainPickerView.h
//  VoluntaryBest
//
//  Created by 王璐 on 2023/1/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainPickerView : UIView
<UIPickerViewDelegate,
UIPickerViewDataSource>
@property (nonatomic, strong)UIPickerView* locationPicker;
- (void)initView;
@end

NS_ASSUME_NONNULL_END
