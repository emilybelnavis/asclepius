//
//  AdverseEventSuspectEntity.swift
//  AlexandriaHRM
//  Module: STU3
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

/// Describes the entity that is suspected to have caused the adverse event
open class AdverseEventSuspectEntity: BackboneElement {
  /// Refers to the specific entity that caused the adverse event
  public var instance: Reference
  
  /// Information on the possible cause of the event
  public var causality: [AdverseEventSuspectEntityCausality]?
  
  public init(instance: Reference) {
    self.instance = instance
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    instance: Reference,
    causality: [AdverseEventSuspectEntityCausality]? = nil
  ) {
    self.init(instance: instance)
    self.fhirExtension = fhirExtension
    self.fhirId = fhirId
    self.causality = causality
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case instance
    case causality
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.instance = try Reference(from: codingKeyContainer, forKey: .instance)
    self.causality = try [AdverseEventSuspectEntityCausality](from: codingKeyContainer, forKeyIfPresent: .causality)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try instance.encode(on: &codingKeyContainer, forKey: .instance)
    try causality?.encode(on: &codingKeyContainer, forKey: .causality)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? AdverseEventSuspectEntity else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return instance == _other.instance
    && causality == _other.causality
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(instance)
    hasher.combine(causality)
  }
}
