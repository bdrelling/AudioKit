// Copyright AudioKit. All Rights Reserved. Revision History at http://github.com/AudioKit/AudioKit/
// This file was auto-autogenerated by scripts and templates at http://github.com/AudioKit/AudioKitDevTools/

import AVFoundation
import Utilities

/// AudioKit version of Apple's Expander Audio Unit
///
public class Expander: Node {
    fileprivate let effectAU: AVAudioUnit

    let input: Node

    /// Connected nodes
    public var connections: [Node] { [input] }

    /// Underlying AVAudioNode
    public var avAudioNode: AVAudioNode { effectAU }

    /// Specification details for expansionRatio
    public static let expansionRatioDef = NodeParameterDef(
        identifier: "expansionRatio",
        name: "Expansion Ratio",
        address: AUParameterAddress(kDynamicsProcessorParam_ExpansionRatio),
        defaultValue: 2,
        range: 1 ... 50.0,
        unit: .rate
    )

    /// Expansion Ratio (rate) ranges from 1 to 50.0 (Default: 2)
    @Parameter(expansionRatioDef) public var expansionRatio: AUValue

    /// Specification details for expansionThreshold
    public static let expansionThresholdDef = NodeParameterDef(
        identifier: "expansionThreshold",
        name: "Expansion Threshold",
        address: AUParameterAddress(kDynamicsProcessorParam_ExpansionThreshold),
        defaultValue: 2,
        range: 1 ... 50.0,
        unit: .rate
    )

    /// Expansion Threshold (rate) ranges from 1 to 50.0 (Default: 2)
    @Parameter(expansionThresholdDef) public var expansionThreshold: AUValue

    /// Specification details for attackTime
    public static let attackTimeDef = NodeParameterDef(
        identifier: "attackTime",
        name: "Attack Time",
        address: AUParameterAddress(kDynamicsProcessorParam_AttackTime),
        defaultValue: 0.001,
        range: 0.0001 ... 0.2,
        unit: .seconds
    )

    /// Attack Time (seconds) ranges from 0.0001 to 0.2 (Default: 0.001)
    @Parameter(attackTimeDef) public var attackTime: AUValue

    /// Specification details for releaseTime
    public static let releaseTimeDef = NodeParameterDef(
        identifier: "releaseTime",
        name: "Release Time",
        address: AUParameterAddress(kDynamicsProcessorParam_ReleaseTime),
        defaultValue: 0.05,
        range: 0.01 ... 3,
        unit: .seconds
    )

    /// Release Time (seconds) ranges from 0.01 to 3 (Default: 0.05)
    @Parameter(releaseTimeDef) public var releaseTime: AUValue

    /// Specification details for masterGain
    public static let masterGainDef = NodeParameterDef(
        identifier: "masterGain",
        name: "Master Gain",
        address: AUParameterAddress(6),
        defaultValue: 0,
        range: -40 ... 40,
        unit: .decibels
    )

    /// Master Gain (decibels) ranges from -40 to 40 (Default: 0)
    @Parameter(masterGainDef) public var masterGain: AUValue

    /// Compression Amount (dB) read only
    public var compressionAmount: AUValue {
        return effectAU.auAudioUnit.parameterTree?.allParameters[7].value ?? 0
    }

    /// Input Amplitude (dB) read only
    public var inputAmplitude: AUValue {
        return effectAU.auAudioUnit.parameterTree?.allParameters[8].value ?? 0
    }

    /// Output Amplitude (dB) read only
    public var outputAmplitude: AUValue {
        return effectAU.auAudioUnit.parameterTree?.allParameters[9].value ?? 0
    }

    /// Initialize the expander node
    ///
    /// - parameter input: Input node to process
    /// - parameter expansionRatio: Expansion Ratio (rate) ranges from 1 to 50.0 (Default: 2)
    /// - parameter expansionThreshold: Expansion Threshold (rate) ranges from 1 to 50.0 (Default: 2)
    /// - parameter attackTime: Attack Time (seconds) ranges from 0.0001 to 0.2 (Default: 0.001)
    /// - parameter releaseTime: Release Time (seconds) ranges from 0.01 to 3 (Default: 0.05)
    /// - parameter masterGain: Master Gain (decibels) ranges from -40 to 40 (Default: 0)
    ///
    public init(
        _ input: Node,
        expansionRatio: AUValue = expansionRatioDef.defaultValue,
        expansionThreshold: AUValue = expansionThresholdDef.defaultValue,
        attackTime: AUValue = attackTimeDef.defaultValue,
        releaseTime: AUValue = releaseTimeDef.defaultValue,
        masterGain: AUValue = masterGainDef.defaultValue
    ) {
        self.input = input

        let desc = AudioComponentDescription(appleEffect: kAudioUnitSubType_DynamicsProcessor)
        effectAU = instantiate(componentDescription: desc)
        associateParams(with: effectAU.auAudioUnit)

        self.expansionRatio = expansionRatio
        self.expansionThreshold = expansionThreshold
        self.attackTime = attackTime
        self.releaseTime = releaseTime
        self.masterGain = masterGain
    }
}
