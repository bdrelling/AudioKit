// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/

import AVFoundation

/// Node in an audio graph.
public protocol Node: AnyObject {
    /// Nodes providing audio input to this node.
    var connections: [Node] { get }

    /// Internal AVAudioEngine node.
    var avAudioNode: AVAudioNode { get }

    /// Start the node
    func start()

    /// Stop the node
    func stop()

    /// Bypass the node
    func bypass()

    /// Tells whether the node is processing (ie. started, playing, or active)
    var isStarted: Bool { get }

    /// Audio format to use when connecting this node.
    /// Defaults to `Settings.audioFormat`.
    var outputFormat: AVAudioFormat { get }

    /// The underlying audio unit for the new engine.
    var au: AUAudioUnit { get }
}
