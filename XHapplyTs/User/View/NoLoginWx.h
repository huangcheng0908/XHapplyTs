//
//  NoLoginWx.h
//  XHapplyTs
//
//  Created by wt on 2019/2/14.
//  Copyright © 2019 deBug Sir. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NoLoginWx : UIView

@property (strong,nonatomic)void (^geLoginBs)(void);
@property (weak, nonatomic) IBOutlet UIView *g8CodeBx;
@property (weak, nonatomic) IBOutlet UITextField *g8Tel;
@property (weak, nonatomic) IBOutlet UITextField *g8Pwd;
@property (weak, nonatomic) IBOutlet UITextField *g8Code;
@property (weak, nonatomic) IBOutlet UIButton *g8LoginBut;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *g8ButTopc;

+(instancetype)creartXib;






@end

NS_ASSUME_NONNULL_END
