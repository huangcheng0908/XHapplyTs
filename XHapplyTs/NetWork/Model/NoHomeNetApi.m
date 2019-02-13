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
