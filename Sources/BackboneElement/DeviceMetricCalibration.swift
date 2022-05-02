//
//  DeviceMetricCalibration.swift
//  FHIRKit
//
//  Copyright (c) 2022 Bitmatic Ltd.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

/**
 Describes the calibrations that have been performed or that are required to be performed.
 */
open class DeviceMetricCalibration: BackboneElement {
  /// Describes the type of the calibrationm ethod
  public var type: FHIRKitPrimitive<DeviceMetricCalibrationType>?
  
  /// Describes the state of the calibration
  public var state: FHIRKitPrimitive<DeviceMetricCalibrationState>?
  
  /// Describes the time last calibration has been performed
  public var time: FHIRKitPrimitive<FHIRKitInstant>?
  
  public override init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    type: FHIRKitPrimitive<DeviceMetricCalibrationType>? = nil,
    state: FHIRKitPrimitive<DeviceMetricCalibrationState>? = nil,
    time: FHIRKitPrimitive<FHIRKitInstant>? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.type = type
    self.state = state
    self.time = time
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case type; case _type
    case state; case _state
    case time; case _time
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.type = try FHIRKitPrimitive<DeviceMetricCalibrationType>(from: codingKeyContainer, forKeyIfPresent: .type, auxKey: ._type)
    self.state = try FHIRKitPrimitive<DeviceMetricCalibrationState>(from: codingKeyContainer, forKeyIfPresent: .state, auxKey: ._state)
    self.time = try FHIRKitPrimitive<FHIRKitInstant>(from: codingKeyContainer, forKeyIfPresent: .time, auxKey: ._time)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try type?.encode(on: &codingKeyContainer, forKey: .type, auxKey: ._type)
    try state?.encode(on: &codingKeyContainer, forKey: .state, auxKey: ._state)
    try time?.encode(on: &codingKeyContainer, forKey: .time, auxKey: ._time)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? DeviceMetricCalibration else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return type == _other.type
    && state == _other.state
    && time == _other.time
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(type)
    hasher.combine(state)
    hasher.combine(time)
  }
}
