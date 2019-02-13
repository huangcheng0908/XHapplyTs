//
//  NoFateBx.m
//  XHapplyTs
//
//  Created by wt on 2019/2/13.
//  Copyright © 2019 deBug Sir. All rights reserved.
//

#import "NoFateBx.h"

@interface NoFateBx ()

@end

@implementation NoFateBx

+(NoFateBx *)shareNoFateBx
{
    NoFateBx * home = [[UIStoryboard storyboardWithName:@"NoFateS" bundle:nil]instantiateViewControllerWithIdentifier:@"NoFateBx"];
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
