//
//  ContractTermSecurityLabel.swift
//  Asclepius
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

import AsclepiusCore

/**
 Protection for the term - Security labels that protect the handling of information about the term and its elements,
 which may be specifically identified
 */
open class ContractTermSecurityLabel: BackboneElement {
  /// Link to Security Labels
  public var number: [AsclepiusPrimitive<AsclepiusUnsignedInteger>]?
  
  /// Confidentiality protection
  public var classification: Coding
  
  /// Applicable policy
  public var category: [Coding]?
  
  /// Handling Instructions
  public var control: [Coding]?
  
  public init(classification: Coding) {
    self.classification = classification
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AsclepiusPrimitive<AsclepiusString>? = nil,
    number: [AsclepiusPrimitive<AsclepiusUnsignedInteger>]? = nil,
    classification: Coding,
    category: [Coding]? = nil,
    control: [Coding]? = nil
  ) {
    self.init(classification: classification)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.number = number
    self.category = category
    self.control = control
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case number; case _number
    case classification
    case category
    case control
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.number = try [AsclepiusPrimitive<AsclepiusUnsignedInteger>](from: codingKeyContainer, forKeyIfPresent: .number, auxKey: ._number)
    self.classification = try Coding(from: codingKeyContainer, forKey: .classification)
    self.category = try [Coding](from: codingKeyContainer, forKeyIfPresent: .category)
    self.control = try [Coding](from: codingKeyContainer, forKeyIfPresent: .control)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try number?.encode(on: &codingKeyContainer, forKey: .number, auxKey: ._number)
    try classification.encode(on: &codingKeyContainer, forKey: .classification)
    try category?.encode(on: &codingKeyContainer, forKey: .category)
    try control?.encode(on: &codingKeyContainer, forKey: .control)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? ContractTermSecurityLabel else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return number == _other.number
    && classification == _other.classification
    && category == _other.category
    && control == _other.control
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(number)
    hasher.combine(classification)
    hasher.combine(category)
    hasher.combine(control)
  }
}
