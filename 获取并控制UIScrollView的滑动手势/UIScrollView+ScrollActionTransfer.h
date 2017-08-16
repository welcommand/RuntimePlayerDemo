//
//  UITableView+ScrollActionTransfer.h
//  scrollTest
//
//  Created by WELCommand on 2017/5/2.
//  Copyright © 2017年 WELCommand. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScrollActionTransfer.h"


@interface UIScrollView (ScrollActionTransfer)

@property (nonatomic, weak) IBOutlet id <ScrollActionTransfer> scrollActionDelegate;

@end
