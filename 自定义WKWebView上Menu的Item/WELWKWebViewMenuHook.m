//
//  WELWKWebViewMenuHook.m
//  RuntimePlayer
//
//  Created by WELCommand on 2017/8/2.
//  Copyright © 2017年 WELCommand. All rights reserved.
//

#import "WELWKWebViewMenuHook.h"
#import <objc/runtime.h>

BOOL wel_canPerformAction(id self,  SEL _cmd, SEL arg1, id arg2) {
    
    NSString *actionString = NSStringFromSelector(arg1);
    if ([actionString isEqualToString:@"copy:"] || [actionString isEqualToString:@"_define:"]) {
        return YES;
    } else {
        return NO;
    }
}

@implementation WELWKWebViewMenuHook

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method  m = class_getInstanceMethod(NSClassFromString(@"WKContentView"), NSSelectorFromString(@"canPerformAction:withSender:"));
        
        class_addMethod(NSClassFromString(@"WKContentView"), NSSelectorFromString(@"wel_canPerformAction:withSender:"), (IMP)wel_canPerformAction, method_getTypeEncoding(m));
        
        Method m1 = class_getInstanceMethod(NSClassFromString(@"WKContentView"),NSSelectorFromString(@"canPerformAction:withSender:"));
        Method m2 = class_getInstanceMethod(NSClassFromString(@"WKContentView"), NSSelectorFromString(@"wel_canPerformAction:withSender:"));
        method_exchangeImplementations(m1,m2);
    });
}

- (BOOL)wel_canPerformAction:(SEL)arg1 withSender:(id)arg2 {return NO;}
@end
