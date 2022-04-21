//
//  Quantity.swift
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
 A measured or measurable amount
 
 A measured amount (or an amount that can potentially be measured). Note that measured amounts include
 amounts that are not preciely quantified, including amounts involving arbitrary units and floating currencies
 */
open class Quantity: Element {
  /// Numerical value (with implicit precision)
  public var value: FHIRKitPrimitive<FHIRKitDecimal>?
  
  /// How the value should be understood and represented - whether the actual value is greater/less than
  /// the stated value due to measurement issues; e.g. if the comparator is `<` , the the real value is `<`
  /// stated value
  public var comparator: FHIRKitPrimitive<QuantityComparator>?
  
  /// Unit representation
  public var unit: FHIRKitPrimitive<FHIRKitString>?
  
  /// System that defines coded unit form
  public var system: FHIRKitPrimitive<FHIRKitURI>?
  
  /// Coded form of the unit
  public var code: FHIRKitPrimitive<FHIRKitString>?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    value: FHIRKitPrimitive<FHIRKitDecimal>? = nil,
    comparator: FHIRKitPrimitive<QuantityComparator>? = nil,
    unit: FHIRKitPrimitive<FHIRKitString>? = nil,
    system: FHIRKitPrimitive<FHIRKitURI>? = nil,
    code: FHIRKitPrimitive<FHIRKitString>? = nil
  ) {
    self.init()
    self.`extension` = `extension`
    self.id = id
    self.value = value
    self.comparator = comparator
    self.unit = unit
    self.system = system
    self.code = code
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case value; case _value
    case comparator; case _comparator
    case unit; case _unit
    case system; case _system
    case code; case _code
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.value = try FHIRKitPrimitive<FHIRKitDecimal>(from: _container, forKeyIfPresent: .value, auxiliaryKey: ._value)
    self.comparator = try FHIRKitPrimitive<QuantityComparator>(from: _container, forKeyIfPresent: .comparator, auxiliaryKey: ._comparator)
    self.unit = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .unit, auxiliaryKey: ._unit)
    self.system = try FHIRKitPrimitive<FHIRKitURI>(from: _container, forKeyIfPresent: .system, auxiliaryKey: ._system)
    self.code = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .code, auxiliaryKey: ._code)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    try value?.encode(on: &_container, forKey: .value, auxiliaryKey: ._value)
    try comparator?.encode(on: &_container, forKey: .comparator, auxiliaryKey: ._comparator)
    try unit?.encode(on: &_container, forKey: .unit, auxiliaryKey: ._unit)
    try system?.encode(on: &_container, forKey: .system, auxiliaryKey: ._system)
    try code?.encode(on: &_container, forKey: .code, auxiliaryKey: ._code)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable & Hashable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Quantity else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return value == _other.value
    && comparator == _other.comparator
    && unit == _other.unit
    && system == _other.system
    && code == _other.code
  }
  
  public override func hash(into hasher: inout Hasher) {
    super hash(into: &hasher)
    hasher.combine(value)
    hasher.combine(comparator)
    hasher.combine(unit)
    hasher.combine(system)
    hasher.combine(code)
  }
}
