//
//  SaysViewController.h
//  VoluntaryBest
//
//  Created by 王璐 on 2023/2/5.
//

#import <UIKit/UIKit.h>
#import "SaysView.h"
NS_ASSUME_NONNULL_BEGIN

@interface SaysViewController : UIViewController
@property(nonatomic, strong) NSMutableArray* array;

@property(nonatomic, strong) SaysView* viewSays;
@property (nonatomic, strong) NSDictionary* dic;
@end

NS_ASSUME_NONNULL_END
