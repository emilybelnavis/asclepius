//
//  Address.swift
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

open class Address: Element {
  public var use: FHIRKitPrimitive<AddressUse>?
  public var type: FHIRKitPrimitive<AddressType>?
  public var text: FHIRKitPrimitive<FHIRKitString>?
  public var line: [FHIRKitPrimitive<FHIRKitString>]?
  public var city: FHIRKitPrimitive<FHIRKitString>?
  public var district: FHIRKitPrimitive<FHIRKitString>?
  public var state: FHIRKitPrimitive<FHIRKitString>?
  public var postalCode: FHIRKitPrimitive<FHIRKitString>?
  public var country: FHIRKitPrimitive<FHIRKitString>?
  public var period: Period?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    city: FHIRKitPrimitive<FHIRKitString>? = nil,
    country: FHIRKitPrimitive<FHIRKitString>? = nil,
    district: FHIRKitPrimitive<FHIRKitString>? = nil,
    `extension`: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    line: [FHIRKitPrimitive<FHIRKitString>]? = nil,
    period: Period? = nil,
    postaCode: FHIRKitPrimitive<FHIRKitString>? = nil,
    state: FHIRKitPrimitive<FHIRKitString>? = nil,
    text: FHIRKitPrimitive<FHIRKitString>? = nil,
    type: FHIRKitPrimitive<AddressType>? = nil,
    use: FHIRKitPrimitive<AddressUse>? = nil
  ) {
    self.init()
    self.city = city
    self.country = country
    self.district = district
    self.`extension` = `extension`
    self.id = id
    self.line = line
    self.period = period
    self.postalCode = postalCode
    self.state = state
    self.text = text
    self.type = type
    self.use = use
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case city; case _city
    case country; case _country
    case district; case _district
    case line; case _line
    case period
    case postalCode; case _postalCode
    case state; case _state
    case text; case _text
    case type; case _type
    case use; case _use
  }
  
  /// intitializer for Decodable
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    self.city = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .city, auxiliaryKey: ._city)
    self.country = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .country, auxiliaryKey: ._country)
    self.district = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .district, auxiliaryKey: ._district)
    self.line = try [FHIRKitPrimitive<FHIRKitString>](from: _container, forKeyIfPresent: .line, auxiliaryKey: ._line)
    self.period = try Period(from: _container, forKeyIfPresent: .period)
    self.postalCode = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .postalCode, auxiliaryKey: ._postalCode)
    self.state = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .state, auxiliaryKey: ._state)
    self.text = try FHIRKitPrimitive<FHIRKitString>(from: _container, forKeyIfPresent: .text, auxiliaryKey: ._text)
    self.type = try FHIRKitPrimitive<AddressType>(from: _container, forKeyIfPresent: .type, auxiliaryKey: ._type)
    self.use = try FHIRKitPrimitive<AddressUse>(from: _container, forKeyIfPresent: .use, auxiliaryKey: ._use)
    
    try super.init(from: decoder)
  }
  
  /// encodable
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    try city?.encode(on: &_container, forKey: .city, auxiliaryKey: ._city)
    try country?.encode(on: &_container, forKey: .country, auxiliaryKey: ._country)
    try district?.encode(on: &_container, forKey: .district, auxiliaryKey: ._district)
    try line?.encode(on: &_container, forKey: .line, auxiliaryKey: ._line)
    try period?.encode(on: &_container, forKey: .period)
    try postalCode?.encode(on: &_container, forKey: .postalCode, auxiliaryKey: ._postalCode)
    try state?.encode(on: &_container, forKey: .state, auxiliaryKey: ._state)
    try text?.encode(on: &_container, forKey: .text, auxiliaryKey: ._text)
    try type?.encode(on: &_container, forKey: .type, auxiliaryKey: ._type)
    try use?.encode(on: &_container, forKey: .use, auxiliaryKey: ._use)
    
    try super.encode(to: encoder)
  }
  
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Address else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return city == _other.city
    && country == _other.country
    && district == _other.district
    && line == _other.line
    && period == _other.period
    && postalCode == _other.postalCode
    && state == _other.state
    && text == _other.text
    && type == _other.type
    && use == _other.use
  }
  
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(city)
    hasher.combine(country)
    hasher.combine(district)
    hasher.combine(line)
    hasher.combine(period)
    hasher.combine(postalCode)
    hasher.combine(state)
    hasher.combine(text)
    hasher.combine(type)
    hasher.combine(use)
  }
}
