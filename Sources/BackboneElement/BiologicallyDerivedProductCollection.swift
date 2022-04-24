//
//  BiologicallyDerivedProductCollection.swift.swift
//  FHIRKIT
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

open class BiologicallyDerivedProductCollection: BackboneElement {
  public enum _Collected: Hashable {
    case dateTime(FHIRKitPrimitive<FHIRKitDateTime>)
    case period(Period)
  }
  
  /// individual performing the collection
  public var collector: Reference?
  
  /// who/where the product is from
  public var source: Reference?
  
  /// time the product was collected
  public var collected: _Collected?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    collector: Reference? = nil,
    source: Reference? = nil,
    collected: _Collected? = nil
  ) {
    self.init()
    self.`extension` = `extension`
    self.modifierExtension = modifierExtension
    self.id = id
    self.collector = collector
    self.source = source
    self.collected = collected
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case collector
    case source
    case collectedDateTime; case _collectedDateTime
    case collectedPeriod
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    var _collected: _Collected? = nil
    if let collectedDateTime = try FHIRKitPrimitive<FHIRKitDateTime>(from: _container, forKeyIfPresent: .collectedDateTime, auxiliaryKey: ._collectedDateTime) {
      if _collected != nil {
        throw DecodingError.dataCorruptedError(forKey: .collectedDateTime, in: _container, debugDescription: "More than one value provided for \"value\"")
      }
      _collected = .dateTime(collectedDateTime)
    }
    
    if let collectedPeriod = try Period(from: _container, forKeyIfPresent: .collectedPeriod) {
      if _collected != nil {
        throw DecodingError.dataCorruptedError(forKey: .collectedPeriod, in: _container, debugDescription: "More than one value provided for \"value\"")
      }
      _collected = .period(collectedPeriod)
    }
    
    self.collector = try Reference(from: _container, forKeyIfPresent: .collector)
    self.source = try Reference(from: _container, forKeyIfPresent: .source)
    self.collected = _collected
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    try collector?.encode(on: &_container, forKey: .collector)
    try source?.encode(on: &_container, forKey: .source)
    
    if let _enum = collected {
      switch _enum {
      case .dateTime(let _value):
        try _value.encode(on: &_container, forKey: .collectedDateTime, auxiliaryKey: ._collectedDateTime)
      case .period(let _value):
        try _value.encode(on: &_container, forKey: .collectedPeriod)
      }
    }
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? BiologicallyDerivedProductCollection else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return collector == _other.collector
    && source == _other.source
    && collected == _other.collected
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(collector)
    hasher.combine(source)
    hasher.combine(collected)
  }
}