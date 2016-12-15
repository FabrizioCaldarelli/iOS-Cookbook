/**
 @header UIHelper.h
 @author Fabrizio Caldarelli
 @version 1
 */
#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface UIHelper : NSObject

#pragma mark Loader
+(UIView*)showWaiterInController:(UIViewController*)vcInput message:(NSString*)message;
+ (void)hideWaiter:(UIView *)viewConPHUD;

#pragma mark Alert Standard
+ (void)showAlertOK:(UIViewController*)presenterController title:(NSString*)title message:(NSString*)message okCallback:(void (^)())okCallback;

#pragma mark Color
+ (UIColor *)colorWithHexString:(NSString *)hexWithAlphaString;

@end
