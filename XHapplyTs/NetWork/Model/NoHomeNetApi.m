//
//  NoHomeNetApi.m
//  NoAssistantPj
//
//  Created by wt on 2018/11/27.
//  Copyright © 2018年 Bug Sir. All rights reserved.
//

#import "NoHomeNetApi.h"
#import "NoParmerScModel.h"
#import "NoNetWorkApi.h"

@implementation NoHomeNetApi

+(NoHomeNetApi *)sharedNoHomeNetApi
{
    static NoHomeNetApi * network = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (network == nil)
        {
            network = [NoHomeNetApi new];
        }
    });
    return network;
}

-(void)g8NoLoginAccount:(NSString *)mobile
                    pwd:(NSString *)pwd
                succeed:(QQJXNetworkSuccess)succeed
                failure:(QQJXCommonFailBlock)failure
{
    NoParmerScModel * scM = [[NoParmerScModel alloc]init];
    scM.mobile = mobile;
    scM.password = pwd;
    [[NoHomeNetApi sharedNoHomeNetApi]g8NoRequestAlertY:YES
                                             parameters:scM
                                                   mapS:@"s=/home/user/login"
                                                succeed:succeed
                                                failure:failure];
}

-(void)g8NoRegistAccount:(NSString *)mobile
                     pwd:(NSString *)pwd
                  verify:(NSString *)verify
                 succeed:(QQJXNetworkSuccess)succeed
                 failure:(QQJXCommonFailBlock)failure
{
    NoParmerScModel * scM = [[NoParmerScModel alloc]init];
    scM.mobile = mobile;
    scM.password = pwd;
    scM.repassword = pwd;
    scM.verify = verify;
    [[NoHomeNetApi sharedNoHomeNetApi]g8NoRequestAlertY:YES
                                             parameters:scM
                                                   mapS:@"s=/home/user/register"
                                                succeed:succeed
                                                failure:failure];
}















-(void)g8NoSendverify:(NSString *)moblie
                 type:(NoCodeTy)type
              succeed:(QQJXNetworkSuccess)succeed
              failure:(QQJXCommonFailBlock)failure
{
    NoParmerScModel * scM = [[NoParmerScModel alloc]init];
    scM.mobile = moblie;
    scM.type = [NSString stringWithFormat:@"%ld",type];
    [[NoHomeNetApi sharedNoHomeNetApi]g8NoRequestAlertY:YES
                                             parameters:scM
                                                   mapS:@"s=/home/user/send_verify"
                                                succeed:succeed
                                                failure:failure];
}


-(void)g8NoRequestAlertY:(BOOL)alertY
              parameters:(NoParmerScModel *)parM
                    mapS:(NSString *)mapS
                 succeed:(QQJXNetworkSuccess)succeed
                 failure:(QQJXCommonFailBlock)failure
{
    [[NoNetWorkApi sharedNoNetWorkApi]NoRequestAFURL:[NSString stringWithFormat:@"%@%@",InterZanIP,mapS]
                                          httpMethod:NoPOSTMethod
                                              alertY:alertY
                                          parameters:parM.mj_keyValues
                                             succeed:succeed
                                             failure:failure];
}







@end
