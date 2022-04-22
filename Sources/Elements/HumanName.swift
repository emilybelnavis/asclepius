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
    `extension`: [Extension]? = nil,
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
    self.`extension` = `extension`
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
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.use = try FHIRKitPrimitive<NameUse>(from: _container, forKeyIfPresent: .use, auxiliaryKey: ._use)
    self.text = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .text, auxiliaryKey: ._text)
    self.family = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .family, auxiliaryKey: ._family)
    self.given = try [FHIRKitPrimitive<FHIRKitString>](from: _container, forKeyIfPresent: .given, auxiliaryKey: ._given)
    self.prefix = try [FHIRKitPrimitive<FHIRKitString>](from: _container, forKeyIfPresent: .prefix, auxiliaryKey: ._prefix)
    self.suffix = try [FHIRKitPrimitive<FHIRKitString>](from: _container, forKeyIfPresent: .suffix, auxiliaryKey: ._suffix)
    self.period = try Period(from: _container, forKeyIfPresent: .period)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    try use?.encode(on: &_container, forKey: .use, auxiliaryKey: ._use)
    try text?.encode(on: &_container, forKey: .text, auxiliaryKey: ._text)
    try family?.encode(on: &_container, forKey: .family, auxiliaryKey: ._family)
    try given?.encode(on: &_container, forKey: .given, auxiliaryKey: .given)
    try prefix?.encode(on: &_container, forKey: .prefix, auxiliaryKey: ._prefix)
    try suffix?.encode(on: &_container, forKey: .suffix, auxiliaryKey: ._suffix)
    try period?.encode(on: &_container, forKey: .period)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable & Hashable
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
