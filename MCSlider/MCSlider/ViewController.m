//
//  ViewController.m
//  MCSlider
//
//  Created by M_Code on 2017/10/10.
//  Copyright © 2017年 M_Code. All rights reserved.
//

#import "ViewController.h"
#import "MCSliderView.h"
@interface ViewController () <MCSliderViewDelegate>
@property (weak, nonatomic) IBOutlet MCSliderView *sliderView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.sliderView.middleTrackTintColor = [UIColor greenColor];
    self.sliderView.minimumTrackTintColor = [UIColor redColor];
    self.sliderView.maximumTrackTintColor = [UIColor blackColor];
    [self.sliderView setThumbImage:[UIImage imageNamed:@"sliderThumbImage"] forState:UIControlStateNormal];
    self.sliderView.delegate = self;
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(setSliderValue:) userInfo:nil repeats:YES];
}
- (void)setSliderValue:(NSTimer *)timer
{
    if (self.sliderView.value >= 1) {
        self.sliderView.middleValue =0;
        self.sliderView.value = 0;
    }
    self.sliderView.value += 0.01;
    self.sliderView.middleValue = (self.sliderView.value + 0.1)/self.sliderView.maxValue;
}
- (void)sliderTouchBegan:(MCSlider * )slider
{
    NSLog(@"sliderTouchBegan");
    
}
- (void)sliderTouchDone:(MCSlider * )slider
{
    NSLog(@"sliderTouchDone");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
