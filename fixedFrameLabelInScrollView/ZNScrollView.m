//
//  ZNScrollView.m
//  fixedFrameLabelInScrollView
//
//  Created by 李煜 on 2020/7/5.
//  Copyright © 2020 李煜. All rights reserved.
//

#import "ZNScrollView.h"

@implementation ZNScrollView

- (void)layoutSubviews
{
    [super layoutSubviews];
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[UILabel class]]) {
            CGRect rect = view.frame;
            rect.origin.y = 0 + self.contentOffset.y;
            view.frame = rect;
        }
        
    }
}

@end
