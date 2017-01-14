//
//  ViewController.m
//  RoundedCornerDemo
//
//  Created by prodream on 17/1/14.
//  Copyright © 2017年 prodream. All rights reserved.
//

#import "ViewController.h"
#import "UIView+RounderCorner.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    //1
    UIImageView* img = [[UIImageView alloc] initWithFrame:CGRectMake(10, 90, 160, 160)];
    img.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    img.image = [UIImage imageNamed:@"img.jpg"];
    img.clipsToBounds = false;
    
    [img addRoundedCorner:50 cornerColor:self.view.backgroundColor borderWidth:10 borderColor:[UIColor blueColor]];
    [self.view addSubview:img];
    
    //2
    
    img = [[UIImageView alloc] initWithFrame:CGRectMake(180, 90, 160, 160)];
    img.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    img.image = [UIImage imageNamed:@"img.jpg"];
    img.clipsToBounds = false;
    
    [img addRoundedCorner:50 cornerColor:[UIColor blackColor] borderWidth:10 borderColor:[UIColor blueColor]];
    [self.view addSubview:img];
    
    
    //3 clipsToBounds and cornerRadius
    img = [[UIImageView alloc] initWithFrame:CGRectMake(10, 260, 160, 160)];
    img.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    img.image = [UIImage imageNamed:@"img.jpg"];
    img.clipsToBounds = true;
    
    img.layer.borderWidth = 10;
    img.layer.borderColor = [UIColor blueColor].CGColor;
    img.layer.cornerRadius = 50;
    [self.view addSubview:img];
    
    //4
    
    img = [[UIImageView alloc] initWithFrame:CGRectMake(180, 260, 160, 160)];
    img.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    img.image = [UIImage imageNamed:@"img.jpg"];
    img.clipsToBounds = false;
    
    [img addRoundedCorner:10 cornerColor:[UIColor blackColor] borderWidth:10 borderColor:[UIColor blueColor]];
    [self.view addSubview:img];
    
    //5
    img = [[UIImageView alloc] initWithFrame:CGRectMake(10, 430, 160, 160)];
    img.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    img.image = [UIImage imageNamed:@"img.jpg"];
    img.clipsToBounds = true;
    
    img.layer.borderWidth = 0;
    img.layer.borderColor = [UIColor blueColor].CGColor;
    img.layer.cornerRadius = 50;
    [self.view addSubview:img];
    
    //6
    
    
    
    UIView* line = [[UIView alloc] initWithFrame:CGRectMake(0, 89, 400, 1)];
    line.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:line];
    
    line = [[UIView alloc] initWithFrame:CGRectMake(160, 0, 1, 800)];
    line.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:line];
    
    line = [[UIView alloc] initWithFrame:CGRectMake(170, 0, 1, 800)];
    line.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:line];
    
    line = [[UIView alloc] initWithFrame:CGRectMake(179, 0, 1, 800)];
    line.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:line];
    
    line = [[UIView alloc] initWithFrame:CGRectMake(189, 0, 1, 800)];
    line.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:line];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
