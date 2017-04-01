//
//  FirstViewController.m
//  SVProgressHUDDemo
//
//  Created by bomo on 2017/3/21.
//  Copyright © 2017年 EmbeddedSources. All rights reserved.
//

#import "FirstViewController.h"
#import <SVProgressHUD/SVProgressHUD+Instance.h>
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    SVProgressHUD *hud = [SVProgressHUD HUDWith:self.view];
    
    SVProgressHUD *hud = [SVProgressHUD HUDWith:self.view];
    hud.minimumSize = CGSizeMake(120, 100);
    [hud showWithStatus:@"loading"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [hud showSuccessWithStatus:@"success"];
        [hud dismissWithDelay:1];
    });
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)hub:(id)sender {
    
    NSBundle *bundle = [NSBundle bundleForClass:[SVProgressHUD class]];
    NSURL *url = [bundle URLForResource:@"SVProgressHUD" withExtension:@"bundle"];
    NSBundle *imageBundle = [NSBundle bundleWithURL:url];
    
    NSString *path = [imageBundle pathForResource:@"greet" ofType:@"gif"];
//    [SVProgressHUD showImage: [ UIImage sd_animatedGIFilePath:path]status:@"正在加载"];
    [SVProgressHUD showWithStatus:@"helloofdsafdsafasdf"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
