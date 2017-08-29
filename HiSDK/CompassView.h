//
//  CompassView.h
//  HiSDK
//
//  Created by TuanAnh on 8/29/17.
//  Copyright © 2017 TuanAnh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CompassView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (strong,nonatomic) UIViewController *controller;
+(CompassView*)compassView;

@end
