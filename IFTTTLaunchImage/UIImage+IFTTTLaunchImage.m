//
//  UIImage+IFTTTLaunchImage.m
//  IFTTTLaunchImage
//
//  Created by Jonathan Hersh on 1/7/15.
//  Copyright (c) 2015 Jonathan Hersh. All rights reserved.
//

#import "UIImage+IFTTTLaunchImage.h"
#import "UIDevice+IFTTTLaunchImage.h"

NSString * const kIFTTTDefaultLaunchImageSetName = @"LaunchImage";

@implementation UIImage (IFTTTLaunchImage)

#pragma mark - Launch Image selection

+ (instancetype)IFTTTDefaultLaunchImage {
    return [self IFTTTLaunchImageNamed:kIFTTTDefaultLaunchImageSetName];
}

+ (instancetype)IFTTTLaunchImageNamed:(NSString *)name {
    NSMutableString *imageName = [NSMutableString stringWithString:name];
    UIScreen *screen = [UIScreen mainScreen];
    CGFloat height = CGRectGetHeight(screen.bounds);
    CGSize screenSize = screen.currentMode.size;
    
    if ([[UIDevice currentDevice] IFTTTDeviceIsiPad]) {
        if ([[UIDevice currentDevice] IFTTTDeviceIsLandscape]) {
            [imageName appendString:@"-700-Landscape"];
        } else {
            [imageName appendString:@"-700-Portrait"];
        }
        
        [imageName appendString:@"~ipad"];
    } else if (height == 568.f) {
        [imageName appendString:@"-700-568h"];
    } else if (height == 667.f) {
        [imageName appendString:@"-800-667h"];
    } else if (height == 736.f || height == 414.f) {
        if ([[UIDevice currentDevice] IFTTTDeviceIsLandscape]) {
            [imageName appendString:@"-800-Landscape-736h"];
        } else {
            [imageName appendString:@"-800-Portrait-736h"];
        }
    } else if (height == 812.f) {
        [imageName appendString:@"-1100-Portrait-2436h"];
    } else if (height == 896.f) {
        if (screenSize.height == 2688) {
            //Xs Max
            [imageName appendString:@"-1200-Portrait-2688h"];
        } else {
            //Xr
            [imageName appendString:@"-1200-Portrait-1792h"];
        }
    } else {
        [imageName appendString:@"-700"];
    }
    //Xs max <UIScreen: 0x7fbd3c601eb0; bounds = {{0, 0}, {414, 896}}; mode = <UIScreenMode: 0x600002590440; size = 1242.000000 x 2688.000000>>
    //xr     <UIScreen: 0x7fab9f4059a0; bounds = {{0, 0}, {414, 896}}; mode = <UIScreenMode: 0x6000013881a0; size = 828.000000 x 1792.000000>>
    //Xs     <UIScreen: 0x7faf57c08960; bounds = {{0, 0}, {375, 812}}; mode = <UIScreenMode: 0x60000189df00; size = 1125.000000 x 2436.000000>>
    return [UIImage imageNamed:imageName];
}

@end
