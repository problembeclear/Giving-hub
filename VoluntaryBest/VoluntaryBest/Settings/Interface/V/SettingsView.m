//
//  SettingsView.m
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/1/6.
//

#import "SettingsView.h"
#import "Masonry.h"

#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height

@implementation SettingsView

- (void) LayoutSelf {
    self.backgroundColor = [UIColor whiteColor];
    
    [self LayoutButtons];
}
- (void) LayoutButtons {
    //头像
    UIButton* buttonHeadImage = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self addSubview:buttonHeadImage];
    [buttonHeadImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.mas_offset(Width*0.1);
        make.top.equalTo(self).with.mas_offset(Height*0.1);
        make.height.mas_equalTo(Width*0.15);
        make.width.mas_equalTo(Width*0.15);
    }];
    
    [buttonHeadImage setBackgroundImage:[UIImage imageNamed:@"touxiang.jpg"] forState:UIControlStateNormal];
    
    buttonHeadImage.layer.cornerRadius = Width*0.075;
    buttonHeadImage.layer.masksToBounds = YES;
    [buttonHeadImage addTarget:self action:@selector(replaceImage) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void) replaceImage {
    NSLog(@"11");
}

- (void) LayoutScrollView {
    
}
@end
