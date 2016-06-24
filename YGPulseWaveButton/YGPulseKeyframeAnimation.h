//
//  YGPulseKeyframeAnimation.h
//  Test01
//
//  Created by Jason Yang on 16/6/24.
//  Copyright © 2016年 YG. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^YGPulseKeyframeAnimationCompletionBlock)(BOOL finished);

@interface YGPulseKeyframeAnimation : CAKeyframeAnimation
+ (instancetype)animationWithCGFloatValueForKeyPath:(NSString *)path from:(CGFloat)from to:(CGFloat)to duration:(CGFloat)duration closed:(BOOL)closed completion:(YGPulseKeyframeAnimationCompletionBlock)completion;
+ (instancetype)animationWithCGPointValueForKeyPath:(NSString *)path from:(CGPoint)from to:(CGPoint)to duration:(CGFloat)duration closed:(BOOL)closed completion:(YGPulseKeyframeAnimationCompletionBlock)completion;
+ (instancetype)animationWithCGSizeValueForKeyPath:(NSString *)path from:(CGSize)from to:(CGSize)to duration:(CGFloat)duration closed:(BOOL)closed completion:(YGPulseKeyframeAnimationCompletionBlock)completion;
+ (instancetype)animationWithCGRectValueForKeyPath:(NSString *)path from:(CGRect)from to:(CGRect)to duration:(CGFloat)duration closed:(BOOL)closed completion:(YGPulseKeyframeAnimationCompletionBlock)completion;
+ (instancetype)animationWithCATransform3DScaleForKeyPath:(NSString *)path from:(CGFloat)from to:(CGFloat)to duration:(CGFloat)duration closed:(BOOL)closed completion:(YGPulseKeyframeAnimationCompletionBlock)completion;
+ (instancetype)animationWithCGAffineTransformScaleForKeyPath:(NSString *)path from:(CGFloat)from to:(CGFloat)to duration:(CGFloat)duration closed:(BOOL)closed completion:(YGPulseKeyframeAnimationCompletionBlock)completion;
@end
