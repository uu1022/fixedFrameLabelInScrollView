//
//  ViewController.m
//  fixedFrameLabelInScrollView
//
//  Created by 李煜 on 2020/7/5.
//  Copyright © 2020 李煜. All rights reserved.
//

#import "ViewController.h"
#import "ZNScrollView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet ZNScrollView *scrollView;
@property (nonatomic,strong) UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //防止遍历scrollView'suviews出错 showIndicator=NO 不创建滚动条子视图https://www.jianshu.com/p/d8f62ac4a429
    
    
    
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    CGSize size = [UIScreen mainScreen].bounds.size;
    NSUInteger count = 10;
    CGFloat height = 200;
    for (NSUInteger i=0; i<count; i++) {
        if (i==4) {
            UILabel*label = [[UILabel alloc]initWithFrame:(CGRect){0,i*height,size.width,height}];
            label.text = @"I love u";
            label.textAlignment = NSTextAlignmentCenter;
            self.label = label;
            label.backgroundColor = [self RandomColor];
            [self.scrollView addSubview:label];
            NSLog(@"label--%ld-:%p",i,label);
        }else{
            UIView *v1 =[[UIView alloc]initWithFrame:(CGRect){0,i*height,size.width,height}];
            v1.backgroundColor = [self RandomColor];
            [self.scrollView addSubview:v1];
            NSLog(@"--i-%ld--:%p",i,v1);
        }
        
    }
    UIView *v = self.scrollView.subviews[4];
    NSLog(@"4:%p",v);

//    BOOL isCon = [v isKindOfClass:[UILabel class]];//注意v是否是i=4创建的label
//    [self.scrollView bringSubviewToFront:self.scrollView.subviews[4]];
    [self.scrollView bringSubviewToFront:self.label];

    self.scrollView.contentSize = CGSizeMake(size.width, count*height);
}

- (UIColor*)RandomColor {
    NSInteger aRedValue =arc4random() %255;
    NSInteger  aGreenValue =arc4random() %255;
    NSInteger aBlueValue =arc4random() %255;
    UIColor*randColor = [UIColor colorWithRed:aRedValue /255.0f green:aGreenValue /255.0f blue:aBlueValue /255.0f alpha:1.0f];
    return randColor;
}
@end
