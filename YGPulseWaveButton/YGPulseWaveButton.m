//
//  PulseWaveButton.m
//  Stashimi
//
//  Created by Jason Yang on 16/6/22.
//  Copyright © 2016 Stashimi Inc. All rights reserved.
//

#import "YGPulseWaveButton.h"
#import "YGPulseKeyframeAnimation.h"

@interface YGPulseWaveButton ()
@property (nonatomic) CALayer *wave;
@end

@implementation YGPulseWaveButton

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.wave) {
        [self stopAnimation];
    }
    else {
        self.wave = [CALayer layer];
        self.wave.opacity = 0;
        [self.layer insertSublayer:self.wave atIndex:0];
    }
    
    CGRect frame = self.bounds;
    frame = CGRectMake(frame.size.width / 2 - 1, frame.size.height / 2 - 1, 2, 2);
    self.wave.frame = frame;
    self.wave.cornerRadius = frame.size.width / 2;
    self.wave.backgroundColor = self.waveColor.CGColor;
}

- (void)pulse:(void (^)(BOOL))completion {
    [self stopAnimation];
    
    if (!self.superview) {
        return;
    }
    
    [self startAnimation:completion];
}

- (void)startAnimation:(void (^)(BOOL))completion {
    [CATransaction begin];
    [self.wave addAnimation:[YGPulseKeyframeAnimation animationWithCATransform3DScaleForKeyPath:@"transform" from:0 to:self.waveRadius duration:self.waveDuration closed:NO completion:completion] forKey:@"scaleAnimation"];
    [self.wave addAnimation:[YGPulseKeyframeAnimation animationWithCGFloatValueForKeyPath:@"opacity" from:self.waveOpacityBegin to:self.waveOpacityEnd duration:self.waveDuration closed:NO completion:nil] forKey:@"opacityAnimation"];
    [CATransaction commit];
}

- (void)stopAnimation {
    [self.wave removeAllAnimations];
}

@end
