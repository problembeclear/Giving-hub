//
//  ViewForVideo.m
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/2/15.
//

#import "ViewForVideo.h"
#import "CellForVideo.h"
#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height

@interface ViewForVideo ()
@property (nonatomic, strong) UITableView* tableView;
@end

@implementation ViewForVideo

- (void) initSelf {
    
    self.backgroundColor = [UIColor blackColor];
    
    UIImageView* backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backgroundForVideo.jpeg"]];
    backgroundView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    
   
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Width, 843) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor systemGray6Color];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    
    self.tableView.backgroundView = backgroundView;
    
    [self addSubview:self.tableView];
    
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 240;

}


- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;

}

- (CellForVideo*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellForVideo* cell = [tableView dequeueReusableCellWithIdentifier:@"100"];
    
    if (cell == nil) {
        cell = [[CellForVideo alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[NSString stringWithFormat:@"%ld%ld", indexPath.row, indexPath.section]];
    }
    
    if (indexPath.section == 1) {
        [cell layoutWithVideoCoverUrl:@"https://v.api.aa1.cn/api/bz-v4/" videoUrl:@"https://v.api.aa1.cn/api/api-fj/index.php?aa1=suf7y58th48u935"];
    }
    
    
    
    
    return  cell;
}
@end
