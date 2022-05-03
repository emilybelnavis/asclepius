//
//  ContactPoint.swift
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
 Details of a Technology mediated contact point (phone, fax, email, etc.)
 */
open class ContactPoint: Element {
  /// Telecommunications form for contact point
  public var system: FHIRKitPrimitive<ContactPointSystem>?
  
  /// The actual contact point details
  public var value: FHIRKitPrimitive<FHIRKitString>?
  
  /// Identifies the purpose for the contact point
  public var use: FHIRKitPrimitive<ContactPointUse>?
  
  /// Specified preferred order of use (1 = highest)
  public var rank: FHIRKitPrimitive<FHIRKitPositiveInteger>?
  
  /// Time period when the contact point was/is in use
  public var period: Period?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    system: FHIRKitPrimitive<ContactPointSystem>? = nil,
    value: FHIRKitPrimitive<FHIRKitString>? = nil,
    use: FHIRKitPrimitive<ContactPointUse>? = nil,
    rank: FHIRKitPrimitive<FHIRKitPositiveInteger>? = nil,
    period: Period? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.id = id
    self.system = system
    self.value = value
    self.use = use
    self.rank = rank
    self.period = period
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case system; case _system
    case value; case _value
    case use; case _use
    case rank; case _rank
    case period
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.system = try FHIRKitPrimitive<ContactPointSystem>(from: codingKeyContainer, forKeyIfPresent: .system, auxKey: ._system)
    self.value = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .value, auxKey: ._value)
    self.use = try FHIRKitPrimitive<ContactPointUse>(from: codingKeyContainer, forKeyIfPresent: .use, auxKey: ._use)
    self.rank = try FHIRKitPrimitive<FHIRKitPositiveInteger>(from: codingKeyContainer, forKeyIfPresent: ._rank, auxKey: ._rank)
    self.period = try Period(from: codingKeyContainer, forKeyIfPresent: .period)
    
    try super.init(from: decoder)
  }
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try system?.encode(on: &codingKeyContainer, forKey: .system, auxKey: ._system)
    try value?.encode(on: &codingKeyContainer, forKey: .value, auxKey: ._value)
    try use?.encode(on: &codingKeyContainer, forKey: .use, auxKey: ._use)
    try rank?.encode(on: &codingKeyContainer, forKey: .rank, auxKey: ._rank)
    try period?.encode(on: &codingKeyContainer, forKey: .period)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ContactPoint else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return system == _other.system
    && value == _other.value
    && use == _other.use
    && rank == _other.rank
    && period == _other.period
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(system)
    hasher.combine(value)
    hasher.combine(use)
    hasher.combine(rank)
    hasher.combine(period)
  }
}
