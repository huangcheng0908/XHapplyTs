//
//  NoLoginSelctBx.m
//  XHapplyTs
//
//  Created by wt on 2019/2/13.
//  Copyright © 2019 deBug Sir. All rights reserved.
//

#import "NoLoginSelctBx.h"

@implementation NoLoginSelctBx

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
    self.autoresizingMask = UIViewAutoresizingNone;
}

+(instancetype)creartXib
{
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([NoLoginSelctBx class]) owner:nil options:nil].firstObject;
}

- (IBAction)g8Tap:(UITapGestureRecognizer *)sender
{
    if (sender.view.tag == 1)
    {
        self.g8LoginL.textColor = NoMainSColor;
        self.g8RegL.textColor = NoLoginRsColor;
        self.geLine.hidden = NO;
        self.geLineS.hidden = YES;
    }else
    {
        self.g8LoginL.textColor = NoLoginRsColor;
        self.g8RegL.textColor = NoMainSColor;
        self.geLine.hidden = YES;
        self.geLineS.hidden = NO;
    }
    if (self.geSex)
    {
        self.geSex(sender.view.tag);
    }
}








@end
