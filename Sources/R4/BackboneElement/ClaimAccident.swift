//
//  ClaimAccident.swift
//  FHIRKit
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

import FHIRKitCore

/**
 Details of the accident which resulted in injures that required the products and services listed in the claim
 */
open class ClaimAccident: BackboneElement {
  public enum LocationX: Hashable {
    case address(Address)
    case reference(Reference)
  }
  
  /// When the accident occured
  public var date: FHIRKitPrimitive<FHIRKitDate>
  
  /// The nature of the accident
  public var type: CodableConcept?
  
  /// Where the accident occured
  public var locationX: LocationX?
  
  public init(date: FHIRKitPrimitive<FHIRKitDate>) {
    self.date = date
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    date: FHIRKitPrimitive<FHIRKitDate>,
    type: CodableConcept? = nil,
    locationX: LocationX? = nil
  ) {
    self.init(date: date)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
    self.type = type
    self.locationX = locationX
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case date; case _date
    case type
    case locationAddress
    case locationReference
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    var tempLocationX: LocationX?
    if let locationAddress = try Address(from: codingKeyContainer, forKeyIfPresent: .locationAddress) {
      if tempLocationX != nil {
        throw DecodingError.dataCorruptedError(forKey: .locationAddress, in: codingKeyContainer, debugDescription: "More than one value provided for \"location\"")
      }
      tempLocationX = .address(locationAddress)
    }
    
    if let locationReference = try Reference(from: codingKeyContainer, forKeyIfPresent: .locationReference) {
      if tempLocationX != nil {
        throw DecodingError.dataCorruptedError(forKey: .locationReference, in: codingKeyContainer, debugDescription: "More than one value provided for \"location\"")
      }
      tempLocationX = .reference(locationReference)
    }
    
    self.date = try FHIRKitPrimitive<FHIRKitDate>(from: codingKeyContainer, forKey: .date, auxKey: ._date)
    self.type = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .type)
    self.locationX = tempLocationX
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try date.encode(on: &codingKeyContainer, forKey: .date, auxKey: ._date)
    try type?.encode(on: &codingKeyContainer, forKey: .type)
    
    if let enumLocationX = locationX {
      switch enumLocationX {
      case .address(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .locationAddress)
      case .reference(let _value):
        try _value.encode(on: &codingKeyContainer, forKey: .locationReference)
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
    && locationX == _other.locationX
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(date)
    hasher.combine(type)
    hasher.combine(locationX)
  }
}
