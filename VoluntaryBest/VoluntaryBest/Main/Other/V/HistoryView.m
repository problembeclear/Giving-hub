//
//  HistoryView.m
//  VoluntaryBest
//
//  Created by 王璐 on 2023/2/26.
//

#import "HistoryView.h"
#import "Masonry.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@implementation HistoryView
- (void)initView{
    
    
    self.backgroundColor = [UIColor whiteColor];
    UIImageView* preView = [[UIImageView alloc] init] ;
    
    preView.image = [UIImage imageNamed:@"Main1.jpeg"] ;
    
    preView.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    
    [self addSubview:preView] ;
    
    
    
    
    self.scrollViewBack = [[UIScrollView  alloc] init];
    self.scrollViewBack.contentSize = CGSizeMake(WIDTH, HEIGHT*3);    self.scrollViewBack.backgroundColor = [UIColor clearColor];
    self.scrollViewBack.pagingEnabled = NO;
    self.scrollViewBack.scrollEnabled = YES;
    self.scrollViewBack.showsVerticalScrollIndicator = NO;
    self.scrollViewBack.showsHorizontalScrollIndicator = NO;
    [self addSubview:self.scrollViewBack];

    [self.scrollViewBack mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).with.offset(0);
            make.top.equalTo(self).with.offset(0);
            make.width.mas_equalTo(WIDTH);
            make.height.mas_equalTo(HEIGHT);
    }];
    [self.scrollViewBack setUserInteractionEnabled:YES];
    [self addSubview:self.scrollViewBack];
    //self.backgroundColor = [UIColor whiteColor];
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
    [buttonReturnMain addTarget:self action:@selector(returnMian) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    UILabel* label = [[UILabel alloc] init];
    label.text = @"历史今日";
    [self addSubview:label];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:28];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(buttonReturnMain).with.offset(30);
        make.top.equalTo(self).with.offset(34);
        make.width.mas_equalTo(WIDTH - 90);
        make.height.mas_equalTo(30);
        
    }];
    
    NSDate *dateOne = [NSDate date];
    NSDateFormatter *forMatter = [[NSDateFormatter alloc] init];
    [forMatter setDateFormat:@"dd"];
    NSString *dateStr = [forMatter stringFromDate:dateOne];
    
    //时间获取。月份
    NSDate *date =[NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MM"];
    NSString *dateStrTwo = [formatter stringFromDate:date];
    
    UILabel* labelDate = [[UILabel alloc] init];
    labelDate.text = [NSString stringWithFormat:@"%@月%@日", dateStrTwo,dateStr];
    [self.scrollViewBack addSubview:labelDate];
    labelDate.font = [UIFont boldSystemFontOfSize:30];
    [labelDate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(WIDTH*0.1);
        make.top.equalTo(self).with.offset(HEIGHT*0.1);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(30);
    }];
    
    
    for (int i = 0; i < [self.dictionaryHistory[@"data"] count] && i < 8; i++) {
        UILabel* labelYear = [[UILabel alloc] init];
        labelYear.text = [NSString stringWithFormat:@"%@年",self.dictionaryHistory[@"data"][i][@"year"]];
        [self.scrollViewBack addSubview:labelYear];
        [labelYear mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).with.offset(50);
            make.top.equalTo(self).with.offset(HEIGHT*0.1*(i + 1) + HEIGHT*0.05);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(30);
            
        }];
        
        
        UILabel* labelName = [[UILabel alloc] init];
        labelName.text = self.dictionaryHistory[@"data"][i][@"title"];
        [self.scrollViewBack addSubview:labelName];
        [labelName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(labelYear).with.offset(0);
            make.top.equalTo(labelYear).with.offset(30);
            make.width.mas_equalTo(WIDTH - 100);
            make.height.mas_equalTo(30);
        }];
        //labelName.backgroundColor = [UIColor whiteColor];
        
        UITextView* textView = [[UITextView alloc] init];
        textView.text = self.dictionaryHistory[@"data"][i][@"link"];
        [self.scrollViewBack addSubview:textView];
        [textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(labelName).with.offset(0);
            make.top.equalTo(labelName).with.offset(30);
            make.width.mas_equalTo(WIDTH - 100);
            make.height.mas_equalTo(30);
        }];
        textView.backgroundColor = [UIColor clearColor];
        textView.dataDetectorTypes = UIDataDetectorTypeAll;
        textView.editable = NO;
        textView.font = [UIFont systemFontOfSize:15];
    }
}
- (void)returnMian{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"returnMain" object:nil];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
