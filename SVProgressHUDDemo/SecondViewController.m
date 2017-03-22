//
//  SecondViewController.m
//  SVProgressHUDDemo
//
//  Created by bomo on 2017/3/21.
//  Copyright © 2017年 EmbeddedSources. All rights reserved.
//

#import "SecondViewController.h"
#import <SVProgressHUD/SVProgressHUD+Instance.h>

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD setMinimumSize:CGSizeMake(120, 100)];
    
    SVProgressHUD *hud = [SVProgressHUD HUDWith:self.view];
    hud.minimumSize = CGSizeMake(120, 100);
    [hud showWithStatus:@"更新"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [hud dismissWithDelay:1];
    });

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
