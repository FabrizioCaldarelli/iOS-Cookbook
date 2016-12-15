/**
 @header UIHelper.m
 @author Fabrizio Caldarelli
 @version 2
 */
#import "UIHelper.h"

@implementation UIHelper

#define K_UIHELPER_WAITER_DEFAULT_MESSAGE LS(@"Caricamento in corso")
#define K_UIHELPER_ALERT_OK_LABEL LS(@"OK")
#define K_UIHELPER_ALERT_YES_LABEL LS(@"Si")
#define K_UIHELPER_ALERT_NO_LABEL LS(@"No")
#define LS(str) NSLocalizedString(str, str)


#pragma mark Loader
+(UIView*)showWaiterInController:(UIViewController*)vcInput message:(NSString*)message
{
    NSString *str = (message!=nil)?message:K_UIHELPER_WAITER_DEFAULT_MESSAGE;
    
    UIViewController *vcTemp = vcInput;
    while(vcTemp.parentViewController != nil) vcTemp = vcTemp.parentViewController;
    
    UIView *vTemp = [[UIView alloc] initWithFrame:vcTemp.view.bounds];
    [vTemp setBackgroundColor:[UIColor clearColor]];
    [vcTemp.view addSubview:vTemp];
    
    
    MBProgressHUD *pHUD = [MBProgressHUD showHUDAddedTo:vTemp animated:YES];
    pHUD.mode = MBProgressHUDModeIndeterminate;
    //[pHUD.bezelView setBackgroundColor:[UIColor grayColor]];
    pHUD.labelText = str;
    
    return vTemp;
}
+ (void)hideWaiter:(UIView *)viewConPHUD
{
    dispatch_async(dispatch_get_main_queue(), ^{
        MBProgressHUD *pHUD = [viewConPHUD.subviews firstObject];
        [pHUD hide:YES];
        [viewConPHUD removeFromSuperview];
    });
}


#pragma mark Alert Standard
+ (void)showAlertOK:(UIViewController*)presenterController title:(NSString*)title message:(NSString*)message okCallback:(void (^)())okCallback
{
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [ac addAction:[UIAlertAction actionWithTitle:K_UIHELPER_ALERT_OK_LABEL style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if(okCallback!=nil)
        {
            okCallback();
        }
    }]];
    [presenterController presentViewController:ac animated:YES completion:nil];
}

#pragma mark - Alert Yes No
+ (void)showAlertYesNo:(UIViewController*)presenterController title:(NSString*)title message:(NSString*)message resultCallback:(void (^)(BOOL))resultCallback
{
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    [ac addAction:[UIAlertAction actionWithTitle:K_UIHELPER_ALERT_YES_LABEL style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if(resultCallback!=nil)
        {
            resultCallback(YES);
        }
    }]];
    [ac addAction:[UIAlertAction actionWithTitle:K_UIHELPER_ALERT_NO_LABEL style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if(resultCallback!=nil)
        {
            resultCallback(NO);
        }
    }]];
    [presenterController presentViewController:ac animated:YES completion:nil];
    
}


#pragma mark Color
+ (UIColor *)colorWithHexString:(NSString *)hexWithAlphaString {
    UIColor *c = nil;
    unsigned long long rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexWithAlphaString];
    [scanner setScanLocation:0]; // bypass '#' character
    [scanner scanHexLongLong:&rgbValue];
    
    if(hexWithAlphaString.length == 6)
    {
        c = [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
    }
    else if(hexWithAlphaString.length == 8)
    {
        c = [UIColor colorWithRed:((rgbValue & 0xFF000000) >> 24)/255.0 green:((rgbValue & 0xFF0000) >> 16)/255.0 blue:((rgbValue & 0xFF00) >> 8)/255.0 alpha:(rgbValue & 0xFF)/255.0];
    }
    
    return c;
}

@end
