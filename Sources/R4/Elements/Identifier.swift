//
//  Identifier.swift
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
 An identifier intended for computation
 
 An identifier - identifies some entity uniquely and unambiguously. Typically used for business identifiers
 */
open class Identifier: Element {
  /// The purpose of this identifier
  public var use: AlexandriaHRMPrimitive<IdentifierUse>?
  
  /// Description of identifier
  public var type: CodableConcept?
  
  /// The namespace for the identifier value
  public var system: AlexandriaHRMPrimitive<AlexandriaHRMURI>?
  
  /// The value that is unique
  public var value: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  /// Time period when is/was valid for use
  public var period: Period?
  
  /// Organization that issued id (may be just text)
  public var assigner: Reference?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    use: AlexandriaHRMPrimitive<IdentifierUse>? = nil,
    type: CodableConcept? = nil,
    system: AlexandriaHRMPrimitive<AlexandriaHRMURI>? = nil,
    value: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    period: Period? = nil,
    assigner: Reference? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.use = use
    self.type = type
    self.system = system
    self.value = value
    self.period = period
    self.assigner = assigner
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case use; case _use
    case type
    case system; case _system
    case value; case _value
    case period
    case assigner
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.use = try AlexandriaHRMPrimitive<IdentifierUse>(from: codingKeyContainer, forKeyIfPresent: .use, auxKey: ._use)
    self.type = try CodableConcept(from: codingKeyContainer, forKeyIfPresent: .type)
    self.system = try AlexandriaHRMPrimitive<AlexandriaHRMURI>(from: codingKeyContainer, forKeyIfPresent: .system, auxKey: ._system)
    self.value = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .value, auxKey: ._value)
    self.period = try Period(from: codingKeyContainer, forKeyIfPresent: .period)
    self.assigner = try Reference(from: codingKeyContainer, forKeyIfPresent: .assigner)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try use?.encode(on: &codingKeyContainer, forKey: .use, auxKey: ._use)
    try type?.encode(on: &codingKeyContainer, forKey: .type)
    try system?.encode(on: &codingKeyContainer, forKey: .system, auxKey: ._system)
    try value?.encode(on: &codingKeyContainer, forKey: .value, auxKey: ._value)
    try period?.encode(on: &codingKeyContainer, forKey: .period)
    try assigner?.encode(on: &codingKeyContainer, forKey: .assigner)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? Identifier else {
      return false
    }
    
    guard _other.isEqual(to: _other) else {
      return false
    }
    
    return use == _other.use
    && type == _other.type
    && system == _other.system
    && value == _other.value
    && period == _other.period
    && assigner == _other.assigner
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(use)
    hasher.combine(type)
    hasher.combine(value)
    hasher.combine(period)
    hasher.combine(assigner)
  }
}
