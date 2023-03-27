//
//  SignView.h
//  VoluntaryBest
//
//  Created by 王璐 on 2023/3/27.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "HJCAnnotion.h"

NS_ASSUME_NONNULL_BEGIN

@interface SignView : UIView
<MKMapViewDelegate, CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) CLLocationManager *manager;
- (void)initView;
@end

NS_ASSUME_NONNULL_END
