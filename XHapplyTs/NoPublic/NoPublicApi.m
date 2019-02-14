//
//  NoPublicApi.m
//  NoAssistantPj
//
//  Created by wt on 2018/11/26.
//  Copyright © 2018年 Bug Sir. All rights reserved.
//

#import "NoPublicApi.h"

@implementation NoPublicApi

+(NoPublicApi *)sharedNoPublicApi
{
    static NoPublicApi * publicApi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (publicApi == nil)
        {
            publicApi = [[NoPublicApi alloc]init];
        }
    });
    return publicApi;
}

- (UIImage*) BgImageFromColors:(NSArray*)colors
                     withFrame: (CGRect)frame
                   gradientDir:(GradientDirection)gradientDir

{
    
    NSMutableArray *ar = [NSMutableArray array];
    
    for(UIColor *c in colors) {
        
        [ar addObject:(id)c.CGColor];
        
    }
    
    UIGraphicsBeginImageContextWithOptions(frame.size, YES, 1);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, NULL);
    
    CGPoint start;
    
    CGPoint end;
    
    switch (gradientDir)
    {
        case topTobottom:
        {
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(0.0, frame.size.height);
        }
            break;
        case leftToright:
        {
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(frame.size.width, 0.0);
        }
            break;
        case upleftTolowRight:
        {
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(frame.size.width, frame.size.height);
        }
            break;
        case uprightTolowLeft:
        {
            start = CGPointMake(frame.size.width, 0.0);
            end = CGPointMake(0.0, frame.size.height);
        }
            break;
            
        default:
            break;
    }
    
    CGContextDrawLinearGradient(context, gradient, start, end,kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    CGGradientRelease(gradient);
    
    CGContextRestoreGState(context);
    
    CGColorSpaceRelease(colorSpace);
    
    UIGraphicsEndImageContext();
    
    return image;
    
}

-(void)BezierCorners:(UIRectCorner)corners
          bezierRect:(UIView *)bezierVc
              corner:(CGSize)corner
{
    UIBezierPath * bezier = [UIBezierPath bezierPathWithRoundedRect:bezierVc.bounds
                                                  byRoundingCorners:corners
                                                        cornerRadii:corner];
    CAShapeLayer * layer = [CAShapeLayer new];
    layer.frame = bezierVc.bounds;
    layer.path = bezier.CGPath;
    bezierVc.layer.mask = layer;
}
//颜色转图片
-(UIImage *) createImageWithColor:(UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

-(NSAttributedString *)Stitle:(NSString *)Stitle
                        Color:(UIColor *)Color
                         font:(CGFloat)font;
{
    return [[NSAttributedString alloc] initWithString:Stitle attributes:@{NSForegroundColorAttributeName:Color,NSFontAttributeName:[UIFont systemFontOfSize:font]}];
}

- (CGFloat)estimateTextWidthByContent:(NSString *)content
                             textFont:(CGFloat )font
                                Space:(CGFloat)LineSpace
                  firstLineHeadIndent:(BOOL)firstLineHeadIndent
                                width:(CGFloat)width
{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = LineSpace;
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = firstLineHeadIndent ? font * 2.0f : 0.0f;
    paraStyle.firstLineHeadIndent = 0.0f;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    NSDictionary * dic = @{NSFontAttributeName:[UIFont systemFontOfSize:font], NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f};
    CGSize size = [content boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return ceilf( size.height);
}

-(NSAttributedString * )FirstLineWithIndentationSpacingText:(NSString *)text
                                                  fontFloat:(CGFloat)fontFloat
                                                      Space:(CGFloat)LineSpace
                                        firstLineHeadIndent:(BOOL)firstLineHeadIndent
{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = LineSpace;
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = firstLineHeadIndent ? fontFloat * 2.0f : 0.0f;
    paraStyle.paragraphSpacingBefore = 0.0f;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    UIFont * font = [UIFont systemFontOfSize:fontFloat];
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
                          };
    if (text != nil)
    {
        NSAttributedString * attributeStr = [[NSAttributedString alloc] initWithString:text attributes:dic];
        return attributeStr;
    }
    
    return nil;
    
}

-(void)QQJXCountdown:(NSInteger)scond
              sender:(UIButton *)sender
               block:(void(^)(void))block
{
    __block NSInteger second = scond;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), NSEC_PER_SEC * 1.0f, 0);
    dispatch_source_set_event_handler(timer, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            if (second > 0)
            {
                sender.userInteractionEnabled = NO;
                [sender setTitle:[NSString stringWithFormat:@"重新获取%ld秒",(long)second] forState:UIControlStateNormal];
                second--;
            }else
            {
                sender.userInteractionEnabled = YES;
                dispatch_source_cancel(timer);
                block();
            }
        });
    });
    dispatch_resume(timer);
}

