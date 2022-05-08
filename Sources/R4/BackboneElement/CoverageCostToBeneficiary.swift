//
//  CoverageCostToBeneficiary.swift
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
 Patient payments for services/products; A suite of codes indicating the cost category and associated amount
 which have been detailed in the policy and may have been included on the health card
 */
open class CoverageCostToBeneficiary: BackboneElement {
  public enum ValueX: Hashable {
    case money(Money)
    case quantity(Quantity)
  }
  
  /// Cost category
  public var type: CodeableConcept?
  
  /// The amount or percentage due from the beneficiary
  public var value: ValueX
  
  /// Exceptions for patient payments
  public var exception: [CoverageCostToBeneficiaryException]?
  
  public init(value: ValueX) {
    self.value = value
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    type: CodeableConcept? = nil,
    value: ValueX,
    exception: [CoverageCostToBeneficiaryException]? = nil
  ) {
    self.init(value: value)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.type = type
    self.exception = exception
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case type
    case valueMoney
    case valueQuantity
    case exception
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    var tempValue: ValueX?
    if let valueMoney = try Money(from: codingKeyContainer, forKeyIfPresent: .valueMoney) {
      if tempValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueMoney, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tempValue = .money(valueMoney)
    }
    
    if let valueQuantity = try Quantity(from: codingKeyContainer, forKeyIfPresent: .valueQuantity) {
      if tempValue != nil {
        throw DecodingError.dataCorruptedError(forKey: .valueQuantity, in: codingKeyContainer, debugDescription: "More than one value supplied for \"value\"")
      }
      tempValue = .quantity(valueQuantity)
    }
    
    self.type = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .type)
    self.value = tempValue!
    self.exception = try [CoverageCostToBeneficiaryException](from: codingKeyContainer, forKeyIfPresent: .exception)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    switch value {
    case .money(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueMoney)
    case .quantity(let _value):
      try _value.encode(on: &codingKeyContainer, forKey: .valueQuantity)
    }
    
    try type?.encode(on: &codingKeyContainer, forKey: .type)
    try exception?.encode(on: &codingKeyContainer, forKey: .exception)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CoverageCostToBeneficiary else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return type == _other.type
    && value == _other.value
    && exception == _other.exception
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(type)
    hasher.combine(value)
    hasher.combine(exception)
  }
}
