//
//  UIImage+Extension.m
//  asynchronousClippingDemo
//
//  Created by 刘培策 on 16/11/1.
//  Copyright © 2016年 UniqueCe. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

- (void)imageWithSize:(CGSize)ImageSize fillColor:(UIColor *)fillColor Callback:(void (^)(UIImage *))callback {
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        UIGraphicsBeginImageContextWithOptions(ImageSize, YES, 0);
        
        CGRect rect = CGRectMake(0, 0, ImageSize.width, ImageSize.height);
        
        [fillColor setFill];
        UIRectFill(rect);
        
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
        
        [path addClip];
        
        [self drawInRect:rect];
        
        UIImage *currentImage = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        dispatch_async(dispatch_get_main_queue(), ^{
        
            if (callback != nil) {
                
                callback(currentImage);
            }
        });
    });
}

@end
