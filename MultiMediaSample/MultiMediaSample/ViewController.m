//
//  ViewController.m
//  MultiMediaSample
//
//  Created by Wei Fang on 3/20/14.
//  Copyright (c) 2014 willor_fang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // set up the movie palyer
    NSString *movieFile = [[NSBundle mainBundle] pathForResource:@"sample" ofType:@"m4v"];
    self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:
                        [NSURL fileURLWithPath:movieFile]];
    self.moviePlayer.allowsAirPlay = YES;
    [self.moviePlayer.view setFrame:CGRectMake(145.0, 20.0, 155.0, 100.0)];
    
    // set up the music player
    self.musicPlayer = [MPMusicPlayerController iPodMusicPlayer];

    // set up the audio recorder
    NSURL *soundFileURL = [NSURL fileURLWithPath:
                           [NSTemporaryDirectory() stringByAppendingString:@"sound.caf"]];
    NSDictionary *soundSetting = [NSDictionary dictionaryWithObjectsAndKeys:
        [NSNumber numberWithFloat:44100.0], AVSampleRateKey,
        [NSNumber numberWithInt:kAudioFormatMPEG4AAC], AVFormatIDKey,
        [NSNumber numberWithInt:2], AVNumberOfChannelsKey,
        [NSNumber numberWithInt:AVAudioQualityHigh],AVEncoderAudioQualityKey,
        nil];
    
    self.audioRecorder = [[AVAudioRecorder alloc]
                          initWithURL:soundFileURL
                          settings:soundSetting
                          error:nil];
    
    // set up the audio player
    NSURL *noSoundFileURL = [NSURL fileURLWithPath:
                             [[NSBundle mainBundle] pathForResource:@"sample" ofType:@"wav"]];
    self.audioPlayer = [[AVAudioPlayer alloc]
                        initWithContentsOfURL:noSoundFileURL error:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playMovie:(id)sender {
    [self.view addSubview:self.moviePlayer.view];
    [[NSNotificationCenter defaultCenter]
        addObserver:self
        selector:@selector(playMovieFinished:)
        name:MPMoviePlayerPlaybackDidFinishNotification
        object:self.moviePlayer];
    
    if ([self.toggleFullScreen isOn]) {
        [self.moviePlayer setFullscreen:YES animated:YES];
    }
    
    [self.moviePlayer play];
}

- (void)playMovieFinished:(NSNotification*)theNotification {
    [[NSNotificationCenter defaultCenter]
        removeObserver:self
        name:MPMoviePlayerPlaybackDidFinishNotification
        object:self.moviePlayer];
    
    [self.moviePlayer.view removeFromSuperview];
}


- (IBAction)recordAudio:(id)sender {
    if ([self.recordButton.titleLabel.text isEqualToString:@"Record Audio"]) {
        [self.audioRecorder record];
        [self.recordButton setTitle:@"Stop Recording" forState:UIControlStateNormal];
    } else {
        [self.audioRecorder stop];
        [self.recordButton setTitle:@"Record Audio" forState:UIControlStateNormal];
        // load the record sound
        NSURL *soundFileURL = [NSURL fileURLWithPath:
                                [NSTemporaryDirectory() stringByAppendingString:@"sound.caf"]];
        self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
    }
}

- (IBAction)playAudio:(id)sender {
    [self.audioPlayer play];
}

- (IBAction)chooseImage:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    if ([self.toggleCamera isOn]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        //TODO check camera here
    } else {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    imagePicker.delegate = self;
    imagePicker.allowsEditing = NO;
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [self dismissMoviePlayerViewControllerAnimated];
    self.displayImageView.image = [info objectForKey:UIImagePickerControllerOriginalImage];
}

- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)applyFilter:(id)sender {
    CIImage *imageToFileter = [[CIImage alloc] initWithImage:self.displayImageView.image];
    
    CIFilter* activeFilter = [CIFilter filterWithName:@"CISepiaTone"];
    [activeFilter setDefaults];
    [activeFilter setValue:[NSNumber numberWithFloat:0.75] forKey:@"inputIntensity"];
    [activeFilter setValue:imageToFileter forKey:@"inputImage"];
    CIImage *filteredImage = [activeFilter valueForKey:@"outputImage"];
    
    UIImage *newImage = [UIImage imageWithCIImage:filteredImage];
    self.displayImageView.image = newImage;
}

- (IBAction)chooseMusic:(id)sender {
    MPMediaPickerController *musicPicker;
    
    [self.musicPlayer stop];
    self.displayPlayingMusic.text=@"No Song Playing";
    [self.musicPlayButton setTitle:@"Play Music" forState:UIControlStateNormal];
    
    musicPicker = [[MPMediaPickerController alloc] initWithMediaTypes:MPMediaTypeMusic];
    
    musicPicker.prompt = @"Choose Songs to Play";
    musicPicker.allowsPickingMultipleItems=YES;
    musicPicker.delegate=self;
    
    [self presentViewController:musicPicker animated:YES completion:nil];
}

- (void)mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection {
    [self.musicPlayer setQueueWithItemCollection:mediaItemCollection];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)playMusic:(id)sender {
    if ([self.musicPlayButton.titleLabel.text isEqualToString:@"Play Music"]) {
        [self.musicPlayer play];
        [self.musicPlayButton setTitle:@"Pause Music" forState:UIControlStateNormal];
        self.displayPlayingMusic.text = [self.musicPlayer.nowPlayingItem
                                         valueForKey:MPMediaItemPropertyTitle];
    } else {
        [self.musicPlayer pause];
        [self.musicPlayButton setTitle:@"Play Music" forState:UIControlStateNormal];
        self.displayPlayingMusic.text = @"No Song Playing";
    }
}
@end
