//
//  CompassView.h
//  HiSDK
//
//  Created by TuanAnh on 8/29/17.
//  Copyright © 2017 TuanAnh. All rights reserved.
//
#import "ViewController.h"
#import <UIKit/UIKit.h>

@interface CompassView : UIView<ViewControllerTouchDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (strong,nonatomic) ViewController *controller;
+(CompassView*)compassView;

@end
