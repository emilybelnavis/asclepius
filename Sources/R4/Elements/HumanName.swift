//
//  HumanName.swift
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

/// A human name with the ability to identify parts and usage
open class HumanName: Element {
  /// identifies the purpose for this name
  public var use: FHIRKitPrimitive<NameUse>?
  
  /// text representation of the full name
  public var text: FHIRKitPrimitive<FHIRKitString>?
  
  /// family name (often called 'surname' or 'last name'
  public var family: FHIRKitPrimitive<FHIRKitString>?
  
  /// given names (not always first), includes middle names
  public var given: [FHIRKitPrimitive<FHIRKitString>]?
  
  /// parts that come before the name
  public var prefix: [FHIRKitPrimitive<FHIRKitString>]?
  
  /// parts that come after the name
  public var suffix: [FHIRKitPrimitive<FHIRKitString>]?
  
  /// time period when name was/is in use
  public var period: Period?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    use: FHIRKitPrimitive<NameUse>? = nil,
    text: FHIRKitPrimitive<FHIRKitString>? = nil,
    family: FHIRKitPrimitive<FHIRKitString>? = nil,
    given: [FHIRKitPrimitive<FHIRKitString>]? = nil,
    prefix: [FHIRKitPrimitive<FHIRKitString>]? = nil,
    suffix: [FHIRKitPrimitive<FHIRKitString>]? = nil,
    period: Period? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.id = id
    self.use = use
    self.text = text
    self.family = family
    self.given = given
    self.prefix = prefix
    self.suffix = suffix
    self.period = period
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case use; case _use
    case text; case _text
    case family; case _family
    case given; case _given
    case prefix; case _prefix
    case suffix; case _suffix
    case period
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.use = try FHIRKitPrimitive<NameUse>(from: codingKeyContainer, forKeyIfPresent: .use, auxKey: ._use)
    self.text = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .text, auxKey: ._text)
    self.family = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .family, auxKey: ._family)
    self.given = try [FHIRKitPrimitive<FHIRKitString>](from: codingKeyContainer, forKeyIfPresent: .given, auxKey: ._given)
    self.prefix = try [FHIRKitPrimitive<FHIRKitString>](from: codingKeyContainer, forKeyIfPresent: .prefix, auxKey: ._prefix)
    self.suffix = try [FHIRKitPrimitive<FHIRKitString>](from: codingKeyContainer, forKeyIfPresent: .suffix, auxKey: ._suffix)
    self.period = try Period(from: codingKeyContainer, forKeyIfPresent: .period)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try use?.encode(on: &codingKeyContainer, forKey: .use, auxKey: ._use)
    try text?.encode(on: &codingKeyContainer, forKey: .text, auxKey: ._text)
    try family?.encode(on: &codingKeyContainer, forKey: .family, auxKey: ._family)
    try given?.encode(on: &codingKeyContainer, forKey: .given, auxKey: .given)
    try prefix?.encode(on: &codingKeyContainer, forKey: .prefix, auxKey: ._prefix)
    try suffix?.encode(on: &codingKeyContainer, forKey: .suffix, auxKey: ._suffix)
    try period?.encode(on: &codingKeyContainer, forKey: .period)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? HumanName else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return use == _other.use
    && text == _other.text
    && family == _other.family
    && given == _other.given
    && prefix == _other.prefix
    && suffix == _other.suffix
    && period == _other.period
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(use)
    hasher.combine(text)
    hasher.combine(given)
    hasher.combine(prefix)
    hasher.combine(suffix)
    hasher.combine(period)
  }
}
