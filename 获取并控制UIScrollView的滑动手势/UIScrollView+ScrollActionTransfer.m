//
//  UITableView+ScrollActionTransfer.m
//  scrollTest
//
//  Created by WELCommand on 2017/5/2.
//  Copyright © 2017年 WELCommand. All rights reserved.
//

#import "UIScrollView+ScrollActionTransfer.h"
#import <objc/runtime.h>

@implementation UIScrollView (ScrollActionTransfer)


+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method m1 = class_getInstanceMethod([self class],NSSelectorFromString(@"wel_panAction:"));
        Method m2 = class_getInstanceMethod([self class], NSSelectorFromString(@"handlePan:"));
        method_exchangeImplementations(m1,m2);
    });
}


- (void)setScrollActionDelegate:(id<ScrollActionTransfer>)scrollActionDelegate {
    objc_setAssociatedObject(self, @selector(scrollActionDelegate), scrollActionDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id <ScrollActionTransfer>)scrollActionDelegate {
    return objc_getAssociatedObject(self, _cmd);
}


- (void)wel_panAction:(UIPanGestureRecognizer *)gesture {
    
    if([self respondsToSelector:@selector(scrollActionDelegate)] && self.scrollActionDelegate) {
        
        if([self.scrollActionDelegate scrollView:self useSystemPanAction:gesture]) {
            [self wel_panAction:gesture];
        } else {
            [self.scrollActionDelegate scrollView:self transferPanAction:gesture];
        }
    } else {
        [self wel_panAction:gesture];
    }
}

@end
