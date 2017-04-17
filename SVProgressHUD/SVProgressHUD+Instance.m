//
//  SVProgressHUD+Instance.m
//  SVProgressHUD
//
//  Created by bomo on 2017/3/21.
//  Copyright © 2017年 EmbeddedSources. All rights reserved.
//

#import "SVProgressHUD+Instance.h"

@implementation SVProgressHUD (Instance)

/**  */
+ (SVProgressHUD *)HUDWith:(UIView *)view
{
    SVProgressHUD *instance = [[self alloc] init];
    instance.containerView = view;
    instance.defaultStyle = SVProgressHUDStyleDark;
    instance.defaultMaskType = SVProgressHUDMaskTypeClear;
    instance.defaultAnimationType =SVProgressHUDAnimationTypeCustom;
    return instance;
}

- (void)show {
    [self showWithStatus:nil];
}

- (void)showWithMaskType:(SVProgressHUDMaskType)maskType {
    SVProgressHUDMaskType existingMaskType = self.defaultMaskType;
    [self setDefaultMaskType:maskType];
    [self show];
    [self setDefaultMaskType:existingMaskType];
}

- (void)showWithStatus:(NSString*)status {
    [self showProgress:-1 status:status];
}

- (void)showWithStatus:(NSString*)status maskType:(SVProgressHUDMaskType)maskType {
    SVProgressHUDMaskType existingMaskType = self.defaultMaskType;
    [self setDefaultMaskType:maskType];
    [self showWithStatus:status];
    [self setDefaultMaskType:existingMaskType];
}

- (void)showProgress:(float)progress {
    [self showProgress:progress status:nil];
}

- (void)showProgress:(float)progress maskType:(SVProgressHUDMaskType)maskType {
    SVProgressHUDMaskType existingMaskType = self.defaultMaskType;
    [self setDefaultMaskType:maskType];
    [self showProgress:progress];
    [self setDefaultMaskType:existingMaskType];
}

- (void)showProgress:(float)progress status:(NSString*)status maskType:(SVProgressHUDMaskType)maskType {
    SVProgressHUDMaskType existingMaskType = self.defaultMaskType;
    [self setDefaultMaskType:maskType];
    [self showProgress:progress status:status];
    [self setDefaultMaskType:existingMaskType];
}


#pragma mark - Show, then automatically dismiss methods

- (void)showInfoWithStatus:(NSString*)status {
    [self showImage:self.infoImage status:status];
}

- (void)showInfoWithStatus:(NSString*)status maskType:(SVProgressHUDMaskType)maskType {
    SVProgressHUDMaskType existingMaskType = self.defaultMaskType;
    [self setDefaultMaskType:maskType];
    [self showInfoWithStatus:status];
    [self setDefaultMaskType:existingMaskType];
}

- (void)showSuccessWithStatus:(NSString*)status {
    [self showImage:self.successImage status:status];
}

- (void)showSuccessWithStatus:(NSString*)status maskType:(SVProgressHUDMaskType)maskType {
    SVProgressHUDMaskType existingMaskType = self.defaultMaskType;
    [self setDefaultMaskType:maskType];
    [self showSuccessWithStatus:status];
    [self setDefaultMaskType:existingMaskType];
}

- (void)showErrorWithStatus:(NSString*)status {
    [self showImage:self.errorImage status:status];
}

- (void)showErrorWithStatus:(NSString*)status maskType:(SVProgressHUDMaskType)maskType {
    SVProgressHUDMaskType existingMaskType = self.defaultMaskType;
    [self setDefaultMaskType:maskType];
    [self showErrorWithStatus:status];
    [self setDefaultMaskType:existingMaskType];
}

- (void)showImage:(UIImage*)image status:(NSString*)status {
    NSTimeInterval displayInterval = [self displayDurationForString:status];
    [self showImage:image status:status duration:displayInterval];
}

- (void)showImage:(UIImage*)image status:(NSString*)status maskType:(SVProgressHUDMaskType)maskType {
    SVProgressHUDMaskType existingMaskType = self.defaultMaskType;
    [self setDefaultMaskType:maskType];
    [self showImage:image status:status];
    [self setDefaultMaskType:existingMaskType];
}


#pragma mark - Dismiss Methods
- (void)dismiss {
    [self dismissWithDelay:0.0 completion:nil];
}

- (void)dismissWithCompletion:(SVProgressHUDDismissCompletion)completion {
    [self dismissWithDelay:0.0 completion:completion];
}

- (void)dismissWithDelay:(NSTimeInterval)delay {
    [self dismissWithDelay:delay completion:nil];
}

#pragma mark - Getters
- (NSTimeInterval)displayDurationForString:(NSString*)string {
    CGFloat minimum = MAX((CGFloat)string.length * 0.06 + 0.5, self.minimumDismissTimeInterval);
    return MIN(minimum, self.maximumDismissTimeInterval);
}

- (BOOL)isVisible {
    // Checking one alpha value is sufficient as they are all the same
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
    return (self.hudView.contentView.alpha > 0.0f);
#else
    return self.hudView.alpha > 0.0f;
#endif
}


@end
