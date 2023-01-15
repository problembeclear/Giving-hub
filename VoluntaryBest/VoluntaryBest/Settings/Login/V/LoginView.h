//
//  LoginView.h
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/1/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginView : UIView
@property (nonatomic, strong) UITextField* countField;
@property (nonatomic, strong) UITextField* passwordField;
- (void) LayoutSelf;
@end

NS_ASSUME_NONNULL_END
