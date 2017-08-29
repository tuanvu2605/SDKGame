//
//  ViewController.m
//  HiSDK
//
//  Created by TuanAnh on 8/28/17.
//  Copyright © 2017 TuanAnh. All rights reserved.
//

#import "KLCPopup.h"
#import "OptionView.h"
#import "ViewController.h"
#import "CompassView.h"

@interface ViewController ()

@end

@implementation ViewController
{
    CompassView *compass;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    compass = [CompassView compassView];
    [compass setFrame:CGRectMake(0, 0, 60, 60)];
    compass.controller = self;
    [self.view addSubview:compass];
//    compass.center = self.view.center;
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)pop:(id)sender {
    
       
}


@end
