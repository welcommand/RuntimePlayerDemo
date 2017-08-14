//
//  WKWebView+AnimateSupport.m
//  RuntimePlayer
//
//  Created by WELCommand on 2017/6/29.
//  Copyright © 2017年 WELCommand. All rights reserved.
//

#import "WKWebView+AnimateSupport.h"
#import <objc/runtime.h>

@implementation WKWebView (AnimateSupport)


- (void)wel__willStartScrollingOrZooming {
    [self.scrollView.subviews.firstObject performSelector:NSSelectorFromString(@"_willStartScrollingOrZooming")];
    
}

- (void)wel__didEndScrollingOrZooming {
    [self.scrollView.subviews.firstObject performSelector:NSSelectorFromString(@"_didEndScrollingOrZooming")];
}

@end
