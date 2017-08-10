```
void wel_AscII_fake (id self, SEL _cmd, BOOL arg1, BOOL arg2) {
    
}

__attribute__((constructor)) static void iosFixKeyboardBug(void) {
    Method m = class_getInstanceMethod(NSClassFromString(@"UIKeyboardImpl"), @selector(updateInputModeIndicatorOnSingleKeyOnly:preserveIfPossible:));
    
    method_setImplementation(m, (IMP)wel_AscII_fake);
}
```

