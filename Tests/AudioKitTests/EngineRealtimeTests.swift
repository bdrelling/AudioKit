// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/
import AudioKit
import AVFoundation
import XCTest

class EngineRealtimeTests: XCTestCase {

    func testBasicRealtime() throws {
        let engine = Engine()

        let osc = Oscillator()

        engine.output = osc
        try! engine.start()
        osc.start()

        sleep(1)
    }


    func testEffectRealtime() throws {

        let engine = Engine()

        let osc = Oscillator()
        let fx = Distortion(osc)

        engine.output = fx
        osc.start()

        try engine.start()

        sleep(1)
    }

    func testTwoEffectsRealtime() throws {

        let engine = Engine()

        let osc = Oscillator()
        let dist = Distortion(osc)
        let rev = Distortion(dist)

        engine.output = rev

        try engine.start()
        osc.start()

        sleep(1)
    }

    /// Test changing the output chain on the fly.
    func testDynamicChangeRealtime() throws {

        let engine = Engine()

        let osc = Oscillator()
        let dist = Distortion(osc)

        engine.output = osc
        try engine.start()

        sleep(1)

        engine.output = dist
        osc.start()

        sleep(1)
    }

    func testMixerRealtime() throws {

        let engine = Engine()

        let osc1 = Oscillator()
        let osc2 = Oscillator()
        osc2.frequency = 466.16 // dissonance, so we can really hear it

        let mix = Mixer([osc1, osc2])

        engine.output = mix

        try engine.start()
        osc1.start()
        osc2.start()

        sleep(1)
    }

    func testMixerDynamicRealtime() throws {

        let engine = Engine()

        let osc1 = Oscillator()
        let osc2 = Oscillator()
        osc2.frequency = 466.16 // dissonance, so we can really hear it

        let mix = Mixer([osc1])

        engine.output = mix
        osc1.start()
        osc2.start()

        try engine.start()

        sleep(1)

        mix.addInput(osc2)

        sleep(1)
    }

    func testMultipleChangesRealtime() throws {

        let engine = Engine()

        let osc1 = Oscillator()
        let osc2 = Oscillator()

        osc1.frequency = 880

        engine.output = osc1
        osc1.start()
        osc2.start()

        try engine.start()

        for i in 0..<10 {
            sleep(1)
            engine.output = (i % 2 == 1) ? osc1 : osc2
        }
    }

    func testSamplerRealtime() throws {
        let engine = Engine()
        let url = URL.testAudio
        let buffer = try! AVAudioPCMBuffer(url: url)!
        let sampler = Sampler()
        
        engine.output = sampler
        try engine.start()
        sampler.play()
        sleep(1)
        sampler.play(buffer)
        sleep(2)
    }

    func testManyOscillators() throws {
        let engine = Engine()

        let mixer = Mixer()

        for _ in 0..<100 {
            mixer.addInput(Oscillator())
        }

        mixer.volume = 0.001
        engine.output = mixer

        try engine.start()
        sleep(2)
    }

}
