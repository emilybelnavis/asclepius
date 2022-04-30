//
//  Identifier.swift
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
 An identifier intended for computation
 
 An identifier - identifies some entity uniquely and unambiguously. Typically used for business identifiers
 */
open class Identifier: Element {
  /// The purpose of this identifier
  public var use: FHIRKitPrimitive<IdentifierUse>?
  
  /// Description of identifier
  public var type: CodableConcept?
  
  /// The namespace for the identifier value
  public var system: FHIRKitPrimitive<FHIRKitURI>?
  
  /// The value that is unique
  public var value: FHIRKitPrimitive<FHIRKitString>?
  
  /// Time period when is/was valid for use
  public var period: Period?
  
  /// Organization that issued id (may be just text)
  public var assigner: Reference?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    use: FHIRKitPrimitive<IdentifierUse>? = nil,
    type: CodableConcept? = nil,
    system: FHIRKitPrimitive<FHIRKitURI>? = nil,
    value: FHIRKitPrimitive<FHIRKitString>? = nil,
    period: Period? = nil,
    assigner: Reference? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.id = id
    self.use = use
    self.type = type
    self.system = system
    self.value = value
    self.period = period
    self.assigner = assigner
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case use; case _use
    case type
    case system; case _system
    case value; case _value
    case period
    case assigner
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.use = try FHIRKitPrimitive<IdentifierUse>(from: codingKeyContainer, forKeyIfPresent: .use, auxKey: ._use)
    self.type = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .type)
    self.system = try FHIRKitPrimitive<FHIRKitURI>(from: codingKeyContainer, forKeyIfPresent: .system, auxKey: ._system)
    self.value = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .value, auxKey: ._value)
    self.period = try Period(from: codingKeyContainer, forKeyIfPresent: .period)
    self.assigner = try Reference(from: codingKeyContainer, forKeyIfPresent: .assigner)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try use?.encode(on: &codingKeyContainer, forKey: .use, auxKey: ._use)
    try type?.encode(on: &codingKeyContainer, forKey: .type)
    try system?.encode(on: &codingKeyContainer, forKey: .system, auxKey: ._system)
    try value?.encode(on: &codingKeyContainer, forKey: .value, auxKey: ._value)
    try period?.encode(on: &codingKeyContainer, forKey: .period)
    try assigner?.encode(on: &codingKeyContainer, forKey: .assigner)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Identifier else {
      return false
    }
    
    guard _other.isEqual(to: _other) else {
      return false
    }
    
    return use == _other.use
    && type == _other.type
    && system == _other.system
    && value == _other.value
    && period == _other.period
    && assigner == _other.assigner
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(use)
    hasher.combine(type)
    hasher.combine(value)
    hasher.combine(period)
    hasher.combine(assigner)
  }
}
