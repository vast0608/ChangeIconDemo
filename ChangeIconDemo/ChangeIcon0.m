//
//  ChangeIcon0.m
//  ChangeIconDemo
//
//  Created by 李晓璐 on 2018/3/5.
//  Copyright © 2018年 onmmc. All rights reserved.
//

#import "ChangeIcon0.h"

@interface ChangeIcon0 ()

@end

@implementation ChangeIcon0

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(120, 120, 120, 120)];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"弹窗换图标" forState:0];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)buttonClick{
    NSArray *weathers = @[@"晴", @"多云", @"小雨", @"大雨", @"雪", @""];
    NSString *iconName = weathers[arc4random() % weathers.count];
    
    if (![[UIApplication sharedApplication] supportsAlternateIcons]) {
        return;
    }
    
    if ([iconName isEqualToString:@""]) {
        iconName = nil;
    }
    [[UIApplication sharedApplication] setAlternateIconName:iconName completionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"更换app图标发生错误了 ： %@",error);
        }
    }];
}

@end
