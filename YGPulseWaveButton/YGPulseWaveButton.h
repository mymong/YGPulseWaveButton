//
//  YGPulseWaveButton.h
//  Test01
//
//  Created by Jason Yang on 16/6/22.
//  Copyright © 2016年 YG. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface YGPulseWaveButton : UIButton
@property (nonatomic) IBInspectable UIColor *waveColor;
@property (nonatomic) IBInspectable CGFloat waveRadius;
@property (nonatomic) IBInspectable CGFloat waveDuration;
@property (nonatomic) IBInspectable CGFloat waveOpacityBegin;
@property (nonatomic) IBInspectable CGFloat waveOpacityEnd;
- (void)pulse:(void (^)(BOOL finished))completion;
@end
