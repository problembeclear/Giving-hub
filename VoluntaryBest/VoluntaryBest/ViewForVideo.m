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
    
    self.backgroundColor = [UIColor whiteColor];
    
//    UIImageView* backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.jpg"]];
//    backgroundView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
//
//    [self addSubview:backgroundView];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, 428, 826) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor systemGray6Color];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    
    
    [self addSubview:self.tableView];
    
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 250;
}
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;

}

- (CellForVideo*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellForVideo* cell = [tableView dequeueReusableCellWithIdentifier:@"100"];
    
    if (cell == nil) {
        cell = [[CellForVideo alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[NSString stringWithFormat:@"%ld%ld", indexPath.row, indexPath.section]];
    }
    
    [cell layoutWithVideoCoverUrl:@"videoImage.png" videoUrl:@"https://webdownload.wmupd.com/webdownload/client/2dian5xiandaopv.mp4"];
    return  cell;
}
@end
