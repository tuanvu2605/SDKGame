//
//  ViewController.h
//  HiSDK
//
//  Created by TuanAnh on 8/28/17.
//  Copyright © 2017 TuanAnh. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ViewControllerTouchDelegate <NSObject>

-(void)viewControllerDidTapInScreen;

@end

@interface ViewController : UIViewController

@property  (nonatomic , strong) id <ViewControllerTouchDelegate> delegate;


@end

