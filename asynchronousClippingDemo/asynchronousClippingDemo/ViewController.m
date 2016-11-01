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

    [self setupOvalPicture];
    
    [self setupRoundedPicture];
}

- (void)setupOvalPicture {
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.center.x - 75, 100, 150, 150)];
    
    [self.view addSubview:imageView];
    
    UIImage *ima = [UIImage imageNamed:@"003"];
    
    [ima imageWithSize:imageView.bounds.size fillColor:[UIColor whiteColor] Callback:^(UIImage *image) {
        
        imageView.image = image;
    }];
}

- (void)setupRoundedPicture{
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.center.x - 75, 300, 150, 150)];
    
    [self.view addSubview:imageView];
    
    UIImage *ima = [UIImage imageNamed:@"oiuo"];

    [ima imageWithRoundedPictureSize:imageView.bounds.size fillColor:[UIColor whiteColor] Callback:^(UIImage *image) {
        
        imageView.image = image;
    }];

}

@end
