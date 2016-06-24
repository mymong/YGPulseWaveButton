//
//  YGPulseKeyframeAnimation.m
//  Test01
//
//  Created by Jason Yang on 16/6/24.
//  Copyright © 2016年 YG. All rights reserved.
//

#import "YGPulseKeyframeAnimation.h"

@interface YGPulseKeyframeAnimation ()
@property (nonatomic) YGPulseKeyframeAnimationCompletionBlock completion;
@end

@implementation YGPulseKeyframeAnimation

+ (instancetype)animationWithCGFloatValueForKeyPath:(NSString *)path from:(CGFloat)from to:(CGFloat)to duration:(CGFloat)duration closed:(BOOL)closed completion:(YGPulseKeyframeAnimationCompletionBlock)completion {
    YGPulseKeyframeAnimation *animation = [self animationWithKeyPath:path];
    if (duration > 0) {
        animation.duration = duration;
    }
    animation.delegate = animation;
    animation.completion = completion;
    animation.keyTimes = [self keyTimes];
    animation.values = [self CGFloatValuesFrom:from to:to closed:closed];
    return animation;
}

+ (instancetype)animationWithCGPointValueForKeyPath:(NSString *)path from:(CGPoint)from to:(CGPoint)to duration:(CGFloat)duration closed:(BOOL)closed completion:(YGPulseKeyframeAnimationCompletionBlock)completion {
    YGPulseKeyframeAnimation *animation = [self animationWithKeyPath:path];
    if (duration > 0) {
        animation.duration = duration;
    }
    animation.delegate = animation;
    animation.completion = completion;
    animation.keyTimes = [self keyTimes];
    animation.values = [self CGPointValuesFrom:from to:to closed:closed];
    return animation;
}

+ (instancetype)animationWithCGSizeValueForKeyPath:(NSString *)path from:(CGSize)from to:(CGSize)to duration:(CGFloat)duration closed:(BOOL)closed completion:(YGPulseKeyframeAnimationCompletionBlock)completion {
    YGPulseKeyframeAnimation *animation = [self animationWithKeyPath:path];
    if (duration > 0) {
        animation.duration = duration;
    }
    animation.delegate = animation;
    animation.completion = completion;
    animation.keyTimes = [self keyTimes];
    animation.values = [self CGSizeValuesFrom:from to:to closed:closed];
    return animation;
}

+ (instancetype)animationWithCGRectValueForKeyPath:(NSString *)path from:(CGRect)from to:(CGRect)to duration:(CGFloat)duration closed:(BOOL)closed completion:(YGPulseKeyframeAnimationCompletionBlock)completion {
    YGPulseKeyframeAnimation *animation = [self animationWithKeyPath:path];
    if (duration > 0) {
        animation.duration = duration;
    }
    animation.delegate = animation;
    animation.completion = completion;
    animation.keyTimes = [self keyTimes];
    animation.values = [self CGRectValuesFrom:from to:to closed:closed];
    return animation;
}

+ (instancetype)animationWithCATransform3DScaleForKeyPath:(NSString *)path from:(CGFloat)from to:(CGFloat)to duration:(CGFloat)duration closed:(BOOL)closed completion:(YGPulseKeyframeAnimationCompletionBlock)completion {
    YGPulseKeyframeAnimation *animation = [self animationWithKeyPath:path];
    if (duration > 0) {
        animation.duration = duration;
    }
    animation.delegate = animation;
    animation.completion = completion;
    animation.keyTimes = [self keyTimes];
    animation.values = [self CATransform3DValuesWithScaleFrom:from to:to closed:closed];
    return animation;
}

+ (instancetype)animationWithCGAffineTransformScaleForKeyPath:(NSString *)path from:(CGFloat)from to:(CGFloat)to duration:(CGFloat)duration closed:(BOOL)closed completion:(YGPulseKeyframeAnimationCompletionBlock)completion {
    YGPulseKeyframeAnimation *animation = [self animationWithKeyPath:path];
    if (duration > 0) {
        animation.duration = duration;
    }
    animation.delegate = animation;
    animation.completion = completion;
    animation.keyTimes = [self keyTimes];
    animation.values = [self CGAffineTransformValuesWithScaleFrom:from to:to closed:closed];
    return animation;
}

#pragma mark

+ (NSArray<NSNumber *> *)keyTimes {
    return @[@(0.0),  @(0.1),  @(0.2),  @(0.3),  @(0.4),  @(0.5),  @(0.6),  @(1.0)];
}

