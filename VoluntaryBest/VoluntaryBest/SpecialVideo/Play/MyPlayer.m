//
//  MyPlayer.m
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/2/15.
//

#import "MyPlayer.h"
#import <AVFoundation/AVFoundation.h>

@interface MyPlayer ()
@property (nonatomic, strong, readwrite) AVPlayer* avPlayer;
@property (nonatomic, strong, readwrite) AVPlayerLayer* playerLayer;
@property (nonatomic, strong, readwrite) AVPlayerItem* videoItem;
@end
@implementation MyPlayer

+ (MyPlayer*) Player {
    static MyPlayer* player;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        player = [[MyPlayer alloc] init];
    });
    return player;
}

- (void) playWithVideoWithUrl:(NSString *)videoUrl attachView:(UIView*)attachView {
    [self stopPlay];
    
    NSURL* videoURL = [NSURL URLWithString:videoUrl];
    AVAsset* asset = [AVAsset assetWithURL:videoURL];
    self.videoItem = [AVPlayerItem playerItemWithAsset:asset];
    [self.videoItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [self.videoItem addObserver:self forKeyPath:@"loadTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
    
    CMTime duration = self.videoItem.duration;
    CGFloat videoDuration = CMTimeGetSeconds(duration);
    
    
    
    self.avPlayer = [AVPlayer playerWithPlayerItem:self.videoItem];
    [self.avPlayer addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        NSLog(@"播放进度:%@", @(CMTimeGetSeconds(time)));
    }];
    
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.avPlayer];
    
    
    self.playerLayer.frame = attachView.bounds;
    [attachView.layer addSublayer:self.playerLayer];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handlePlayEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
}
#pragma mark - private method
- (void) stopPlay {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self.playerLayer removeFromSuperlayer];
    [self.videoItem removeObserver:self forKeyPath:@"status"];
    [self.videoItem removeObserver:self forKeyPath:@"loadTimeRanges"];
    
    self.videoItem = nil;
    self.avPlayer = nil;
}



- (void) handlePlayEnd {
    [self.avPlayer seekToTime:CMTimeMake(0, 1)];
    [self.avPlayer play];
    
}

#pragma mark - KVO
- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"status"]) {
        if (((NSNumber*)[change objectForKey:NSKeyValueChangeNewKey]).integerValue == AVPlayerItemStatusReadyToPlay) {
            [self.avPlayer play];
        } else {
            NSLog(@"oovoo");
        }
    } else if ([keyPath isEqualToString:@"loadTimeRanges"]) {
        NSLog(@"缓冲: %@", [change objectForKey:NSKeyValueChangeNewKey]);
    }
}
@end
