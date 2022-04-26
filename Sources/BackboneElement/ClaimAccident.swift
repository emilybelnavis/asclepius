//
//  ClaimAccident.swift
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
 Details of the accident which resulted in injures that required the products and services listed in the claim
 */
open class ClaimAccident: BackboneElement {
  public enum _Location: Hashable {
    case address(Address)
    case reference(Reference)
  }
  
  /// When the accident occured
  public var date: FHIRKitPrimitive<FHIRKitDate>
  
  /// The nature of the accident
  public var type: CodableConcept?
  
  /// Where the accident occured
  public var location: _Location?
  
  public init(date: FHIRKitPrimitive<FHIRKitDate>) {
    self.date = date
    super.init()
  }
  
  public convenience init(
    `extension`: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    date: FHIRKitPrimitive<FHIRKitDate>,
    type: CodableConcept? = nil,
    location: _Location? = nil
  ) {
    self.init(date: date)
    self.`extension` = `extension`
    self.modifierExtension = modifierExtension
    self.id = id
    self.type = type
    self.location = location
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case date; case _date
    case type
    case locationAddress
    case locationReference
  }
  
  public required init(from decoder: Decoder) throws {
    let _container = try decoder.container(keyedBy: CodingKeys.self)
    
    var _location: _Location? = nil
    if let locationAddress = try Address(from: _container, forKeyIfPresent: .locationAddress) {
      if _location != nil {
        throw DecodingError.dataCorruptedError(forKey: .locationAddress, in: _container, debugDescription: "More than one value provided for \"location\"")
      }
      _location = .address(locationAddress)
    }
    
    if let locationReference = try Reference(from: _container, forKeyIfPresent: .locationReference) {
      if _location != nil {
        throw DecodingError.dataCorruptedError(forKey: .locationReference, in: _container, debugDescription: "More than one value provided for \"location\"")
      }
      _location = .reference(locationReference)
    }
    
    self.date = try FHIRKitPrimitive<FHIRKitDate>(from: _container, forKey: .date, auxiliaryKey: ._date)
    self.type = try CodableConcept(from: _container, forKeyIfPresent: .type)
    self.location = _location
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var _container = encoder.container(keyedBy: CodingKeys.self)
    
    try date.encode(on: &_container, forKey: .date, auxiliaryKey: ._date)
    try type?.encode(on: &_container, forKey: .type)
    
    if let _location = location {
      switch _location {
      case .address(let _value):
        try _value.encode(on: &_container, forKey: .locationAddress)
      case .reference(let _value):
        try _value.encode(on: &_container, forKey: .locationReference)
      }
    }
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ClaimAccident else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return date == _other.date
    && type == _other.type
    && location == _other.location
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(date)
    hasher.combine(type)
    hasher.combine(location)
  }
}