+ (NSArray<NSNumber *> *)valueRatesClosed:(BOOL)closed  {
    if (closed) {
        return @[@(0.00), @(0.35), @(0.70), @(0.85), @(0.90), @(0.95), @(1.00), @(0.00)];
    }
    else {
        return @[@(0.00), @(0.35), @(0.70), @(0.85), @(0.90), @(0.95), @(1.00), @(1.00)];
    }
}

+ (NSArray<NSValue *> *)CGFloatValuesFrom:(CGFloat)from to:(CGFloat)to closed:(BOOL)closed {
    CGFloat base = to - from;
    NSMutableArray *array = [NSMutableArray new];
    for (NSNumber *rate in [self valueRatesClosed:closed]) {
        CGFloat floatValue = from + base * rate.floatValue;
        [array addObject:[NSNumber numberWithFloat:floatValue]];
    }
    return array;
}

+ (NSArray<NSValue *> *)CGPointValuesFrom:(CGPoint)from to:(CGPoint)to closed:(BOOL)closed {
    CGPoint base = CGPointMake(to.x - from.x, to.y - from.y);
    NSMutableArray *array = [NSMutableArray new];
    for (NSNumber *rate in [self valueRatesClosed:closed]) {
        CGPoint pointValue = CGPointMake(from.x + base.x * rate.floatValue, from.y + base.y * rate.floatValue);
        [array addObject:[NSValue valueWithCGPoint:pointValue]];
    }
    return array;
}

+ (NSArray<NSValue *> *)CGSizeValuesFrom:(CGSize)from to:(CGSize)to closed:(BOOL)closed {
    CGSize base = CGSizeMake(to.width - from.width, to.height - from.height);
    NSMutableArray *array = [NSMutableArray new];
    for (NSNumber *rate in [self valueRatesClosed:closed]) {
        CGSize sizeValue = CGSizeMake(from.width + base.width * rate.floatValue, from.height + base.height * rate.floatValue);
        [array addObject:[NSValue valueWithCGSize:sizeValue]];
    }
    return array;
}

+ (NSArray<NSValue *> *)CGRectValuesFrom:(CGRect)from to:(CGRect)to closed:(BOOL)closed {
    CGRect base = CGRectMake(to.origin.x - from.origin.x, to.origin.y - from.origin.y, to.size.width - from.size.width, to.size.height - from.size.height);
    NSMutableArray *array = [NSMutableArray new];
    for (NSNumber *rate in [self valueRatesClosed:closed]) {
        CGRect rectValue = CGRectMake(from.origin.x + base.origin.x * rate.floatValue, from.origin.y + base.origin.y * rate.floatValue, from.size.width + base.size.width * rate.floatValue, from.size.height + base.size.height * rate.floatValue);
        [array addObject:[NSValue valueWithCGRect:rectValue]];
    }
    return array;
}

+ (NSArray<NSValue *> *)CATransform3DValuesWithScaleFrom:(CGFloat)from to:(CGFloat)to closed:(BOOL)closed {
    CGFloat base = to - from;
    NSMutableArray *array = [NSMutableArray new];
    for (NSNumber *rate in [self valueRatesClosed:closed]) {
        CGFloat scale = from + base * rate.floatValue;
        CATransform3D transform3DValue = CATransform3DMakeScale(scale, scale, 1);
        [array addObject:[NSValue valueWithCATransform3D:transform3DValue]];
    }
    return array;
}

+ (NSArray<NSValue *> *)CGAffineTransformValuesWithScaleFrom:(CGFloat)from to:(CGFloat)to closed:(BOOL)closed {
    CGFloat base = to - from;
    NSMutableArray *array = [NSMutableArray new];
    for (NSNumber *rate in [self valueRatesClosed:closed]) {
        CGFloat scale = from + base * rate.floatValue;
        CGAffineTransform transform2DValue = CGAffineTransformMakeScale(scale, scale);
        [array addObject:[NSValue valueWithCGAffineTransform:transform2DValue]];
    }
    return array;
}

#pragma mark <CAAnimationDelegate>

- (void)animationDidStart:(CAAnimation *)animation {
    
}

- (void)animationDidStop:(CAAnimation *)animation finished:(BOOL)flag {
    YGPulseKeyframeAnimationCompletionBlock completion = self.completion;
    if (completion) {
        completion(flag);
    }
}

@end
