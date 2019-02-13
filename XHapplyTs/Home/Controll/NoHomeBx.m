//
//  NoHomeBx.m
//  XHapplyTs
//
//  Created by wt on 2019/2/13.
//  Copyright © 2019 deBug Sir. All rights reserved.
//

#import "NoHomeBx.h"

@interface NoHomeBx ()

@end

@implementation NoHomeBx

+(NoHomeBx *)shareNoHomeBx
{
    NoHomeBx * home = [[UIStoryboard storyboardWithName:@"NoHomeS" bundle:nil]instantiateViewControllerWithIdentifier:@"NoHomeBx"];
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
