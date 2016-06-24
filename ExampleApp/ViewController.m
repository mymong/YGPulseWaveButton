//
//  ViewController.m
//  YGPulseWaveButton
//
//  Created by Jason Yang on 16/6/24.
//  Copyright © 2016年 YG. All rights reserved.
//

#import "ViewController.h"
#import "YGPulseWaveButton.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet YGPulseWaveButton *testButton;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onPressTestButton:(id)sender {
}

- (IBAction)onPressStartButton:(id)sender {
    [self.testButton pulse:^(BOOL finished) {
        NSLog(@"pulse complete (%@", @(finished));
    }];
}

@end
