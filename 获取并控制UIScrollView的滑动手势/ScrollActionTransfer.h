//
//  ScrollActionTransfer.h
//  scrollTest
//
//  Created by WELCommand on 2017/5/2.
//  Copyright © 2017年 WELCommand. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ScrollActionTransfer <NSObject>

- (void)scrollView:(UIScrollView *)scrollView transferPanAction:(UIPanGestureRecognizer *)gesture;

- (BOOL)scrollView:(UIScrollView *)scrollView useSystemPanAction:(UIPanGestureRecognizer *)gesture;


@end
