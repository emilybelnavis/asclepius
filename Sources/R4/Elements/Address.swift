//
//  Address.swift
//  AlexandriaHRM
//  Module: R4
//
//  Copyright (c) 2022 Bitmatic Ltd.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

import AlexandriaHRMCore

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
  public var use: AlexandriaHRMPrimitive<AddressUse>?
  /// Type of address ( postal | physical | both)
  public var type: AlexandriaHRMPrimitive<AddressType>?
  
  /// Text representatoin of the address
  public var text: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// Street name, number, direction & P.O Box etc.
  /// This repeating element order: The order in which the lines should appear in an address
  /// label
  public var line: [AlexandriaHRMPrimitive<AlexandriaHRMString>]?
  
  /// Name of city, town, etc...
  public var city: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// Name of district/county
  public var district: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// Sub-unit of country (abbreviations can be used here)
  public var state: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// Postal code for address
  public var postalCode: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// Country code using either ISO:3166 2 or 3 letter country code
  public var country: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// Time period when address was/is in use
  public var period: Period?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    use: AlexandriaHRMPrimitive<AddressUse>? = nil,
    type: AlexandriaHRMPrimitive<AddressType>? = nil,
    line: [AlexandriaHRMPrimitive<AlexandriaHRMString>]? = nil,
    city: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    district: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    state: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    postalCode: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    country: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    period: Period? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
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
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.use = try AlexandriaHRMPrimitive<AddressUse>(from: codingKeyContainer, forKeyIfPresent: .use, auxKey: ._use)
    self.type = try AlexandriaHRMPrimitive<AddressType>(from: codingKeyContainer, forKeyIfPresent: .type, auxKey: ._type)
    self.text = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .text, auxKey: ._text)
    self.line = try [AlexandriaHRMPrimitive<AlexandriaHRMString>](from: codingKeyContainer, forKeyIfPresent: .line, auxKey: ._line)
    self.city = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .city, auxKey: ._city)
    self.district = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .district, auxKey: ._district)
    self.state = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .state, auxKey: ._state)
    self.postalCode = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .postalCode, auxKey: ._postalCode)
    self.country = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .country, auxKey: ._country)
    self.period = try Period(from: codingKeyContainer, forKeyIfPresent: .period)
    
    try super.init(from: decoder)
  }
  
  /// encodable
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try use?.encode(on: &codingKeyContainer, forKey: .use, auxKey: ._use)
    try type?.encode(on: &codingKeyContainer, forKey: .type, auxKey: ._type)
    try text?.encode(on: &codingKeyContainer, forKey: .text, auxKey: ._text)
    try line?.encode(on: &codingKeyContainer, forKey: .line, auxKey: ._line)
    try city?.encode(on: &codingKeyContainer, forKey: .city, auxKey: ._city)
    try district?.encode(on: &codingKeyContainer, forKey: .district, auxKey: ._district)
    try state?.encode(on: &codingKeyContainer, forKey: .state, auxKey: ._state)
    try postalCode?.encode(on: &codingKeyContainer, forKey: .postalCode, auxKey: ._postalCode)
    try country?.encode(on: &codingKeyContainer, forKey: .country, auxKey: ._country)
    try period?.encode(on: &codingKeyContainer, forKey: .period)
    
    try super.encode(to: encoder)
  }
  
  override public func isEqual(to _other: Any?) -> Bool {
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
  
  override public func hash(into hasher: inout Hasher) {
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
