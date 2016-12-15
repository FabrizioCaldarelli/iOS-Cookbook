/**
 @header UIHelper.h
 @author Fabrizio Caldarelli
 @version 2
 */
#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface UIHelper : NSObject

#pragma mark Loader
+(UIView*)showWaiterInController:(UIViewController*)vcInput message:(NSString*)message;
+ (void)hideWaiter:(UIView *)viewConPHUD;

#pragma mark Alert Standard
+ (void)showAlertOK:(UIViewController*)presenterController title:(NSString*)title message:(NSString*)message okCallback:(void (^)())okCallback;

#pragma mark - Alert Yes No
+ (void)showAlertYesNo:(UIViewController*)presenterController title:(NSString*)title message:(NSString*)message resultCallback:(void (^)(BOOL))resultCallback;

#pragma mark Color
+ (UIColor *)colorWithHexString:(NSString *)hexWithAlphaString;

@end
