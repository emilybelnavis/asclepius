//
//  CapabilityStatementRestSecurity.swift
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

/// Information about security implementation form an interface perspective - what a client needs to know
open class CapabilityStatementRestSecurity: BackboneElement {
  /// Adds CORS headers (http://enable-cors.org/)
  public var cors: FHIRKitPrimitive<FHIRKitBool>?
  
  /// OAuth | SMART-on-FHIR | NTLM | Basic | Kerberos | Certificates
  public var service: [CodableConcept]?
  
  /// General description of how security works
  public var fhirDescription: FHIRKitPrimitive<FHIRKitString>?
  
  override public init() {
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    id: FHIRKitPrimitive<FHIRKitString>? = nil,
    cors: FHIRKitPrimitive<FHIRKitBool>? = nil,
    service: [CodableConcept]? = nil,
    fhirDescription: FHIRKitPrimitive<FHIRKitString>? = nil
  ) {
    self.init()
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.id = id
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
    
    self.cors = try FHIRKitPrimitive<FHIRKitBool>(from: codingKeyContainer, forKeyIfPresent: .cors, auxKey: ._cors)
    self.service = try [CodableConcept](from: codingKeyContainer, forKeyIfPresent: .service)
    self.fhirDescription = try FHIRKitPrimitive<FHIRKitString>(from: codingKeyContainer, forKeyIfPresent: .fhirDescription, auxKey: ._fhirDescription)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try cors?.encode(on: &codingKeyContainer, forKey: .cors, auxKey: ._cors)
    try service?.encode(on: &codingKeyContainer, forKey: .service)
    try fhirDescription?.encode(on: &codingKeyContainer, forKey: .fhirDescription, auxKey: ._fhirDescription)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
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
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(cors)
    hasher.combine(service)
    hasher.combine(fhirDescription)
  }
}