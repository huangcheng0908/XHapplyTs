//
//  NoLoginBwx.h
//  XHapplyTs
//
//  Created by wt on 2019/2/13.
//  Copyright © 2019 deBug Sir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NoLoginWx.h"

NS_ASSUME_NONNULL_BEGIN

@interface NoLoginBwx : UIView
@property (strong,nonatomic)void (^geLoginBs)(NSInteger index);
@property (retain,nonatomic) NoLoginWx * LoginWs;
@property (assign,nonatomic)NSInteger indexS;

@end

NS_ASSUME_NONNULL_END
