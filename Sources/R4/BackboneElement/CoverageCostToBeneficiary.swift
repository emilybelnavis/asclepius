//
//  CoverageCostToBeneficiary.swift
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
 Patient payments for services/products; A suite of codes indicating the cost category and associated amount
 which have been detailed in the policy and may have been included on the health card
 */
open class CoverageCostToBeneficiary: BackboneElement {
  public enum ValueX: Hashable {
    case money(Money)
    case quantity(Quantity)
  }
  
  /// Cost category
  public var type: CodableConcept?
  
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
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    type: CodableConcept? = nil,
    value: ValueX,
    exception: [CoverageCostToBeneficiaryException]? = nil
  ) {
    self.init(value: value)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
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
    
    self.type = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .type)
    self.value = tempValue!
    self.exception = try [CoverageCostToBeneficiaryException](from: codingKeyContainer, forKeyIfPresent: .exception)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
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
  public override func isEqual(to _other: Any?) -> Bool {
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
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(type)
    hasher.combine(value)
    hasher.combine(exception)
  }
}
