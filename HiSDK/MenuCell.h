//
//  MenuCell.h
//  HiSDK
//
//  Created by TuanAnh on 8/28/17.
//  Copyright © 2017 TuanAnh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuItem.h"

@interface MenuCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIImageView *icon;
-(void)displayWithItem:(MenuItem*)item;
@end
