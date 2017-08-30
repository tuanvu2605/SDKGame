//
//  OptionView.h
//  HiSDK
//
//  Created by TuanAnh on 8/28/17.
//  Copyright © 2017 TuanAnh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KRLCollectionViewGridLayout.h"
#import "FAKFontAwesome.h"
#import "MenuCell.h"
#import "MenuItem.h"

@protocol OptionViewDelegate <NSObject>

-(void)didTapOnImageView;
-(void)didTapOnItem;

@end

typedef void (^OptionViewHandler)(void);

@interface OptionView : UIView<UICollectionViewDelegate , UICollectionViewDataSource,UIGestureRecognizerDelegate>
@property (nonatomic , strong) id <OptionViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet UICollectionView *collection;
@property (strong,nonatomic) UIViewController *controller;
@property (strong,nonatomic) UIVisualEffectView *effectView;
@property (nonatomic) OptionViewHandler handler;
+(OptionView*)getOptionView;
@property (weak, nonatomic) IBOutlet UIImageView *icon;

@end
