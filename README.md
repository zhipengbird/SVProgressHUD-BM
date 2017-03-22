# SVProgressHUD

## Addition Support
the default hud is only for global, there is on one shareView, sometime we want some hud for specific view only mask the specific view, here i have add SVProgressHUD+Instance for instance support, the methond is the same as the default class method


## Install
### Cocoapods
```bash
pod 'SVProgressHUD+BM', '~> 0.0.1'
```

### Carthage
```
github "zhengbomo/SVProgressHUD" == 0.0.1
```

### Usage
```objc
#import <SVProgressHUD/SVProgressHUD+Instance.h>


SVProgressHUD *hud = [SVProgressHUD HUDWith:self.view];
hud.minimumSize = CGSizeMake(120, 100);
[hud showWithStatus:@"loading"];
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    [hud showSuccessWithStatus:@"success"];
    [hud dismissWithDelay:1];
});
```

the instance method is the same as class method
