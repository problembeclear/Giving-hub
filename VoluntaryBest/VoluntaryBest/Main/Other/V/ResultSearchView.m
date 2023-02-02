//
//  ResultSearchView.m
//  VoluntaryBest
//
//  Created by 王璐 on 2023/2/3.
//

#import "ResultSearchView.h"
#import "Masonry.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
@implementation ResultSearchView
- (void) initView {
    
    self.backgroundColor = [UIColor grayColor];
    
    
    UILabel* labelBack = [[UILabel alloc] init];
    labelBack.backgroundColor = [UIColor whiteColor];
    [self addSubview:labelBack];
    [labelBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(0);
        make.top.equalTo(self).with.offset(0);
        make.width.mas_equalTo(WIDTH);
        make.height.mas_equalTo(120);
        
    }];
    
    UIButton* buttonReturnMain = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonReturnMain setImage:[UIImage imageNamed:@"return.png"] forState:UIControlStateNormal];
    [self addSubview:buttonReturnMain];
    buttonReturnMain.titleLabel.font = [UIFont systemFontOfSize:50];
    [buttonReturnMain setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonReturnMain mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(15);
        make.top.equalTo(self).with.offset(34);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
        
    }];
    [buttonReturnMain addTarget:self action:@selector(returnSearch) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"returnSearch" object:nil];


    UIButton* buttonActivity = [[UIButton alloc] init];
    [self addSubview:buttonActivity];
    [buttonActivity setTitle:@"活动" forState:UIControlStateNormal];
    [buttonActivity setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonActivity mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset( 140 + (WIDTH - 80 - 200)/3 );
        make.top.equalTo(self).with.offset(54);
        make.width.mas_equalTo((WIDTH - 80 - 200)/3 );
        make.height.mas_equalTo(70);
        
    }];
    [buttonActivity addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    buttonActivity.tag = 2;
    
    
    
    
    UIButton* buttonOrganization = [[UIButton alloc] init];
    [self addSubview:buttonOrganization];
    [buttonOrganization setTitle:@"组织" forState:UIControlStateNormal];
    [buttonOrganization setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonOrganization mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(240 + (WIDTH - 280)/3*2 );
        make.top.equalTo(self).with.offset(54);
        make.width.mas_equalTo((WIDTH - 80 - 200)/3);
        make.height.mas_equalTo(70);
        
    }];
    [buttonOrganization addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    buttonOrganization.tag = 3;
    
    
    UIButton* buttonEssay = [[UIButton alloc] init];
    [self addSubview:buttonEssay];
    [buttonEssay setTitle:@"文章" forState:UIControlStateNormal];
    [buttonEssay setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonEssay mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(40);
        make.top.equalTo(self).with.offset(54);
        make.width.mas_equalTo((WIDTH - 80 - 200)/3);
        make.height.mas_equalTo(70);
    }];
    [buttonEssay addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    buttonEssay.tag = 1;
    self.labelButtonBack = [[UILabel alloc] init];
    self.labelButtonBack.backgroundColor = [UIColor colorWithRed:100.0/255 green:200.0/255 blue:149.0/255 alpha:1];
    [self addSubview:self.labelButtonBack];
    [self.labelButtonBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(40);
        make.top.equalTo(self).with.offset(104);
        make.width.mas_equalTo((WIDTH - 80 - 200)/3 );
        make.height.mas_equalTo(10);
        
    }];
}
- (void)pressButton:(UIButton*)button {
    [self.labelButtonBack removeFromSuperview];
    self.labelButtonBack = [[UILabel alloc] init];
    self.labelButtonBack.backgroundColor = [UIColor colorWithRed:100.0/255 green:200.0/255 blue:149.0/255 alpha:1];
    [self addSubview:self.labelButtonBack];
    if (button.tag == 1) {
        [self.labelButtonBack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).with.offset(40);
            make.top.equalTo(self).with.offset(104);
            make.width.mas_equalTo((WIDTH - 80 - 200)/3 );
            make.height.mas_equalTo(10);
            
        }];
    } else if (button.tag == 2) {
        [self.labelButtonBack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).with.offset( 140 + (WIDTH - 80 - 200)/3 );
            make.top.equalTo(self).with.offset(104);
            make.width.mas_equalTo((WIDTH - 80 - 200)/3 );
            make.height.mas_equalTo(10);
            
        }];
    } else if (button.tag == 3) {
        [self.labelButtonBack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).with.offset(240 + (WIDTH - 280)/3*2 );
            make.top.equalTo(self).with.offset(104);
            make.width.mas_equalTo((WIDTH - 80 - 200)/3 );
            make.height.mas_equalTo(10);
            
        }];
    }
}
- (void)returnSearch{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"returnSearch" object:nil];
    
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"returnSearch" object:nil];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
