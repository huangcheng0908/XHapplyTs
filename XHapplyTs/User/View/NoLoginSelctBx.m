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
    self.autoresizingMask = UIViewAutoresizingNone;
}

+(instancetype)creartXib
{
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([NoLoginSelctBx class]) owner:nil options:nil].firstObject;
}

@end
