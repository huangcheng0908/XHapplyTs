//
//  NoBaseC.m
//  NoAssistantPj
//
//  Created by wt on 2018/11/26.
//  Copyright © 2018年 Bug Sir. All rights reserved.
//

#import "NoBaseC.h"

@interface NoBaseC ()

@end

@implementation NoBaseC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    UIImage * bgImage  = [UIImage imageNamed:@"JxNavi"];
    [self.navigationController.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
}

-(void)QQJXNaviTitle:(NSString *)naviTitle
{
    self.navigationItem.title =naviTitle;
    self.navigationController.navigationBar.titleTextAttributes =  @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:18.0f]};
}

-(void)QQBackBut:(BOOL)isRoot
{
    UIBarButtonItem * letfitem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"arrowl"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(GwBack:)];
    letfitem.tag = isRoot;
    self.navigationItem.leftBarButtonItem = letfitem;
}

-(void)GwBack:(UIBarButtonItem *)sender
{
    if (sender.tag == 1)
    {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }else
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
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
