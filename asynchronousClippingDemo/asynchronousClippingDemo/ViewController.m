//
//  ViewController.m
//  asynchronousClippingDemo
//
//  Created by 刘培策 on 16/11/1.
//  Copyright © 2016年 UniqueCe. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Extension.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(200, 200, 150, 150)];
    
    [self.view addSubview:imageView];
    
    UIImage *ima = [UIImage imageNamed:@"003"];
    
    [ima imageWithSize:imageView.bounds.size fillColor:[UIColor whiteColor] Callback:^(UIImage *image) {
        
        imageView.image = image;
    }];
}


@end
