//
//  MenuCell.m
//  HiSDK
//
//  Created by TuanAnh on 8/28/17.
//  Copyright © 2017 TuanAnh. All rights reserved.
//

#import "MenuCell.h"

@implementation MenuCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)displayWithItem:(MenuItem*)item
{
    _title.text = item.name;
    _icon.image = item.icon;
    _icon.tintColor = [UIColor whiteColor];
}

@end
