//
//  NoNewBx.m
//  XHapplyTs
//
//  Created by wt on 2019/2/13.
//  Copyright © 2019 deBug Sir. All rights reserved.
//

#import "NoNewBx.h"

@interface NoNewBx ()

@end

@implementation NoNewBx

+(NoNewBx *)shareNoNewBx
{
    NoNewBx * home = [[UIStoryboard storyboardWithName:@"NoNewS" bundle:nil]instantiateViewControllerWithIdentifier:@"NoNewBx"];
    return home;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
