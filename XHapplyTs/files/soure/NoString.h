//
//  NoString.h
//  NoAssistantPj
//
//  Created by wt on 2018/11/26.
//  Copyright © 2018年 Bug Sir. All rights reserved.
//

#ifndef NoString_h
#define NoString_h


#ifdef DEBUG
#define CXTLog( s, ... ) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(s), ##__VA_ARGS__] UTF8String] )
#else
#define CXTLog( s, ... )
#endif

#define InterIP                                 (@"http://jxpicc.weinova.net:8088/twms-web/")
#define ivKey                                   @"52369874"
#define Nokey                                  @"novasoft"
#define XJEmpty(X)                          ([X length] <= 0 || X == nil || [X isEqualToString:@""] || [X isEqual:[NSNull null]])
#define JXFWidth  [[UIScreen mainScreen]bounds].size.width
#define JXFHeight   [[UIScreen mainScreen]bounds].size.height
#define DefineWeakSelf __weak __typeof(self) weakSelf = self
#define YGUserDefaults  [NSUserDefaults standardUserDefaults]
#define IS_IPHONE  [[UIDevice currentDevice]userInterfaceIdiom] == UIUserInterfaceIdiomPhone
#define JXFSystemiOS        [[UIDevice currentDevice].systemVersion floatValue]

#define JXFIPhone4_5_6_6P_X_MXs(a,b,c,d,e,f) (CGSizeEqualToSize(CGSizeMake(320, 480), [[UIScreen mainScreen] bounds].size) ?(a) :(CGSizeEqualToSize(CGSizeMake(320, 568), [[UIScreen mainScreen] bounds].size) ? (b) : (CGSizeEqualToSize(CGSizeMake(375, 667), [[UIScreen mainScreen] bounds].size) ?(c) : (CGSizeEqualToSize(CGSizeMake(414, 736), [[UIScreen mainScreen] bounds].size) ?(d) : (CGSizeEqualToSize(CGSizeMake(375, 812), [[UIScreen mainScreen] bounds].size) ?(e) : (CGSizeEqualToSize(CGSizeMake(414, 896), [[UIScreen mainScreen] bounds].size) ?(f):0))))))

#define UI_IS_IPHONE_X        [[UIScreen mainScreen] bounds].size.height >= 812.0f
#define UI_IS_IPHONE_8P        [[UIScreen mainScreen] bounds].size.width >= 414.0f
#define UI_IS_IPHONE_SE        [[UIScreen mainScreen] bounds].size.width <= 320.0f
#define UI_IS_IPHONE_6        [[UIScreen mainScreen] bounds].size.height == 667.0f
#define UI_IS_IPHONE_Xr        [[UIScreen mainScreen] bounds].size.height == 812.0f
#define JXFTabIPHONEX    (UI_IS_IPHONE_X ? 83.0f : 49.0f)
#define JXFNaviIPHONEX  (UI_IS_IPHONE_X ? 88.0f : 64.0f)
#define JXFUserDefaults  [NSUserDefaults standardUserDefaults]
#define JXFHexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define JXFHexRGBAlpha(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]
#define JXFRGBA(r,g,b,a)    [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define JXFBiteXs(x)        [[NSString stringWithFormat:@" %0.2f",JXFHeight/667.0 * x]floatValue]
#define JXFBiteWs(x)        [[NSString stringWithFormat:@" %0.2f",JXFWidth/414.0 * x]floatValue]
#define BsiphoneJx(a,b,c,d)                   (UI_IS_IPHONE_8P ? a : (UI_IS_IPHONE_SE ? b : (UI_IS_IPHONE_Xr ? c : d)))
#define JXFont(X)            [UIFont systemFontOfSize:X]

#define NoMainColor      JXFHexRGB(0x959595)
#define NoMainSColor      JXFHexRGB(0xFF7683)
#define NoLineColor      JXFHexRGB(0xCCCCCC)
#define NoBgMainColor      JXFHexRGB(0x131313)










#endif /* NoString_h */
