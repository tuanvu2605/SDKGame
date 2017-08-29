//
//  CompassView.m
//  HiSDK
//
//  Created by TuanAnh on 8/29/17.
//  Copyright © 2017 TuanAnh. All rights reserved.
//

#import "CompassView.h"
#import "FAKFontAwesome.h"
#import "OptionView.h"
#import "KLCPopup.h"

@implementation CompassView

-(void)awakeFromNib
{
    [super awakeFromNib];
    FAKFontAwesome *compassIcon = [FAKFontAwesome compassIconWithSize:80];
    [compassIcon addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor]];
    UIImage *compass = [compassIcon imageWithSize:CGSizeMake(80, 80)];
    _icon.image =compass;
    self.layer.cornerRadius = 12;
    self.layer.masksToBounds = YES;
    
    
}

+(CompassView*)compassView
{
    static CompassView *shareview = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"CompassView" owner:nil options:nil];
        CompassView *cp = nib.firstObject;
        shareview = cp;
    });
    return shareview;
}

-(void)layoutSubviews
{
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc]initWithFrame:self.bounds];
    effectView.effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    [self addSubview:effectView];
    [self sendSubviewToBack:effectView];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touch");
    __block OptionView *optv = [OptionView getOptionView];
    
    if (UIDeviceOrientationIsPortrait([UIDevice currentDevice].orientation)){
        
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        CGFloat temp = screenWidth;
        CGFloat viewWidth = 0.8*temp;
        CGFloat viewHeight = viewWidth;
        [optv setFrame:[CompassView compassView].frame];
        optv.layer.cornerRadius = 22.0f;
        optv.layer.masksToBounds = YES;
        optv.controller = self.controller;
        [self.controller.view addSubview:optv];
                optv.hidden = YES;
        KLCPopup * popup = [KLCPopup popupWithContentView:optv
                                                 showType:KLCPopupShowTypeFadeIn
                                              dismissType:KLCPopupDismissTypeFadeOut
                                                 maskType:KLCPopupMaskTypeClear
                                 dismissOnBackgroundTouch:YES
                                    dismissOnContentTouch:NO];
        
        
        [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:2 initialSpringVelocity:8 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            optv.hidden = NO;
            [optv setFrame:CGRectMake(0, 0, viewWidth, viewHeight)];
            optv.center = self.controller.view.center;
            [CompassView compassView].hidden = YES;
            [popup show];
            
        } completion:^(BOOL finished) {
            
            
            
        }];
        
        popup.willStartDismissingCompletion = ^{
            
            [UIView animateWithDuration:20 delay:0 usingSpringWithDamping:0 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                
                
                [optv setFrame:[CompassView compassView].frame];
//                [optv removeFromSuperview];
                [CompassView compassView].hidden = NO;
//                optv.hidden = YES;
                

                
            } completion:^(BOOL finished) {
                
                
                
            }];
            
        };
    
        
     
        optv.handler = ^{
            
    
            
            
        };
        
    }else{
        
    }

}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
