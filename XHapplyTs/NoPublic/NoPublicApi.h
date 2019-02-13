//
//  NoPublicApi.h
//  NoAssistantPj
//
//  Created by wt on 2018/11/26.
//  Copyright © 2018年 Bug Sir. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,GradientDirection)
{
    /** 从上至下*/
    topTobottom = 0,
    /** 从左至右*/
    leftToright,
    /** 从左上角至右下角*/
    upleftTolowRight,
    /** 从右上角至左下角*/
    uprightTolowLeft
};
@interface NoPublicApi : NSObject

/**
 公共函数库

 @return <#return value description#>
 */
+(NoPublicApi *)sharedNoPublicApi;

/**
 生成渐变图片
 
 @param colors <#colors description#>
 @param frame <#frame description#>
 @param gradientDir <#gradientDir description#>
 @return <#return value description#>
 */
- (UIImage*) BgImageFromColors:(NSArray*)colors
                     withFrame: (CGRect)frame
                   gradientDir:(GradientDirection)gradientDir;


/**
 贝塞尔倒角
 
 @param corners <#corners description#>
 @param bezierVc <#bezierVc description#>
 @param corner <#corner description#>
 */
-(void)BezierCorners:(UIRectCorner)corners
          bezierRect:(UIView *)bezierVc
              corner:(CGSize)corner;

/**
 颜色转图片
 
 @param color <#color description#>
 @return <#return value description#>
 */
-(UIImage *) createImageWithColor:(UIColor*) color;

/**
 占位符富文本
 
 @param Stitle <#Stitle description#>
 @return <#return value description#>
 */
-(NSAttributedString *)Stitle:(NSString *)Stitle
                        Color:(UIColor *)Color
                         font:(CGFloat)font;

/**
 首行缩进高度
 
 @param content <#content description#>
 @param font <#font description#>
 @param LineSpace <#LineSpace description#>
 @param width <#width description#>
 @return <#return value description#>
 */
- (CGFloat)estimateTextWidthByContent:(NSString *)content
                             textFont:(CGFloat )font
                                Space:(CGFloat)LineSpace
                  firstLineHeadIndent:(BOOL)firstLineHeadIndent
                                width:(CGFloat)width;

/**
 首行缩进富文本
 
 @param text <#text description#>
 @param fontFloat <#fontFloat description#>
 @param LineSpace <#LineSpace description#>
 @return <#return value description#>
 */
-(NSAttributedString * )FirstLineWithIndentationSpacingText:(NSString *)text
                                                  fontFloat:(CGFloat)fontFloat
                                                      Space:(CGFloat)LineSpace
                                        firstLineHeadIndent:(BOOL)firstLineHeadIndent;

/**
 倒计时
 
 @param sender <#sender description#>
 */
-(void)QQJXCountdown:(NSInteger)scond
              sender:(UIButton *)sender
               block:(void(^)(void))block;

/**
 身份证验证

 @param idCard <#idCard description#>
 @return <#return value description#>
 */
- (BOOL)QQJXisValidateIdCard:(NSString *)idCard;

/**
 设置阴影效果

 @param XJView <#XJView description#>
 @param shadowColor <#shadowColor description#>
 @param shadowOffset <#shadowOffset description#>
 @param shadowOpacity <#shadowOpacity description#>
 @param shadowRadius <#shadowRadius description#>
 */
-(void)XJShadowView:(UIView *)XJView
        shadowColor:(UIColor *)shadowColor
       shadowOffset:(CGSize)shadowOffset
      shadowOpacity:(CGFloat)shadowOpacity
       shadowRadius:(CGFloat)shadowRadius;

/**
 网页css样式

 @param htmlStr <#htmlStr description#>
 @param fontfamily <#fontfamily description#>
 @param fontsize <#fontsize description#>
 @param color <#color description#>
 @param Imagewidth <#Imagewidth description#>
 @return <#return value description#>
 */
-(NSString *)YYGetHtmlData:(NSString *)htmlStr
                      font:(NSString *)fontfamily
                  fontsize:(CGFloat)fontsize
                     color:(NSString *)color
                Imagewidth:(CGFloat)Imagewidth;







@end

NS_ASSUME_NONNULL_END
