//
//  NoLoginSelctBx.h
//  XHapplyTs
//
//  Created by wt on 2019/2/13.
//  Copyright © 2019 deBug Sir. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NoLoginSelctBx : UIView
@property (strong,nonatomic)void (^geSex)(NSInteger index);
@property (weak, nonatomic) IBOutlet UILabel *g8LoginL;
@property (weak, nonatomic) IBOutlet UILabel *g8RegL;
@property (weak, nonatomic) IBOutlet UIView *g8BgBx;
@property (weak, nonatomic) IBOutlet UILabel *geLine;
@property (weak, nonatomic) IBOutlet UILabel *geLineS;

+(instancetype)creartXib;

@end

NS_ASSUME_NONNULL_END
