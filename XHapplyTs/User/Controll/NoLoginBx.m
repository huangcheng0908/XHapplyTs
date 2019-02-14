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
@property (retain,nonatomic) NoLoginBwx * loginS;

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
    DefineWeakSelf;
    self.g8BomHc.constant = self.g9BomXs;
    self.g8ScrollBc.backgroundColor = NoLoginBgColor;
    CGFloat height = JXFSystemiOS >= 11.0f ? (UI_IS_IPHONE_X ? -45.0f : -20.0f) : -20.0f;
    self.g8TopBs.constant = height;
    self.g8ScrollBc.contentSize = CGSizeMake(JXFWidth, UI_IS_IPHONE_6R ? (JXFHeight + height) : 568.0f);
    NoLoginBwx * loginS = [[NoLoginBwx alloc]initWithFrame:CGRectMake(0, height, JXFWidth, JXFWidth * 0.6107f + 500.0f)];
    self.loginS = loginS;
    [self.g8ScrollBc addSubview:loginS];
    loginS.geLoginBs = ^(NSInteger indexS)
    {
        [weakSelf g8LoginS:indexS];
    };
    
}

-(void)g8LoginS:(NSInteger)indexS
{
    if (indexS == 1)
    {
        [self g8Loginface];
    }else
    {
        [self g8Registrface];
    }
}

-(void)g8Loginface
{
    if ([[NoPublicApi sharedNoPublicApi]XJValidateContactNumber:self.loginS.LoginWs.g8Tel.text] == NO)
    {
        return [SVProgressHUD showErrorWithStatus:@"手机号格式错误!"];
    }
    
    if (XJEmpty(self.loginS.LoginWs.g8Pwd.text))
    {
        return [SVProgressHUD showErrorWithStatus:@"密码输入错误!"];
    }
    
    [[NoHomeNetApi sharedNoHomeNetApi]g8NoLoginAccount:self.loginS.LoginWs.g8Tel.text
                                                   pwd:self.loginS.LoginWs.g8Pwd.text
                                               succeed:^(NoParmerScModel * noNet)
    {
        
    } failure:^{
        
    }];
}

-(void)g8Registrface
{
    [[NoHomeNetApi sharedNoHomeNetApi]g8NoRegistAccount:self.loginS.LoginWs.g8Tel.text pwd:self.loginS.LoginWs.g8Pwd.text verify:self.loginS.LoginWs.g8Code.text succeed:^(id noNet) {
        
    } failure:^{
        
    }];
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
