//
//  MenuItem.m
//  HiSDK
//
//  Created by TuanAnh on 8/28/17.
//  Copyright © 2017 TuanAnh. All rights reserved.
//

#import "MenuItem.h"

@implementation MenuItem

-(instancetype)initWithName:(NSString *)name andIcon:(UIImage*)icon
{
    self = [super init];
    if (self) {
        self.name =  name;
        self.icon = icon;
    }
    return self;
}
@end
