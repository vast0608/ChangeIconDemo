//
//  ViewController.m
//  ChangeIconDemo
//
//  Created by 李晓璐 on 2018/3/5.
//  Copyright © 2018年 onmmc. All rights reserved.
//

#import "ViewController.h"
#import "ChangeIcon0.h"
#import "ChangeIcon1.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
//有弹窗的ChangeIcon
- (IBAction)ChangeIcon0:(id)sender {
    ChangeIcon0 *vc = [ChangeIcon0 new];
    [self.navigationController pushViewController:vc animated:YES];
}
//无弹窗的ChangeIcon
- (IBAction)ChangeIcon1:(id)sender {
    ChangeIcon1 *vc = [ChangeIcon1 new];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
