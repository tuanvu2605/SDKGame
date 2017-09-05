//
//  OptionView.m
//  HiSDK
//
//  Created by TuanAnh on 8/28/17.
//  Copyright © 2017 TuanAnh. All rights reserved.
//

#import "OptionView.h"

static NSString *itemCellId = @"itemCellId";
@implementation OptionView
{
    KRLCollectionViewGridLayout *_layout;
}

-(void)awakeFromNib
{
    [super awakeFromNib];

    [self configureLayout];
    [self.collection registerNib:[UINib nibWithNibName:@"MenuCell" bundle:nil] forCellWithReuseIdentifier:itemCellId];
    self.collection.backgroundColor = [UIColor clearColor];
    
    FAKFontAwesome *plus = [FAKFontAwesome gamepadIconWithSize:40];
    [plus addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor]];
    UIImage *plusImg = [plus imageWithSize:CGSizeMake(60, 55)];
    self.icon.image = plusImg;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageViewDidTap)];
    tap.delegate = self;
    [self.icon addGestureRecognizer:tap];
    self.icon.userInteractionEnabled = YES;
    
    
}

-(void)imageViewDidTap
{
    [_delegate didTapOnImageView];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}

-(void)layoutSubviews
{
    if (_effectView) {
        return;
    }
    _effectView = [[UIVisualEffectView alloc]initWithFrame:self.bounds];
    _effectView.effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    [self addSubview:_effectView];
    [self sendSubviewToBack:_effectView];
}

+(OptionView*)getOptionView
{
    NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"OptionView" owner:nil options:nil];
    OptionView *optv = nib.firstObject;
    return optv;
}


-(void)configureLayout
{
    _layout = [[KRLCollectionViewGridLayout alloc]init];
    _layout.numberOfItemsPerLine = 2;
    _layout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    _layout.interitemSpacing = 20;
    _layout.lineSpacing = 5;
    _layout.aspectRatio = 1;
    _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _collection.collectionViewLayout = _layout;
    _collection.delegate = self;
    _collection.dataSource = self;
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
 return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
  return 4;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MenuCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:itemCellId forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    MenuItem *item = [OptionView listItems][indexPath.item];
    [cell displayWithItem:item];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    MenuCell *cell = (MenuCell*)[collectionView cellForItemAtIndexPath:indexPath];
    [cell setHidden:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [cell setHidden:NO];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [_delegate didTapOnItem];
        if (indexPath.row == 0) {
            UIImage *img = [UIImage imageNamed:@"photo"];
            [self shareText:@"Awesome Application" andImage:img andUrl:[NSURL URLWithString:@"https://itunes.apple.com/us/app/the-spear-stickman/id1257539144?mt=8"]];
        }
        if (indexPath.row == 3) {
            NSURL * URL = [[NSURL alloc]initWithString:@"https://itunes.apple.com/us/developer/vu-anh/id1219655443"];
            if ([[UIApplication sharedApplication] canOpenURL:URL]) {
                [[UIApplication sharedApplication] openURL:URL];
            }
            else {
                
            }
        }
    });
  

}

- (void)shareText:(NSString *)text andImage:(UIImage *)image andUrl:(NSURL *)url
{
    NSMutableArray *sharingItems = [NSMutableArray new];
    if (text) {
        [sharingItems addObject:text];
    }
    if (image) {
        [sharingItems addObject:image];
    }
    if (url) {
        [sharingItems addObject:url];
    }
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:sharingItems applicationActivities:nil];
    [self.controller presentViewController:activityController animated:YES completion:nil];
}

+(NSArray*)listItems
{
    FAKFontAwesome *shareIcon = [FAKFontAwesome retweetIconWithSize:80];
    [shareIcon addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor]];
    UIImage *sh = [shareIcon imageWithSize:CGSizeMake(100, 80)];
    MenuItem *shareItem = [[MenuItem alloc]initWithName:@"Share" andIcon:sh];
    
    FAKFontAwesome *restore = [FAKFontAwesome repeatIconWithSize:80];
    [restore addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor]];
    UIImage *res = [restore imageWithSize:CGSizeMake(80, 80)];
    MenuItem *restoreItem = [[MenuItem alloc]initWithName:@"Restore" andIcon:res];
    
    FAKFontAwesome *removeAds = [FAKFontAwesome banIconWithSize:80];
    [removeAds addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor]];
    UIImage *remove = [removeAds imageWithSize:CGSizeMake(80, 80)];
    MenuItem *removeAdItem = [[MenuItem alloc]initWithName:@"Remove Ads" andIcon:remove];
    
    UIImage *othergame = [[UIImage imageNamed:@"beer"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    MenuItem *otherItem = [[MenuItem alloc]initWithName:@"Other Game" andIcon:othergame];
    
    return @[shareItem,removeAdItem,restoreItem,otherItem];
    
    
}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
