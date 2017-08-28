//
//  MenuItem.h
//  HiSDK
//
//  Created by TuanAnh on 8/28/17.
//  Copyright © 2017 TuanAnh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MenuItem : NSObject

@property (nonatomic , copy) NSString *name;
@property (nonatomic , strong) UIImage *icon;
-(instancetype)initWithName:(NSString *)name andIcon:(UIImage*)icon;

@end
