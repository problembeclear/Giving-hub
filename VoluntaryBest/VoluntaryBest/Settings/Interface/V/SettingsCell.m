//
//  SettingsCell.m
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/2/15.
//

#import "SettingsCell.h"
#import "Masonry.h"

#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
@implementation SettingsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.imageInSetting = [[UIImageView alloc] init];
    [self.contentView addSubview:self.imageInSetting];
    
    self.labelInSetting = [[UILabel alloc] init];
    [self.contentView addSubview:self.labelInSetting];
    
    
    return self;
}


- (void) layoutSubviews {
    self.labelInSetting.textColor = [UIColor blackColor];
    
    
    [self.imageInSetting mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(10);
        make.left.equalTo(self).with.offset(10);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
    
    [self.labelInSetting mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageInSetting.mas_right).with.offset(5);
        make.top.equalTo(self).with.offset(10);
        make.bottom.equalTo(self).with.offset(-10);
        make.width.mas_equalTo(Width*0.4);
    }];
    
    
    
}
@end
