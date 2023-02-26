//
//  SignView.m
//  VoluntaryBest
//
//  Created by 王璐 on 2023/2/25.
//

#import "SignView.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@implementation SignView
- (void)initView {
    self.backgroundColor = [UIColor yellowColor];
    UIImageView* preView = [[UIImageView alloc] init] ;
    
    preView.image = [UIImage imageNamed:@"qiandaojiemiantu.jpg"] ;
    
    preView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    
    [self addSubview:preView] ;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
