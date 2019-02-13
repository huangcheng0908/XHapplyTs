//
//  NoMineBx.m
//  XHapplyTs
//
//  Created by wt on 2019/2/13.
//  Copyright © 2019 deBug Sir. All rights reserved.
//

#import "NoMineBx.h"

@interface NoMineBx ()

@end

@implementation NoMineBx

+(NoMineBx *)shareNoMineBx
{
    NoMineBx * home = [[UIStoryboard storyboardWithName:@"NoMineS" bundle:nil]instantiateViewControllerWithIdentifier:@"NoMineBx"];
    return home;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
