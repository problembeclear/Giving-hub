//
//  HJCAnnotion.h
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/3/27.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface HJCAnnotion : NSObject
<MKAnnotation>

//位置(必选)
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
//标题（可选）
@property (nonatomic, copy) NSString *title;
//子标题（可选）
@property (nonatomic, copy) NSString *subtitle;

@end

NS_ASSUME_NONNULL_END
