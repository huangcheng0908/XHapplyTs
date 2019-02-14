//
//  NoLoginWx.m
//  XHapplyTs
//
//  Created by wt on 2019/2/14.
//  Copyright © 2019 deBug Sir. All rights reserved.
//

#import "NoLoginWx.h"

@implementation NoLoginWx

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.autoresizingMask = UIViewAutoresizingNone;
    self.g8ButTopc.constant = 0.0f;
    self.g8Pwd.secureTextEntry = YES;
    self.g8LoginBut.layer.cornerRadius = self.g8LoginBut.frame.size.height / 2.0f;
    self.g8Tel.attributedPlaceholder = [[NoPublicApi sharedNoPublicApi]Stitle:@"输入登录手机号" Color:NoMainColor font:15.0f];
    self.g8Pwd.attributedPlaceholder = [[NoPublicApi sharedNoPublicApi]Stitle:@"输入登录密码" Color:NoMainColor font:15.0f];
    self.g8Code.attributedPlaceholder = [[NoPublicApi sharedNoPublicApi]Stitle:@"输入验证码" Color:NoMainColor font:15.0f];
}

+(instancetype)creartXib
{
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([NoLoginWx class]) owner:nil options:nil].firstObject;
}


- (IBAction)g8SenderT:(UIButton *)sender
{
    if ([[NoPublicApi sharedNoPublicApi]XJValidateContactNumber:self.g8Tel.text] == NO)
    {
        return [SVProgressHUD showErrorWithStatus:@"手机号格式错误!"];
    }
    [self g8DJs:sender];
    [[NoHomeNetApi sharedNoHomeNetApi]g8NoSendverify:self.g8Tel.text
                                                type:NoRegistverifi
                                             succeed:^(NoParmerScModel * noNet)
    {
        if (noNet.status.integerValue == 200)
        {
            [SVProgressHUD showSuccessWithStatus:noNet.message];
        }
    } failure:^{
        
    }];
}

-(void)g8DJs:(UIButton *)sender
{
        [[NoPublicApi sharedNoPublicApi]QQJXPerfectCountdown:30.0f
                                                      sender:sender
                                                    titleBut:@""
                                                  titleColor:NoMainSColor
                                                  bgButColor:[UIColor clearColor]
                                                       block:^{
                                                           [sender setTitle:@"获取验证码" forState:UIControlStateNormal];
        }];
}

- (IBAction)g8LoginS:(UIButton *)sender
{
    if (self.geLoginBs)
    {
        self.geLoginBs();
    }
}








@end
