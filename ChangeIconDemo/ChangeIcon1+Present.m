//
//  ChangeIcon1+Present.m
//  ChangeIconDemo
//
//  Created by 李晓璐 on 2018/3/5.
//  Copyright © 2018年 onmmc. All rights reserved.
//

#import "ChangeIcon1+Present.h"
#import <objc/runtime.h>

@implementation ChangeIcon1 (Present)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method presentM = class_getInstanceMethod(self.class, @selector(presentViewController:animated:completion:));
        Method presentSwizzlingM = class_getInstanceMethod(self.class, @selector(dy_presentViewController:animated:completion:));
        
        method_exchangeImplementations(presentM, presentSwizzlingM);
    });
}

- (void)dy_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
    
    if ([viewControllerToPresent isKindOfClass:[UIAlertController class]]) {
        NSLog(@"title : %@",((UIAlertController *)viewControllerToPresent).title);
        NSLog(@"message : %@",((UIAlertController *)viewControllerToPresent).message);
        
        UIAlertController *alertController = (UIAlertController *)viewControllerToPresent;
        if (alertController.title == nil && alertController.message == nil) {
            return;
        } else {
            [self dy_presentViewController:viewControllerToPresent animated:flag completion:completion];
            return;
        }
    }
    
    [self dy_presentViewController:viewControllerToPresent animated:flag completion:completion];
}

@end
