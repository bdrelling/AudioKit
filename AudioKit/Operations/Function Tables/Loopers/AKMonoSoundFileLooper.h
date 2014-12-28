//
//  AKMonoSoundFileLooper.h
//  AudioKit
//
//  Auto-generated on 12/28/14.
//  Copyright (c) 2014 Aurelius Prochazka. All rights reserved.
//

#import "AKAudio.h"
#import "AKParameter+Operation.h"

/** Read sampled sound from a table using cubic interpolation.

 Read sampled sound (mono) from a table, with optional sustain and release looping, using cubic interpolation.
 */

@interface AKMonoSoundFileLooper : AKAudio
/// Instantiates the mono sound file looper with all values
/// @param soundFile The sound file function table. [Default Value: ]
/// @param frequencyRatio The frequency ratio. Updated at Control-rate. [Default Value: 1]
/// @param amplitude The amplitude of the output [Default Value: 1]
/// @param loopMode Can be no-looping, normal forward looping, or forward and backward looping. [Default Value: AKSoundFileLooperModeNormal]
- (instancetype)initWithSoundFile:(AKFunctionTable *)soundFile
                   frequencyRatio:(AKParameter *)frequencyRatio
                        amplitude:(AKParameter *)amplitude
                         loopMode:(AKSoundFileLooperMode)loopMode;

/// Instantiates the mono sound file looper with default values
/// @param soundFile The sound file function table.
- (instancetype)initWithSoundFile:(AKFunctionTable *)soundFile;

/// Instantiates the mono sound file looper with default values
/// @param soundFile The sound file function table.
+ (instancetype)audioWithSoundFile:(AKFunctionTable *)soundFile;

/// The frequency ratio. [Default Value: 1]
@property AKParameter *frequencyRatio;

/// Set an optional frequency ratio
/// @param frequencyRatio The frequency ratio. Updated at Control-rate. [Default Value: 1]
- (void)setOptionalFrequencyRatio:(AKParameter *)frequencyRatio;

/// The amplitude of the output [Default Value: 1]
@property AKParameter *amplitude;

/// Set an optional amplitude
/// @param amplitude The amplitude of the output [Default Value: 1]
- (void)setOptionalAmplitude:(AKParameter *)amplitude;

/// Can be no-looping, normal forward looping, or forward and backward looping. [Default Value: AKSoundFileLooperModeNormal]
@property AKSoundFileLooperMode loopMode;

/// Set an optional loop mode
/// @param loopMode Can be no-looping, normal forward looping, or forward and backward looping. [Default Value: AKSoundFileLooperModeNormal]
- (void)setOptionalLoopMode:(AKSoundFileLooperMode)loopMode;



@end
