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
  public enum CollectedX: Hashable {
    case dateTime(FHIRKitPrimitive<FHIRKitDateTime>)
    case period(Period)
  }
  
  /// individual performing the collection
  public var collector: Reference?
  
  /// who/where the product is from
  public var source: Reference?
  
  /// time the product was collected
  public var collectedX: CollectedX?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    collector: Reference? = nil,
    source: Reference? = nil,
    collectedX: CollectedX? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.collector = collector
    self.source = source
    self.collectedX = collectedX
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case collector
    case source
    case collectedXDateTime; case _collectedXDateTime
    case collectedXPeriod
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    var tempCollectedX: CollectedX? = nil
    if let collectedDateTime = try FHIRKitPrimitive<FHIRKitDateTime>(from: codingKeyContainer, forKeyIfPresent: .collectedXDateTime, auxKey: ._collectedXDateTime) {
      if tempCollectedX != nil {
        throw DecodingError.dataCorruptedError(forKey: .collectedXDateTime, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempCollectedX = .dateTime(collectedDateTime)
    }
    
    if let collectedPeriod = try Period(from: codingKeyContainer, forKeyIfPresent: .collectedXPeriod) {
      if tempCollectedX != nil {
        throw DecodingError.dataCorruptedError(forKey: .collectedXPeriod, in: codingKeyContainer, debugDescription: "More than one value provided for \"value\"")
      }
      tempCollectedX = .period(collectedPeriod)
    }
    
    self.collector = try Reference(from: codingKeyContainer, forKeyIfPresent: .collector)
    self.source = try Reference(from: codingKeyContainer, forKeyIfPresent: .source)
    self.collectedX = tempCollectedX
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    try collector?.encode(on: &codingKeyContainer, forKey: .collector)
    try source?.encode(on: &codingKeyContainer, forKey: .source)
    
    if let enumCollectedX = collectedX {
      switch enumCollectedX {
      case .dateTime(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .collectedXDateTime, auxKey: ._collectedXDateTime)
      case .period(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .collectedXPeriod)
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
    && collectedX == _other.collectedX
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(collector)
    hasher.combine(source)
    hasher.combine(collectedX)
  }
}
