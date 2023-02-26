//
//  ViewForVideo.m
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/2/15.
//

#import "ViewForVideo.h"
#import "CellForVideo.h"


@interface ViewForVideo ()
@property (nonatomic, strong) UITableView* tableView;
@end

@implementation ViewForVideo

- (void) initSelf {
    
    self.backgroundColor = [UIColor blackColor];
    
    UIImageView* backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.jpg"]];
    backgroundView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    
   
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 428, 843) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor systemGray6Color];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    
    self.tableView.backgroundView = backgroundView;
    
    [self addSubview:self.tableView];
    
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 250;

}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50;
}
- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001;
}
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;

}

- (CellForVideo*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellForVideo* cell = [tableView dequeueReusableCellWithIdentifier:@"100"];
    
    if (cell == nil) {
        cell = [[CellForVideo alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[NSString stringWithFormat:@"%ld%ld", indexPath.row, indexPath.section]];
    }
    
    [cell layoutWithVideoCoverUrl:@"http://img.kaiyanapp.com/a13867a4345e6e8bf516650821af885d.jpeg?imageMogr2/quality/60/format/jpg" videoUrl:@"http://baobab.kaiyanapp.com/api/v1/playUrl?vid=316658&resourceType=video&editionType=default&source=aliyun&playUrlType=url_oss&udid="];
    
    return  cell;
}
@end
