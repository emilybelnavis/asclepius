//
//  Timing.swift
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
 A timing schedule that specifies an event that may occur multiple times.
 
 Specifies an event that may occur multiple times. Timing schedules are used to record when things are
 planned, expected, or requested to occur. The most common usage is in dosage instructions for
 medications. They are also used when planning care of various kinds, and may be used for reporting the
 schedule to which past regular activities were carried out.
 */
open class Timing: BackboneElement {
  /// When the event occurs
  public var event: [FHIRKitPrimitive<FHIRKitDateTime>]?
  
  /// When the event is to occur
  public var `repeat`: TimingRepeat?
  
  /// BID | TID | QID | AM | PM | QD | QOD | +
  public var code: CodableConcept?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    event: [FHIRKitPrimitive<FHIRKitDateTime>]? = nil,
    `repeat`: TimingRepeat? = nil,
    code: CodableConcept? = nil,
    modifierExtension: [Extension]? = nil
  ) {
    self.init()
    self.`extension` = `extension`
    self.id = id
    self.event = event
    self.`repeat` = `repeat`
    self.code = code
    self.modifierExtension = modifierExtension
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case event; case _event
    case `repeat` = "repeat" // swiftlint:disable:this redundant_string_enum_value
    case code
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.event = try [FHIRKitPrimitive<FHIRKitDateTime>](from: _container, forKeyIfPresent: .event, auxiliaryKey: ._event)
    self.`repeat` = try TimingRepeat(from: _container, forKeyIfPresent: .`repeat`)
    self.code = try CodableConcept(from: _container, forKeyIfPresent: .code)
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    try event?.encode(on: &_container, forKey: .event, auxiliaryKey: ._event)
    try `repeat`?.encode(on: &_container, forKey: .`repeat`)
    try code?.encode(on: &_container, forKey: .code)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable & Hashable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Timing else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return event == _other.event
    && `repeat` == _other.`repeat`
    && code == _other.code
  }
  
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(event)
    hasher.combine(`repeat`)
    hasher.combine(code)
  }
}
