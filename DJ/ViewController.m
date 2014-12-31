//
//  ViewController.m
//  DJ
//
//  Created by Jian Yao Ang on 12/31/14.
//  Copyright (c) 2014 Jian Yao Ang. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController () <AVAudioPlayerDelegate>
@property (strong, nonatomic) AVAudioPlayer *usherAudioPlayer;
@property (strong, nonatomic) AVAudioPlayer *ellieGouldingAudioPlayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
}

- (IBAction)onPlayBurnButtonPressed:(id)sender
{
    NSString *usherBurn = [[NSBundle mainBundle] pathForResource:@"Usher" ofType:@"mp3"];
    NSError *usherBurnAudioError = nil;
    
    self.usherAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:usherBurn] error:&usherBurnAudioError];
    
    if (self.usherAudioPlayer == nil) {
        NSLog(@"self.player has error with UsherBurn %@", usherBurnAudioError);
    }
    else
    {
        [self.usherAudioPlayer setDelegate:self];
        [self.usherAudioPlayer setVolume:0.75];
        [self.usherAudioPlayer play];
    }
    
    NSString *ellieGouldingBurn = [[NSBundle mainBundle] pathForResource:@"EllieGoulding" ofType:@"mp3"];
    NSError *ellieGouldingBurnError;
    
    self.ellieGouldingAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:ellieGouldingBurn] error:&ellieGouldingBurnError];
    
    if (self.ellieGouldingAudioPlayer == nil)
    {
        NSLog(@"ellieGouldingError : %@", ellieGouldingBurnError);
    }
    else
    {
        [self.ellieGouldingAudioPlayer setDelegate:self];
        [self.ellieGouldingAudioPlayer setVolume:0.25];
        [self.ellieGouldingAudioPlayer play];
    }
}


@end