- (BOOL)QQJXisValidateIdCard:(NSString *)idCard
{
    BOOL flag;
    if (idCard.length <= 0)
    {
        // 身份证号码不为空  通用15和18位均可：@"^(\\d{14}|\\d{17})(\\d|[xX])$";
        flag = NO;
        return flag;
    }
    
    NSString *IdRegex = nil;
    if (idCard.length == 15)
    {
        // 一代公民身份证15位
        IdRegex = @"^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$";
    } else if (idCard.length == 18)
    {
        // 二代公民身份证18位
        IdRegex = @"^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])(\\d{3})(\\d|[xX]){1}$";
    }
    
    // 创建谓词对象并设定条件的表达式
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",IdRegex];
    
    return [predicate evaluateWithObject:idCard];
}

-(void)XJShadowView:(UIView *)XJView
        shadowColor:(UIColor *)shadowColor
       shadowOffset:(CGSize)shadowOffset
      shadowOpacity:(CGFloat)shadowOpacity
       shadowRadius:(CGFloat)shadowRadius
{
    XJView.layer.masksToBounds = NO;
    XJView.layer.shadowColor = shadowColor.CGColor;
    XJView.layer.shadowOffset = shadowOffset;
    XJView.layer.shadowOpacity = shadowOpacity;
    XJView.layer.shadowRadius = shadowRadius;
}

-(NSString *)YYGetHtmlData:(NSString *)htmlStr
                      font:(NSString *)fontfamily
                  fontsize:(CGFloat)fontsize
                     color:(NSString *)color
                Imagewidth:(CGFloat)Imagewidth
{
    NSString * styleS =  [NSString stringWithFormat:@"\n<html> \n"
                          "<head> \n"
                          "<meta charset=\"UTF-8\"> \n"
                          "<meta name=\"viewport\" content=\"width=device-width,initial-scale=1.0\" /> \n"
                          "<meta name=\"apple-mobile-web-app-capable\" content=\"yes\" /> \n"
                          "<meta name=\"apple-mobile-web-app-status-bar-style\" content=\"black\" /> \n"
                          "<meta name=\"format-detection\" content=\"telephone=yes\" /> \n"
                          "<meta name=\"format-detection\" content=\"email=yes\" /> \n"
                          "<meta name=\"description\" content=\"Simple Effects for Drop-Down Lists\" /> \n"
                          "<meta name=\"keywords\" content=\"drop-down, select, jquery, plugin, fallback, transition, transform, 3d, css3\" /> \n"
                          "<meta http-equiv=\"Access-Control-Allow-Origin\" content=\"*\"> \n"
                          "<style type=\"text/css\"> \n"
                          "body {font-family: \"%@\"; font-size: %f; color: %@;text-indent:2px;}\n"
                          "img {max-width:%fpx;height: auto;vertical-align:middle;}\n"
                          "</style> \n"
                          "</head> \n"
                          "<body>%@\n</body> \n"
                          "</html>",fontfamily, fontsize,color,Imagewidth ,htmlStr];
    return styleS;
}

-(void)QQJXPerfectCountdown:(NSInteger)scond
                     sender:(UIButton *)sender
                   titleBut:(NSString *)titleBut
                 titleColor:(UIColor *)titleColor
                 bgButColor:(UIColor *)bgButColor
                      block:(void(^)(void))block
{
    __block NSInteger second = scond;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), NSEC_PER_SEC * 1.0f, 0);
    dispatch_source_set_event_handler(timer, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            if (second > 0)
            {
                sender.userInteractionEnabled = NO;
                [sender setTitle:[NSString stringWithFormat:@"%@ (%lds)",titleBut,(long)second] forState:UIControlStateNormal];
                [sender setTitleColor:titleColor forState:UIControlStateNormal];
                second--;
            }else
            {
                sender.userInteractionEnabled = YES;
                dispatch_source_cancel(timer);
                block();
            }
        });
    });
    dispatch_resume(timer);
}


-(BOOL)XJValidateContactNumber:(NSString *)mobileNum
{
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    NSString * CT = @"^1((33|53|4[0-9]|7[0-9]|8[0-9]|9[0-9])[0-9]|349)\\d{7}$";
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestPHS = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    if(([regextestmobile evaluateWithObject:mobileNum] == YES)
       || ([regextestcm evaluateWithObject:mobileNum] == YES)
       || ([regextestct evaluateWithObject:mobileNum] == YES)
       || ([regextestcu evaluateWithObject:mobileNum] == YES)
       || ([regextestPHS evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }else
    {
        return NO;
    }
}



@end
