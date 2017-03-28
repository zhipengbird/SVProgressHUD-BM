//
//  SVProgressHUD+Instance.h
//  SVProgressHUD
//
//  Created by bomo on 2017/3/21.
//  Copyright © 2017年 EmbeddedSources. All rights reserved.
//

#import "SVProgressHUD.h"

@interface SVProgressHUD (Instance)

/** create hud instance in view with SVProgressHUDStyleDark, and SVProgressHUDMaskTypeClear */
+ (SVProgressHUD *)HUDWith:(UIView *)view;

- (UIVisualEffectView*)hudView;

- (void)show;
- (void)showWithStatus:(NSString*)status;

- (void)showProgress:(float)progress;
- (void)showProgress:(float)progress status:(NSString*)status;

- (void)setStatus:(NSString*)status; // change the HUD loading status while it's showing

// stops the activity indicator, shows a glyph + status, and dismisses the HUD a little bit later
- (void)showInfoWithStatus:(NSString*)status;
- (void)showSuccessWithStatus:(NSString*)status;
- (void)showErrorWithStatus:(NSString*)status;

// shows a image + status, use 28x28 white PNGs
- (void)showImage:(UIImage*)image status:(NSString*)status;
- (void)showImage:(UIImage*)image status:(NSString*)status duration:(NSTimeInterval)duration;

- (void)dismiss;
- (void)dismissWithCompletion:(SVProgressHUDDismissCompletion)completion;
- (void)dismissWithDelay:(NSTimeInterval)delay;
- (void)dismissWithDelay:(NSTimeInterval)delay completion:(SVProgressHUDDismissCompletion)completion;

- (BOOL)isVisible;

@end
