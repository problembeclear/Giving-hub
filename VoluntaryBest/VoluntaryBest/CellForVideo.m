//
//  CellForVideo.m
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/2/15.
//

#import "CellForVideo.h"
#import "MyPlayer.h"
#import "UIImageView+WebCache.h"
@interface CellForVideo ()
@property (nonatomic, strong, readwrite) UIImageView* coverView;
@property (nonatomic, strong, readwrite) UIImageView* playButton;
@property (nonatomic, copy, readwrite) NSString* videoUrl;
@end

@implementation CellForVideo

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
    
    self.coverView = [[UIImageView alloc] init];
    [self.contentView addSubview:self.coverView];
    
    self.playButton = [[UIImageView alloc] init];
    [self.contentView addSubview:self.playButton];
    
    return self;
}

- (void) layoutSubviews {
    
    self.coverView.frame = CGRectMake(0, 0, self.contentView.bounds.size.width, self.contentView.bounds.size.height);
    
    self.playButton.frame = CGRectMake(self.contentView.bounds.size.width / 2 - 25, self.contentView.bounds.size.height / 2 - 25, 50, 50);
    
    self.playButton.image = [UIImage imageNamed:@"bofang.png"];
    
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapToPlay)];
    [self addGestureRecognizer:tapGesture];
    
    
    
}
- (void) dealloc {
    
    
}
#pragma mark - public method

- (void) layoutWithVideoCoverUrl:(NSString *)videoCoverUrl videoUrl:(NSString *)videoUrl {
    NSURL* videoImageUrl = [NSURL URLWithString:videoUrl];
    
    [self.coverView sd_setImageWithURL:videoImageUrl placeholderImage:[UIImage imageNamed:@"videoImage.png"] options:SDWebImageRefreshCached];
    self.videoUrl = videoUrl;
    
}
#pragma mark - private method
- (void) tapToPlay {
    
    [[MyPlayer Player] playWithVideoWithUrl:self.videoUrl attachView:self.coverView];
}

@end
