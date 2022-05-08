//
//  CapabilityStatementRestSecurity.swift
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

/// Information about security implementation form an interface perspective - what a client needs to know
open class CapabilityStatementRestSecurity: BackboneElement {
  /// Adds CORS headers (http://enable-cors.org/)
  public var cors: AlexandriaHRMPrimitive<AlexandriaHRMBool>?
  
  /// OAuth | SMART-on-FHIR | NTLM | Basic | Kerberos | Certificates
  public var service: [CodeableConcept]?
  
  /// General description of how security works
  public var fhirDescription: AlexandriaHRMPrimitive<AlexandriaHRMString>?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    cors: AlexandriaHRMPrimitive<AlexandriaHRMBool>? = nil,
    service: [CodeableConcept]? = nil,
    fhirDescription: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.cors = cors
    self.service = service
    self.fhirDescription = fhirDescription
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case cors; case _cors
    case service
    case fhirDescription; case _fhirDescription
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.cors = try AlexandriaHRMPrimitive<AlexandriaHRMBool>(from: codingKeyContainer, forKeyIfPresent: .cors, auxKey: ._cors)
    self.service = try [CodeableConcept](from: codingKeyContainer, forKeyIfPresent: .service)
    self.fhirDescription = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKeyIfPresent: .fhirDescription, auxKey: ._fhirDescription)
    
    try super.init(from: decoder)
  }
  
  override public func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try cors?.encode(on: &codingKeyContainer, forKey: .cors, auxKey: ._cors)
    try service?.encode(on: &codingKeyContainer, forKey: .service)
    try fhirDescription?.encode(on: &codingKeyContainer, forKey: .fhirDescription, auxKey: ._fhirDescription)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  override public func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CapabilityStatementRestSecurity else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return cors == _other.cors
    && service == _other.service
    && fhirDescription == _other.fhirDescription
  }
  
  // MARK: - Hashable
  override public func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(cors)
    hasher.combine(service)
    hasher.combine(fhirDescription)
  }
}
