//
//  SignController.m
//  VoluntaryBest
//
//  Created by 张思扬 on 2023/1/5.
//

#import "SignController.h"
#import "SignView.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "HJCAnnotion.h"
@interface SignController () <MKMapViewDelegate, CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) CLLocationManager *manager;


@end

@implementation SignController
// 文章地址 https://blog.51cto.com/u_15907570/5925348
// https://www.bbsmax.com/A/x9J23jnZ56/
// https://www.likecs.com/show-308229165.html
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationController.navigationBarHidden  = YES;
    // Do any additional setup after loading the view.
    [self mapView];
    [self manager];
    //请求允许访问位置
    [self.manager requestAlwaysAuthorization];
    [self.manager startUpdatingLocation];
  
}
#pragma mark Manager
//懒加载位置管理器
- (CLLocationManager *)manager
{
    if (_manager == nil) {
        _manager = [[CLLocationManager alloc] init];
        _manager.delegate = self;
        [_manager startUpdatingLocation];
    }
    return _manager;
}
//经纬度
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *location = locations.lastObject;
//    NSLog(@"Latitude: %f, Longitude: %f", location.coordinate.latitude, location.coordinate.longitude);
}

// 获取方向信息
- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
    CLLocationDirection heading = newHeading.trueHeading;
    NSLog(@"%f", heading);
}


#pragma mark MapView
- (MKMapView *)mapView {
    if (!_mapView) {
        //当前地图跟踪模式
        self.mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        [self.view addSubview:self.mapView];
        self.mapView.userTrackingMode = MKUserTrackingModeFollow;
        self.mapView.delegate = self;
        _mapView.showsUserLocation = YES;
        //创建手势
           UITapGestureRecognizer *top = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addMyAnootation:)];
           //加入地图上
           [self.mapView addGestureRecognizer:top];
    }
    return _mapView;
}
//更新位置的时候，会触发
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    NSLog(@"");
    //当前的坐标，反编码
    CLGeocoder *geo = [[CLGeocoder alloc] init];
    [geo reverseGeocodeLocation:userLocation.location completionHandler:^(NSArray *placemarks, NSError *error) {
        //取出标记
        CLPlacemark *pm = [placemarks lastObject];
        //赋值
        userLocation.title = pm.name;
    }];
 
}

//点击地图时候，添加大头针的方法
- (void)addMyAnootation:(UITapGestureRecognizer *)top
{
    //获得手点击的坐标
    CGPoint touchPoint = [top locationInView:top.view];
    //装换为地图的坐标
    CLLocationCoordinate2D cd = [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
 
    //创建自定义的大头针
    HJCAnnotion *annotation = [[HJCAnnotion alloc] init];
    //设置大头针的坐标
    annotation.coordinate = cd;
    //设置大头针的标题
    annotation.title = @"选中的位置";
    annotation.subtitle = @"点击查看详情信息";
    //添加到地图中
    [self.mapView addAnnotation:annotation];
 
}
@end
