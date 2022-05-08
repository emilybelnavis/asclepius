//
//  EffectEvidenceSynthesisEffectEstimatePrecisionEstimate.swift
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
 A description of how precise the estimate for the effect is
 */
open class EffectEvidenceSynthesisEffectEstimatePrecisionEstimate: BackboneElement { // swiftlint:disable:this type_name
  /// Type of precision estimate
  public var type: CodeableConcept?
  
  /// Level of confidence interval
  public var level: AlexandriaHRMPrimitive<AlexandriaHRMDecimal>?
  
  /// Lower bound
  public var from: AlexandriaHRMPrimitive<AlexandriaHRMDecimal>?
  
  /// Upper bound
  public var to: AlexandriaHRMPrimitive<AlexandriaHRMDecimal>?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    type: CodeableConcept? = nil,
    level: AlexandriaHRMPrimitive<AlexandriaHRMDecimal>? = nil,
    from: AlexandriaHRMPrimitive<AlexandriaHRMDecimal>? = nil,
    to: AlexandriaHRMPrimitive<AlexandriaHRMDecimal>? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.type = type
    self.level = level
    self.from = from
    self.to = to
  }
  
  // MARK: - Coding
  private enum CodingKeys: String, CodingKey {
    case type
    case level; case _level
    case from; case _from
    case to; case _to
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.type = try CodeableConcept(from: codingKeyContainer, forKeyIfPresent: .type)
    self.level = try AlexandriaHRMPrimitive<AlexandriaHRMDecimal>(from: codingKeyContainer, forKeyIfPresent: .level, auxKey: ._level)
    self.from = try AlexandriaHRMPrimitive<AlexandriaHRMDecimal>(from: codingKeyContainer, forKeyIfPresent: .from, auxKey: ._from)
    self.to = try AlexandriaHRMPrimitive<AlexandriaHRMDecimal>(from: codingKeyContainer, forKeyIfPresent: .to, auxKey: ._to)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try type?.encode(on: &codingKeyContainer, forKey: .type)
    try level?.encode(on: &codingKeyContainer, forKey: .level, auxKey: ._level)
    try from?.encode(on: &codingKeyContainer, forKey: .from, auxKey: ._from)
    try to?.encode(on: &codingKeyContainer, forKey: .to, auxKey: ._to)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? EffectEvidenceSynthesisEffectEstimatePrecisionEstimate else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return type == _other.type
    && level == _other.level
    && from == _other.from
    && to == _other.to
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(type)
    hasher.combine(level)
    hasher.combine(from)
    hasher.combine(to)
  }
}
