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


typedef void (^OptionViewHandler)(void);

@interface OptionView : UIView<UICollectionViewDelegate , UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collection;
@property (strong,nonatomic) UIViewController *controller;
@property (nonatomic) OptionViewHandler handler;
+(OptionView*)getOptionView;

@end
