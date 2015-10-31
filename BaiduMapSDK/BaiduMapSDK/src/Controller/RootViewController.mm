//
//  RootViewController.m
//  BaiduMapSDK
//
//  Created by lyh on 15/10/31.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "RootViewController.h"
#import "BMKClusterManager.h"


@interface RootViewController ()<BMKMapViewDelegate>

@property (nonatomic, strong) BMKMapView *mapView;

@property (nonatomic, strong) BMKClusterManager *clusterMannger;


@end

@implementation RootViewController

-(BMKClusterManager *)clusterMannger {
    if (_clusterMannger == nil) {
        _clusterMannger = [[BMKClusterManager alloc]init];
    }
    return _clusterMannger;
}

- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation {
    if ([annotation isKindOfClass:[BMKPointAnnotation class]]) {
        BMKPinAnnotationView *newAnnotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myAnnotation"];
        newAnnotationView.pinColor = BMKPinAnnotationColorPurple;
        newAnnotationView.animatesDrop = YES;// 设置该标注点动画显示
        return newAnnotationView;
    }
    return nil;
    
}

-(void)loadView {
        self.mapView = [[BMKMapView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        self.view = self.mapView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
#warning 地图标注
    // 添加一个PointAnnotation
    BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
    CLLocationCoordinate2D coor;
    coor.latitude = 39.915;
    coor.longitude = 116.404;
    annotation.coordinate = coor;
    annotation.title = @"这里是北京";
    [_mapView addAnnotation:annotation];
    
    //切换为标准地图
    [_mapView setMapType:BMKMapTypeStandard];
    
    //打开实时路况图层
//    [_mapView setTrafficEnabled:YES];
    
    //打开百度城市热力图图层（百度自有数据）
//    [_mapView setBaiduHeatMapEnabled:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [_mapView viewWillAppear];
    _mapView.delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
}
-(void)viewWillDisappear:(BOOL)animated
{
    [_mapView viewWillDisappear];
    _mapView.delegate = nil; // 不用时，置nil
    
}

-(void)dealloc {
    if (self.mapView) {
        self.mapView = nil;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
