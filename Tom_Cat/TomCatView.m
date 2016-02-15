//
//  TomCatView.m
//  Tom_Cat
//
//  Created by Transuner on 16/1/29.
//  Copyright © 2016年 吴冰. All rights reserved.
//

#import "TomCatView.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
#import "UIView+SDAutoLayout.h"

@interface TomCatView ()
@property (nonatomic, strong) UIImageView * tomImageView;
@property (nonatomic, strong) UIButton * cymbal;
@property (nonatomic, strong) UIButton * eat;
@property (nonatomic, strong) UIButton * drink;
@property (nonatomic, strong) UIButton * scratch;
@property (nonatomic, strong) UIButton * pie;
@property (nonatomic, strong) UIButton * fart;

@end

@implementation TomCatView

- (instancetype) initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self Constraint];
    }
    return self;
}

- (void)Constraint {
    self.tomImageView.sd_layout.leftEqualToView(self);
    self.tomImageView.sd_layout.rightEqualToView(self);
    self.tomImageView.sd_layout.topEqualToView(self);
    self.tomImageView.sd_layout.bottomEqualToView(self);
    
    self.cymbal.sd_layout.leftEqualToView(self);
    self.cymbal.sd_layout.bottomSpaceToView(self,160);
    self.cymbal.sd_layout.widthIs(60);
    self.cymbal.sd_layout.heightIs(60);
    
    self.eat.sd_layout.leftEqualToView(self);
    self.eat.sd_layout.topSpaceToView(self.cymbal,10);
    self.eat.sd_layout.widthIs(60);
    self.eat.sd_layout.heightIs(60);
    
    self.drink.sd_layout.leftEqualToView(self);
    self.drink.sd_layout.topSpaceToView(self.eat,10);
    self.drink.sd_layout.widthIs(60);
    self.drink.sd_layout.heightIs(60);
    
    self.scratch.sd_layout.rightEqualToView(self);
    self.scratch.sd_layout.bottomSpaceToView(self,160);
    self.scratch.sd_layout.widthIs(60);
    self.scratch.sd_layout.heightIs(60);
    
    self.pie.sd_layout.rightEqualToView(self);
    self.pie.sd_layout.topSpaceToView(self.scratch,10);
    self.pie.sd_layout.widthIs(60);
    self.pie.sd_layout.heightIs(60);
    
    self.fart.sd_layout.rightEqualToView(self);
    self.fart.sd_layout.topSpaceToView(self.pie,10);
    self.fart.sd_layout.widthIs(60);
    self.fart.sd_layout.heightIs(60);
    
}


- (UIImageView *) tomImageView {
    
    if (!_tomImageView) {
        _tomImageView = [[UIImageView alloc]init];
        _tomImageView.image = [UIImage imageNamed:@"angry_00.jpg"];
        [self addSubview:_tomImageView];
    }
    return _tomImageView;
}

- (UIButton *)cymbal {
    if (!_cymbal) {
        _cymbal = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cymbal setBackgroundImage:R_Image(@"cymbal") forState:UIControlStateNormal];
        [_cymbal setTag:1];
        [_cymbal addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_cymbal];
    }
    return _cymbal;
}

- (UIButton *)eat {
    if (!_eat) {
        _eat = [UIButton buttonWithType:UIButtonTypeCustom];
        [_eat setBackgroundImage:R_Image(@"eat") forState:UIControlStateNormal];
        [_eat setTag:2];
        [_eat addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_eat];
    }
    return _eat;
}

- (UIButton *)drink {
    if (!_drink) {
        _drink = [UIButton buttonWithType:UIButtonTypeCustom];
        [_drink setBackgroundImage:R_Image(@"drink") forState:UIControlStateNormal];
        [_drink setTag:3];
        [_drink addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_drink];
    }
    return _drink;
}

- (UIButton *)scratch {
    if (!_scratch) {
        _scratch = [UIButton buttonWithType:UIButtonTypeCustom];
        [_scratch setBackgroundImage:R_Image(@"scratch") forState:UIControlStateNormal];
        [_scratch setTag:4];
        [_scratch addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_scratch];
    }
    return _scratch;
}

- (UIButton *)pie {
    if (!_pie) {
        _pie = [UIButton buttonWithType:UIButtonTypeCustom];
        [_pie setBackgroundImage:R_Image(@"pie") forState:UIControlStateNormal];
        [_pie setTag:5];
        [_pie addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_pie];
    }
    return _pie;
}

- (UIButton *)fart {
    if (!_fart) {
        _fart = [UIButton buttonWithType:UIButtonTypeCustom];
        [_fart setBackgroundImage:R_Image(@"fart") forState:UIControlStateNormal];
        [_fart setTag:6];
        [_fart addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_fart];
    }
    return _fart;
}

- (void) action:(UIButton *) sender {
    
    switch (sender.tag) {
        case 1:{
            [self animatation:13 name:@"cymbal"];
        }
            break;
        case 2:{
            [self animatation:38 name:@"eat"];
        }
            break;
        case 3:{
            [self animatation:79 name:@"drink"];
        }
            break;
        case 4:{
            [self animatation:54 name:@"scratch"];
        }
            break;
        case 5:{
            [self animatation:22 name:@"pie"];
        }
            break;
        case 6:{
            [self animatation:26 name:@"fart"];
        }
            break;
            
        default:
            break;
    }
}

- (void)animatation:(NSInteger) count name:(NSString *) name {
    
    NSMutableArray * array = [[NSMutableArray alloc]initWithCapacity:count];
    
    for(int i = 0; i < count;i++){
        
        NSString * fileName= [NSString stringWithFormat:@"%@_%02d.jpg",name,i];
        
        NSBundle * bundle = [NSBundle mainBundle];
        NSString * path   = [bundle pathForResource:fileName ofType:nil];
        UIImage  * image  = [UIImage imageWithContentsOfFile:path];
        
        [array addObject:(__bridge UIImage *)image.CGImage];
    }
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
    animation.duration = array.count * 0.08;
    animation.delegate = self;
    animation.values = array;
    
    [self.tomImageView.layer addAnimation:animation forKey:@"contents"];
}

- (void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    NSLog(@"动画结束了，主要看内存会不会降下来！%s",__FUNCTION__);
}

@end
