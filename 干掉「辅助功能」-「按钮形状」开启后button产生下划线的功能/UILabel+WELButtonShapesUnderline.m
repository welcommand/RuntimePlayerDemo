//
//  UILabel+WELButtonShapesUnderline.m
//  testBtn
//
//  Created by WELCommand on 2017/8/22.
//  Copyright © 2017年 WELCommand. All rights reserved.
//

#import "UILabel+WELButtonShapesUnderline.h"
#import <objc/runtime.h>

BOOL wel_buttonShapesUnderline(id self, SEL _cmd) {
    return NO;
}

@implementation UILabel (WELButtonShapesUnderline)

+(void)load {
    Method m = class_getInstanceMethod([UILabel class], NSSelectorFromString(@"_shouldShowAccessibilityButtonShapesUnderline"));
    method_setImplementation(m, (IMP)wel_buttonShapesUnderline);
}

@end
