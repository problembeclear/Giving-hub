//
//  AssistanceView.m
//  VoluntaryBest
//
//  Created by 王璐 on 2023/1/15.
//

#import "AssistanceView.h"
#import "Masonry.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height


@implementation AssistanceView
- (void)initView{
    
    self.backgroundColor = [UIColor whiteColor];
    NSArray* arrayForSegmentControl = @[@"儿童走失", @"支教招聘", @"环境保护"];
    self.segmentControlInForum = [[UISegmentedControl alloc] initWithItems:arrayForSegmentControl];
    [self addSubview:self.segmentControlInForum];
    [self.segmentControlInForum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(0);
        make.top.equalTo(self).with.offset(34);
        make.width.mas_equalTo(WIDTH);
        make.height.mas_equalTo(HEIGHT*0.06);
    }];
    self.segmentControlInForum.selectedSegmentIndex = 0;
    [self addSubview:self.segmentControlInForum];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
