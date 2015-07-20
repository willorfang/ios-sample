//
//  ViewController.m
//  CASample
//
//  Created by Wei Fang on 2015/07/20.
//  Copyright (c) 2015年 Wei Fang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *layerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // create sublayer
    CALayer* blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(50, 50, 100, 100);
    blueLayer.backgroundColor = [UIColor yellowColor].CGColor;
    
    UIImage* image = [UIImage imageNamed:@"baby.png"];
    blueLayer.contents = (__bridge id)image.CGImage;
    
    // add to root layer
    [self.layerView.layer addSublayer:blueLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
