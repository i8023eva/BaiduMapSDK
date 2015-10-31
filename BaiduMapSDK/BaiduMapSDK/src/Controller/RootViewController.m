//
//  RootViewController.m
//  BaiduMapSDK
//
//  Created by lyh on 15/10/31.
//  Copyright © 2015年 lyh. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()<BMKMapViewDelegate>

@property (nonatomic, strong) BMKMapView *mapView;
@end

@implementation RootViewController

-(void)loadView {
        self.mapView = [[BMKMapView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        self.view = self.mapView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

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
