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

/**
 An address expressed using postal conventions (as opposed to GPS or other location definition formats). This
 data type may be used to convey addresses for use in delivering mail as well as for visiting locations which
 might not be valid for mail delivery. There are a variety of postal address formats defined aound the world.
 
 - Version: FHIR v4.0.1
 - SeeAlso: Definition: https://hl7.org/fhir/datatypes.html#Address
 - SeeAlso: ValueSet: https://hl7.org/fhir/R4/valueset-address-use.html
 */
open class Address: Element {
  /// Purpose of this address ( home | work | temp | old | billing )
  public var use: FHIRKitPrimitive<AddressUse>?
  /// Type of address ( postal | physical | both)
  public var type: FHIRKitPrimitive<AddressType>?
  
  /// Text representatoin of the address
  public var text: FHIRKitPrimitive<FHIRKitString>?
  
  /// Street name, number, direction & P.O Box etc.
  /// This repeating element order: The order in which the lines should appear in an address
  /// label
  public var line: [FHIRKitPrimitive<FHIRKitString>]?
  
  /// Name of city, town, etc...
  public var city: FHIRKitPrimitive<FHIRKitString>?
  
  /// Name of district/county
  public var district: FHIRKitPrimitive<FHIRKitString>?
  
  /// Sub-unit of country (abbreviations can be used here)
  public var state: FHIRKitPrimitive<FHIRKitString>?
  
  /// Postal code for address
  public var postalCode: FHIRKitPrimitive<FHIRKitString>?
  
  /// Country code using either ISO:3166 2 or 3 letter country code
  public var country: FHIRKitPrimitive<FHIRKitString>?
  
  /// Time period when address was/is in use
  public var period: Period?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    use: FHIRKitPrimitive<AddressUse>? = nil,
    type: FHIRKitPrimitive<AddressType>? = nil,
    line: [FHIRKitPrimitive<FHIRKitString>]? = nil,
    city: FHIRKitPrimitive<FHIRKitString>? = nil,
    district: FHIRKitPrimitive<FHIRKitString>? = nil,
    state: FHIRKitPrimitive<FHIRKitString>? = nil,
    postalCode: FHIRKitPrimitive<FHIRKitString>? = nil,
    country: FHIRKitPrimitive<FHIRKitString>? = nil,
    period: Period? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.id = id
    self.use = use
    self.type = type
    self.text = text
    self.line = line
    self.city = city
    self.district = district
    self.state = state
    self.postalCode = postalCode
    self.country = country
    self.period = period
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case use; case _use
    case type; case _type
    case text; case _text
    case line; case _line
    case city; case _city
    case district; case _district
    case state; case _state
    case postalCode; case _postalCode
    case country; case _country
    case period
  }
  
  /// intitializer for Decodable
  public required init(from decoder: Decoder) throws {
    let codingContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.use = try FHIRKitPrimitive<AddressUse>(from: codingContainer, forKeyIfPresent: .use, auxiliaryKey: ._use)
    self.type = try FHIRKitPrimitive<AddressType>(from: codingContainer, forKeyIfPresent: .type, auxiliaryKey: ._type)
    self.text = try FHIRKitPrimitive<FHIRKitString>(from: codingContainer, forKeyIfPresent: .text, auxiliaryKey: ._text)
    self.line = try [FHIRKitPrimitive<FHIRKitString>](from: codingContainer, forKeyIfPresent: .line, auxiliaryKey: ._line)
    self.city = try FHIRKitPrimitive<FHIRKitString>(from: codingContainer, forKeyIfPresent: .city, auxiliaryKey: ._city)
    self.district = try FHIRKitPrimitive<FHIRKitString>(from: codingContainer, forKeyIfPresent: .district, auxiliaryKey: ._district)
    self.state = try FHIRKitPrimitive<FHIRKitString>(from: codingContainer, forKeyIfPresent: .state, auxiliaryKey: ._state)
    self.postalCode = try FHIRKitPrimitive<FHIRKitString>(from: codingContainer, forKeyIfPresent: .postalCode, auxiliaryKey: ._postalCode)
    self.country = try FHIRKitPrimitive<FHIRKitString>(from: codingContainer, forKeyIfPresent: .country, auxiliaryKey: ._country)
    self.period = try Period(from: codingContainer, forKeyIfPresent: .period)
    
    try super.init(from: decoder)
  }
  
  /// encodable
  public override func encode(to encoder: Encoder) throws {
    var codingContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try use?.encode(on: &codingContainer, forKey: .use, auxiliaryKey: ._use)
    try type?.encode(on: &codingContainer, forKey: .type, auxiliaryKey: ._type)
    try text?.encode(on: &codingContainer, forKey: .text, auxiliaryKey: ._text)
    try line?.encode(on: &codingContainer, forKey: .line, auxiliaryKey: ._line)
    try city?.encode(on: &codingContainer, forKey: .city, auxiliaryKey: ._city)
    try district?.encode(on: &codingContainer, forKey: .district, auxiliaryKey: ._district)
    try state?.encode(on: &codingContainer, forKey: .state, auxiliaryKey: ._state)
    try postalCode?.encode(on: &codingContainer, forKey: .postalCode, auxiliaryKey: ._postalCode)
    try country?.encode(on: &codingContainer, forKey: .country, auxiliaryKey: ._country)
    try period?.encode(on: &codingContainer, forKey: .period)
    
    try super.encode(to: encoder)
  }
  
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Address else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return use == _other.use
    && type == _other.type
    && text == _other.text
    && line == _other.line
    && city == _other.city
    && district == _other.district
    && state == _other.state
    && postalCode == _other.postalCode
    && country == _other.country
    && period == _other.period
  }
  
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(use)
    hasher.combine(type)
    hasher.combine(text)
    hasher.combine(line)
    hasher.combine(city)
    hasher.combine(district)
    hasher.combine(state)
    hasher.combine(postalCode)
    hasher.combine(country)
    hasher.combine(period)
  }
}
