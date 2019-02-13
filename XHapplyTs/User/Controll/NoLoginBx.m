//
//  NoLoginBx.m
//  XHapplyTs
//
//  Created by wt on 2019/2/13.
//  Copyright © 2019 deBug Sir. All rights reserved.
//

#import "NoLoginBx.h"
#import "NoLoginBwx.h"

@interface NoLoginBx ()

@end

@implementation NoLoginBx

+(NoLoginBx *)shareNoLoginBx
{
    NoLoginBx * login = [[UIStoryboard storyboardWithName:@"NoLoginS" bundle:nil]instantiateViewControllerWithIdentifier:@"NoLoginBx"];
    return login;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.g8BomHc.constant = self.g9BomXs;
    self.g8ScrollBc.backgroundColor = NoLoginBgColor;
    CGFloat height = JXFSystemiOS >= 11.0f ? (UI_IS_IPHONE_X ? -45.0f : 0.0f) : -20.0f;
    self.g8TopBs.constant = height;
    self.g8ScrollBc.contentSize = CGSizeMake(JXFWidth, UI_IS_IPHONE_6R ? (JXFHeight + height) : 667.0f);
    NoLoginBwx * loginS = [[NoLoginBwx alloc]initWithFrame:CGRectMake(0, height, JXFWidth, JXFWidth * 0.6107f + 500.0f)];
    [self.g8ScrollBc addSubview:loginS];
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
