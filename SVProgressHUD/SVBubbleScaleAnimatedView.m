//
//  SVBubbleScaleAnimatedView.m
//  SVProgressHUD
//
//  Created by 袁平华 on 2017/4/7.
//  Copyright © 2017年 EmbeddedSources. All rights reserved.
//

#import "SVBubbleScaleAnimatedView.h"
#import "UIView+AutoLayout.h"
#define MIN_SIZE 10
#define MAX_SIZE 25
#define ANIMATION_TIME .5


@interface SVBubbleScaleAnimatedView ()

/**
 左边的泡泡
 */
@property(nonatomic,strong)UIView* lefBubble;

/**
 右边的泡泡
 */
@property(nonatomic,strong)UIView* rightBubble;


@property(nonatomic,strong)UIColor * color;


@end


@implementation SVBubbleScaleAnimatedView

- (void)setFrame:(CGRect)frame {
    if(!CGRectEqualToRect(frame, super.frame)) {
        [super setFrame:frame];
        
        if(self.superview) {
            [self layoutAnimatedView];
        }
    }
    
}
- (void)willMoveToSuperview:(UIView*)newSuperview {
    if (newSuperview) {
        [self layoutAnimatedView];
    } else {
        [_rightBubble removeFromSuperview];
        [_lefBubble removeFromSuperview];
        [_rightBubble.layer removeAllAnimations];
        [_lefBubble.layer removeAllAnimations];
    }
}

- (void)addAnimationLayer {
    CABasicAnimation *scaleAnimationLeft = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimationLeft.fromValue = [NSNumber numberWithFloat:1];
    scaleAnimationLeft.toValue = [NSNumber numberWithFloat:0.2];
    scaleAnimationLeft.duration = ANIMATION_TIME;
    scaleAnimationLeft.autoreverses = YES;
    scaleAnimationLeft.removedOnCompletion=NO;
    scaleAnimationLeft.repeatCount = FLT_MAX;
    [self.lefBubble.layer addAnimation:scaleAnimationLeft forKey:@"leftView.scale"];
    
    CABasicAnimation *scaleAnimationRight = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimationRight.fromValue = [NSNumber numberWithFloat:.2];
    scaleAnimationRight.toValue = [NSNumber numberWithFloat:1];
    scaleAnimationRight.duration = ANIMATION_TIME;
    scaleAnimationRight.autoreverses = YES;
    scaleAnimationRight.removedOnCompletion=NO;
    scaleAnimationRight.repeatCount = FLT_MAX;
    [self.rightBubble.layer addAnimation:scaleAnimationRight forKey:@"rightView.scale"];
}

-(void)layoutAnimatedView{
   
    
    [self addSubview:self.lefBubble];
    [self addSubview:self.rightBubble];
    
    [self.lefBubble setAutoLayoutCenterYToViewCenterY:self constant:0];
    [self.lefBubble setAutoLayoutSize:CGSizeMake(MAX_SIZE, MAX_SIZE)];
    [self.lefBubble setAutoLayoutCenterXToViewCenterX:self constant:-MAX_SIZE/2*1.5];
    
    [self.rightBubble setAutoLayoutCenterYToViewCenterY:self constant:0];
    [self.rightBubble setAutoLayoutSize:CGSizeMake(MAX_SIZE, MAX_SIZE)];
    [self.rightBubble setAutoLayoutLeftToViewRight:self.lefBubble constant:5];
    
    
    
    self.lefBubble.layer.cornerRadius = MAX_SIZE/2.0;
    
    self.lefBubble.layer.masksToBounds=YES;
    self.rightBubble.layer.cornerRadius = MAX_SIZE/2.0;
    self.rightBubble.layer.masksToBounds=YES;
    [self addAnimationLayer];
    
}


-(CGSize)sizeThatFits:(CGSize)size{
    return CGSizeMake(100, 60);
}

-(UIView *)lefBubble{
    if (!_lefBubble) {
        _lefBubble =[[UIView alloc]initWithFrame:CGRectZero];
        _lefBubble.layer.anchorPoint=CGPointMake(0.5, 0.5);
        _lefBubble.backgroundColor= self.color;
    }
    return _lefBubble;
}

-(UIView *)rightBubble{
    if (!_rightBubble) {
        _rightBubble =[[UIView alloc]initWithFrame:CGRectZero];
        _rightBubble.layer.anchorPoint=CGPointMake(0.5, 0.5);

        _rightBubble.backgroundColor = self.color;
    }
    return _rightBubble;
}

-(UIColor *)color{
    if (!_color) {
        _color =[UIColor redColor];
    }
    return _color;
}

-(void)setBubbleColor:(UIColor *)bubbleColor{
    _color = bubbleColor;
    _bubbleColor= bubbleColor;
    _rightBubble.backgroundColor = self.bubbleColor;
    _lefBubble.backgroundColor= self.bubbleColor;


}
@end
