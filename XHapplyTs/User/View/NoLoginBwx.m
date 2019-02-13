//
//  NoLoginBwx.m
//  XHapplyTs
//
//  Created by wt on 2019/2/13.
//  Copyright © 2019 deBug Sir. All rights reserved.
//

#import "NoLoginBwx.h"
#import "NoLoginSelctBx.h"

@implementation NoLoginBwx

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self geSetWbs];
    }
    return self;
}

-(void)geSetWbs
{
    self.backgroundColor = [UIColor clearColor];
    UIView * SelfBg = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    SelfBg.backgroundColor = [UIColor clearColor];
    [self addSubview:SelfBg];
    
    UIImageView * imageVs = [UIImageView new];
    imageVs.image = [UIImage imageNamed:@"JxLoginBg"];
    [SelfBg addSubview:imageVs];
    [imageVs mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.top.equalTo(SelfBg.mas_top).with.offset(0.0f);
        make.left.equalTo(SelfBg.mas_left).with.offset(0.0f);
        make.size.mas_equalTo(CGSizeMake(JXFWidth, JXFWidth * 0.6107));
    }];
    
    UIView * BgVs = [UIView new];
    BgVs.backgroundColor = [UIColor whiteColor];
    BgVs.layer.cornerRadius = 8.0f;
    [[NoPublicApi sharedNoPublicApi]XJShadowView:BgVs
                                     shadowColor:NoLoginBgColor
                                    shadowOffset:CGSizeMake(0.0f, 5.0f)
                                   shadowOpacity:1.0f
                                    shadowRadius:1.0f];
    [SelfBg addSubview:BgVs];
    [BgVs mas_makeConstraints:^(MASConstraintMaker *make)
    {
        make.top.equalTo(imageVs.mas_bottom).with.offset(-50.0f);
        make.left.equalTo(SelfBg.mas_left).with.offset(JXFBiteWs(35.0f));
        make.right.equalTo(SelfBg.mas_right).with.offset(-JXFBiteWs(35.0f));
        make.height.mas_equalTo(500.0f);
    }];
    
    NoLoginSelctBx * loginX = [NoLoginSelctBx creartXib];
    loginX.frame = CGRectMake(0, 0, JXFWidth - JXFBiteWs(35.0f) * 2.0f, 50.0f);
    [BgVs addSubview:loginX];
    
    
}






@end
