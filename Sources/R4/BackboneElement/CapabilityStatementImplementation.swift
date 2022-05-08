//
//  CapabilityStatementImplementation.swift
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
 Identifies a specific implementatin instance that is described by the capability statement - i.e. a particular
 installatltion, rather than the capabilities of a software program
 */
open class CapabilityStatementImplementation: BackboneElement {
  /// Describes this specific instance
  public var fhirDescription: AlexandriaHRMPrimitive<AlexandriaHRMString>
  
  /// Base URL for the installation
  public var url: AlexandriaHRMPrimitive<AlexandriaHRMURI>?
  
  /// Organization that manages the data
  public var custodian: Reference?
  
  public init(fhirDescription: AlexandriaHRMPrimitive<AlexandriaHRMString>) {
    self.fhirDescription = fhirDescription
    super.init()
  }
  
  public convenience init(
    fhirExtension: [Extension]? = nil,
    modifierExtension: [Extension]? = nil,
    fhirId: AlexandriaHRMPrimitive<AlexandriaHRMString>? = nil,
    fhirDescription: AlexandriaHRMPrimitive<AlexandriaHRMString>,
    url: AlexandriaHRMPrimitive<AlexandriaHRMURI>? = nil,
    custodian: Reference?
  ) {
    self.init(fhirDescription: fhirDescription)
    self.fhirExtension = fhirExtension
    self.modifierExtension = modifierExtension
    self.fhirId = fhirId
    self.url = url
    self.custodian = custodian
  }
  
  // MARK: - Codable
  private enum CodingKeys: String, CodingKey {
    case fhirDescription; case _fhirDescription
    case url; case _url
    case custodian
  }
  
  public required init(from decoder: Decoder) throws {
    let codingKeyContainer = try decoder.container(keyedBy: CodingKeys.self)
    
    self.fhirDescription = try AlexandriaHRMPrimitive<AlexandriaHRMString>(from: codingKeyContainer, forKey: .fhirDescription, auxKey: ._fhirDescription)
    self.url = try AlexandriaHRMPrimitive<AlexandriaHRMURI>(from: codingKeyContainer, forKeyIfPresent: .url, auxKey: ._url)
    self.custodian = try Reference(from: codingKeyContainer, forKeyIfPresent: .custodian)
    
    try super.init(from: decoder)
  }
  
  public override func encode(to encoder: Encoder) throws {
    var codingKeyContainer = encoder.container(keyedBy: CodingKeys.self)
    
    try fhirDescription.encode(on: &codingKeyContainer, forKey: .fhirDescription, auxKey: ._fhirDescription)
    try url?.encode(on: &codingKeyContainer, forKey: .url, auxKey: ._url)
    try custodian?.encode(on: &codingKeyContainer, forKey: .custodian)
    
    try super.encode(to: encoder)
  }
  
  // MARK: - Equatable
  public override func isEqual(to _other: Any?) -> Bool {
    guard let _other = _other as? CapabilityStatementImplementation else {
      return false
    }
    
    guard super.isEqual(to: _other) else {
      return false
    }
    
    return fhirDescription == _other.fhirDescription
    && url == _other.url
    && custodian == _other.custodian
  }
  
  // MARK: - Hashable
  public override func hash(into hasher: inout Hasher) {
    super.hash(into: &hasher)
    hasher.combine(fhirDescription)
    hasher.combine(url)
    hasher.combine(custodian)
  }
}
