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


@interface ViewController ()<OptionViewDelegate>

@end

@implementation ViewController
{
//    CompassView *compass;
    OptionView *optv;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    
    
    optv = [OptionView getOptionView];
    
    //if (UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation)){
        

        [optv setFrame:CGRectMake(10, 50, 60, 60)];
        optv.layer.cornerRadius = 10.0f;
        optv.layer.masksToBounds = YES;
        optv.controller = self;
        optv.delegate = self;
        [self.view addSubview:optv];

    
        
        
        
        optv.handler = ^{
            

            
        };
        


    
    
}

-(void)didTapOnImageView
{
    if (optv.frame.size.width > 60) {
        return;
    }
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat temp = screenWidth;
    CGFloat viewWidth = 0.8*temp;
    CGFloat viewHeight = viewWidth;
    
    [UIView animateWithDuration:0.2 delay:0 usingSpringWithDamping:8 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        
        [optv setFrame:CGRectMake(0, 0, viewWidth, viewHeight)];
        optv.center = self.view.center;
        optv.icon.hidden = YES;
        [optv.effectView setFrame:optv.bounds];
        
    } completion:^(BOOL finished) {
        

        
        
    }];
}

-(void)didTapOnItem
{
    [self minsizeForOtionView];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self minsizeForOtionView];
}

-(void)minsizeForOtionView
{
    if (optv.frame.size.width <= 60) {
        return;
    }
    
    optv.icon.hidden = NO;
    [UIView animateWithDuration:0.2 delay:0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        [optv setFrame:CGRectMake(10, 50, 60, 60)];
        optv.icon.alpha = 1;
        optv.layer.cornerRadius = 10.0f;
        [optv.effectView setFrame:optv.bounds];
        
        
    } completion:^(BOOL finished) {
        
        
        
    }];

}




@end
