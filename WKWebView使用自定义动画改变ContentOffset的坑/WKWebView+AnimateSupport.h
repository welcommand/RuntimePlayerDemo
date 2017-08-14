//
//  WKWebView+AnimateSupport.h
//  RuntimePlayer
//
//  Created by WELCommand on 2017/6/29.
//  Copyright © 2017年 WELCommand. All rights reserved.
//

#import <WebKit/WebKit.h>

@interface WKWebView (AnimateSupport)

- (void)wel__willStartScrollingOrZooming;
- (void)wel__didEndScrollingOrZooming;

@end
