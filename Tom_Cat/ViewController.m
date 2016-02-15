//
//  ViewController.m
//  Tom_Cat
//
//  Created by Transuner on 16/1/29.
//  Copyright © 2016年 吴冰. All rights reserved.
//

#import "ViewController.h"

#import "TomCatView.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    TomCatView * tomCatView = [[TomCatView alloc]initWithFrame:(CGRect){0,0,S_SCREEN_WIDTH,S_SCREEN_HEIGHT}];
    
    [self.view addSubview:tomCatView];
}




@end
