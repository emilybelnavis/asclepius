//
//  Money.swift
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

/// An amount of economic utility in some recognized currency
open class Money: Element {
  /// numerical value (with implicit precision)
  public var value: FHIRKitPrimitive<FHIRKitDecimal>?
  
  /// ISO 4217 currency code
  public var currency: FHIRKitPrimitive<FHIRKitString>?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    value: FHIRKitPrimitive<FHIRKitDecimal>? = nil,
    currency: FHIRKitPrimitive<FHIRKitString>? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.id = id
    self.value = value
    self.currency = currency
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case value; case _value
    case currency; case _currency
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.value = try FHIRKitPrimitive<FHIRKitDecimal>(from: codingKeyContainer, forKeyIfPresent: .value, auxKey: ._value)
    self.currency = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .currency, auxKey: ._currency)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try value?.encode(on: &codingKeyContainer, forKey: .value, auxKey: ._value)
    try currency?.encode(on: &codingKeyContainer, forKey: .currency, auxKey: ._currency)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Money else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return value == _other.value
    && currency == _other.currency
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(value)
    hasher.combine(currency)
  }
}
