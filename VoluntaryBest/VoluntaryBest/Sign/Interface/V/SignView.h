//
//  SignView.h
//  VoluntaryBest
//
//  Created by 王璐 on 2023/3/27.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SignView : UIView
<MKMapViewDelegate, CLLocationManagerDelegate>
@property (strong, nonatomic) MKMapView *mapView;
@property (nonatomic, strong) CLLocationManager *manager;
@property (nonatomic, strong) UIButton *buttonForWindow;
- (void)initView;
@end

NS_ASSUME_NONNULL_END
