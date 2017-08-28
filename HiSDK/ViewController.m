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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)pop:(id)sender {
    
    OptionView *optv = [OptionView getOptionView];
    
    if (UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation)){
        
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        CGFloat temp = screenWidth;
        CGFloat viewWidth = 0.8*temp;
        CGFloat viewHeight = viewWidth;
        [optv setFrame:CGRectMake(0, 0, viewWidth, viewHeight)];
        optv.layer.cornerRadius = 22.0f;
        optv.layer.masksToBounds = YES;
        optv.controller = self;
        KLCPopup * popup = [KLCPopup popupWithContentView:optv
                                                 showType:KLCPopupShowTypeFadeIn
                                              dismissType:KLCPopupDismissTypeFadeOut
                                                 maskType:KLCPopupMaskTypeClear
                                 dismissOnBackgroundTouch:YES
                                    dismissOnContentTouch:NO];
        [popup show];
        optv.handler = ^{
            [KLCPopup dismissAllPopups];
        };
        
    }else{
        
    }
   
}


@end
